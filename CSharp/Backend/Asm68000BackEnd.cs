using System.Reflection;
using System.Reflection.Emit;
using System.Text;
using JumpCS.Core;

namespace JumpCS.Backend
{
    /// <summary>68000 assembly code backend</summary>
    public class Asm68000BackEnd : BackEnd
    {
        private StreamWriter? _asmWriter;
        private int _labelCounter = 0;
        private Dictionary<string, int> _methodOffsets = new();
        private Dictionary<int, MethodMetadata?> _methodCache = new ();
        private int _currentOffset = 0;

        // 68000 Register allocation
        private const string D0 = "D0";    // Temporary/return value
        private const string D1 = "D1";    // Temporary
        private const string A0 = "A0";    // Address register
        private const string A1 = "A1";    // Address register
        private const string A6 = "A6";    // Frame pointer
        private const string A7 = "A7";    // Stack pointer

        /// <summary>Stack simulator for tracking evaluation stack during MSIL translation</summary>
        private class StackSimulator
        {
            private List<(string Register, int FrameOffset)> _stack = new();
            private int _nextFrameOffset = 0;
            private readonly int _maxLocals;
            private readonly int _maxStack;

            public int StackDepth => _stack.Count;
            public int CurrentFrameOffset => _nextFrameOffset;

            public StackSimulator(int maxLocals, int maxStack)
            {
                _maxLocals = maxLocals;
                _maxStack = maxStack;
                _nextFrameOffset = -maxLocals * 4;
            }

            /// <summary>Push a value onto the evaluation stack</summary>
            public void Push(string register)
            {
                if (_stack.Count >= _maxStack)
                    throw new InvalidOperationException("Evaluation stack overflow");

                if (_stack.Count < 2)
                {
                    // Keep values in registers while possible
                    _stack.Add((register, -1));
                }
                else
                {
                    // Spill to stack frame when registers are exhausted
                    int frameOffset = _nextFrameOffset;
                    _nextFrameOffset -= 4;
                    _stack.Add((register, frameOffset));
                }
            }

            /// <summary>Pop a value from the evaluation stack into target register</summary>
            public string Pop()
            {
                if (_stack.Count == 0)
                    throw new InvalidOperationException("Evaluation stack underflow");

                var (register, frameOffset) = _stack[^1];
                _stack.RemoveAt(_stack.Count - 1);

                if (frameOffset >= 0)
                {
                    // Value was spilled to stack, reload it
                    return register; // Caller should generate load instruction
                }

                return register;
            }

            /// <summary>Peek at top of stack without popping</summary>
            public string Peek()
            {
                if (_stack.Count == 0)
                    throw new InvalidOperationException("Evaluation stack is empty");

                return _stack[^1].Register;
            }

            /// <summary>Clear the stack</summary>
            public void Clear()
            {
                _stack.Clear();
                _nextFrameOffset = -_maxLocals * 4;
            }
        }

        /// <summary>Label mapping for control flow targets</summary>
        private class LabelMapper
        {
            private Dictionary<int, string> _offsetToLabel = new();

            public string GetOrCreateLabel(int msilOffset)
            {
                if (!_offsetToLabel.TryGetValue(msilOffset, out var label))
                {
                    label = $"L_{msilOffset:X4}";
                    _offsetToLabel[msilOffset] = label;
                }
                return label;
            }

            public void Clear()
            {
                _offsetToLabel.Clear();
            }
        }

        public Asm68000BackEnd(string outputBaseName) : base(outputBaseName)
        {
        }

        /// <summary>Update dependencies and calculate code sizes</summary>
        public override void UpdateAll()
        {
            _methodCache.Clear();
            _methodOffsets.Clear();
            _currentOffset = 0;

            // First pass: analyze MSIL to find method dependencies
            AnalyzeMsilDependencies();

            // Second pass: calculate offsets for all needed methods
            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
                foreach (var method in cls.Methods.Where(m => m.IsNeeded))
                {
                    _methodOffsets[method.ToString()] = _currentOffset;
                    // Estimate method size (very rough)
                    _currentOffset += method.CodeLength * 3; // MSIL to 68000 is ~3x larger
                }
            }
        }

        /// <summary>Analyze MSIL bytecode to discover method call dependencies</summary>
        private void AnalyzeMsilDependencies()
        {
            // Create snapshot of classes to avoid "collection modified" exceptions
            var classesToAnalyze = ClassMetadata.AllClasses.Where(c => c.IsNeeded).ToList();
            
            foreach (var cls in classesToAnalyze)
            {
                // Create snapshot of methods to avoid "collection modified" exceptions
                var methodsToAnalyze = cls.Methods
                    .Where(m => m.IsNeeded && m.Code != null && m.Code.Length > 0)
                    .ToList();
                
                foreach (var method in methodsToAnalyze)
                {
                    try
                    {
                        var iterator = new MsilIterator(method.Code, method);
                        while (iterator.MoveNext())
                        {
                            var opcode = iterator.CurrentOpcode;
                            var operand = iterator.CurrentOperand;

                            // Look for Call and Callvirt opcodes
                            if ((opcode == OpCodes.Call || opcode == OpCodes.Callvirt) && 
                                operand is int methodToken)
                            {
                                // Resolve the method token to actual method
                                var targetMethod = ResolveMethodToken(method.OwningClass, methodToken);
                                if (targetMethod != null && !targetMethod.IsNeeded)
                                {
                                    // Mark the target method as needed
                                    targetMethod.MarkNeeded($"Called from {method.OwningClass.FullName}.{method.Name}");
                                    Program.SetNeedsNewIteration();
                                }
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        if (Program.CodeOptions?.Verbosity > 1)
                            Console.WriteLine($"Warning: Failed to analyze MSIL for {method}: {ex.Message}");
                    }
                }
            }
        }

        private MethodBase? MyGetMethodInfo(ClassMetadata callingClass, int methodToken)
        {
            try
            {
                // Resolve the metadata token to a MethodHandle
                var module = callingClass.ReflectionType?.Module;
                var resolveMethod = module?.ResolveMethod(methodToken);
                RuntimeMethodHandle methodHandle = resolveMethod != null ? resolveMethod.MethodHandle : new RuntimeMethodHandle();
                switch (resolveMethod?.Module.Name)
                {
                    case null:
                    case "System.Private.CoreLib.dll":
                        return null;
                }
                return MethodBase.GetMethodFromHandle(methodHandle);
            }
            catch (Exception ex)
            {
                if (Program.CodeOptions?.Verbosity > 1)
                    Console.WriteLine($"Warning: Could not resolve method token {methodToken:X8}: {ex.Message}");
                return null;
            }
        }

        /// <summary>Resolve a method token to actual method metadata</summary>
        private MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken)
        {
            if (_methodCache.ContainsKey(methodToken))
                return _methodCache[methodToken];

            // Try to resolve using reflection metadata
            if (callingClass.ReflectionType?.Module is null)
            {
                if (Program.CodeOptions?.Verbosity > 2)
                    Console.WriteLine($"  Token {methodToken:X8}: No module in calling class {callingClass.FullName}");
                return null;
            }

            try
            {
                // Get the MethodBase from the handle
                var methodInfo = MyGetMethodInfo(callingClass, methodToken);

                if (methodInfo?.DeclaringType is null)
                {
                    if (Program.CodeOptions?.Verbosity > 2)
                        Console.WriteLine($"  Token {methodToken:X8}: MethodBase has no declaring type");
                    _methodCache.Add(methodToken, null);
                    return null;
                }

                // Resolve the declaring type to get the correct class context
                var targetClass = ClassMetadata.ForName(methodInfo.DeclaringType.FullName ?? "");
                if (targetClass is null)
                {
                    if (Program.CodeOptions?.Verbosity > 2)
                        Console.WriteLine($"  Token {methodToken:X8}: Target class not found: {methodInfo.DeclaringType.FullName}");
                    _methodCache.Add(methodToken, null);
                    return null;
                }

                var signature = GetMethodSignature(methodInfo);
                var resolvedMethod = targetClass.FindMethod(methodInfo.Name, signature);

                if (resolvedMethod != null && Program.CodeOptions?.Verbosity > 2)
                {
                    Console.WriteLine($"  Token {methodToken:X8} → {targetClass.FullName}.{methodInfo.Name}{signature}");
                }
                else if (Program.CodeOptions?.Verbosity > 2)
                {
                    Console.WriteLine($"  Token {methodToken:X8}: Method not found in class: {methodInfo.Name}{signature}");
                }

                _methodCache.Add(methodToken, resolvedMethod);

                return resolvedMethod;
            }
            catch (Exception ex)
            {
                if (Program.CodeOptions?.Verbosity > 1)
                    Console.WriteLine($"Warning: Could not resolve method token {methodToken:X8}: {ex.Message}");
                return null;
            }
        }
        /// <summary>Get JVM method signature from reflection</summary>
        private string GetMethodSignature(System.Reflection.MethodBase method)
        {
            var paramTypes = method.GetParameters()
                .Select(p => GetTypeSignature(p.ParameterType))
                .ToList();

            string returnType = method is System.Reflection.MethodInfo mi ? 
                GetTypeSignature(mi.ReturnType) : "V";
            
            var paramList = string.Concat(paramTypes);
            return $"({paramList}){returnType}";
        }

        /// <summary>Get JVM type signature for a type</summary>
        private string GetTypeSignature(Type type)
        {
            return type.Name switch
            {
                "Void" => "V",
                "Boolean" => "Z",
                "Byte" => "B",
                "Char" => "C",
                "Short" => "S",
                "Int32" => "I",
                "Int64" => "J",
                "Single" => "F",
                "Double" => "D",
                _ => $"L{type.FullName?.Replace(".", "/")};",
            };
        }

        /// <summary>Generate 68000 assembly output</summary>
        public override void Generate()
        {
            string outputPath = $"{OutputBaseName}_generated.asm";
            Console.WriteLine($"Generating 68000 assembly: {outputPath}");

            using (_asmWriter = new StreamWriter(outputPath, false, Encoding.ASCII))
            {
                WriteHeader();
                WriteClassDefinitions();
                WriteClassTable();
                WriteMethodImplementations();
                WriteDataSection();
                WriteFooter();
            }

            AddGeneratedFile(outputPath);
        }

        private void WriteHeader()
        {
            _asmWriter?.WriteLine("; Generated 68000 Assembly Code");
            _asmWriter?.WriteLine("; Converted from C# MSIL");
            _asmWriter?.WriteLine($"; Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
            _asmWriter?.WriteLine();
            _asmWriter?.WriteLine("    ; --- Code Section ---");
            _asmWriter?.WriteLine("    SECTION CODE");
            _asmWriter?.WriteLine();
        }

        private void WriteClassDefinitions()
        {
            _asmWriter?.WriteLine("    ; --- Class Definitions ---");
            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
                _asmWriter?.WriteLine($"; Class: {cls.FullName}");
                _asmWriter?.WriteLine($"    CLASS_{cls.ClassIndex} EQU {cls.ClassIndex}");
                _asmWriter?.WriteLine($"    CLASS_SIZE_{cls.ClassIndex} EQU {cls.DataSize}");
            }
            _asmWriter?.WriteLine();
        }

        private void WriteClassTable()
        {
            _asmWriter?.WriteLine("    ; --- Class Table ---");
            _asmWriter?.WriteLine("CLASS_TABLE:");

            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.ClassIndex >= 0))
            {
                _asmWriter?.WriteLine($"    DC.L {cls.FullName}_vtable     ; Class {cls.FullName}");
                _asmWriter?.WriteLine($"    DC.L {cls.DataSize}             ; Instance size");
            }
            _asmWriter?.WriteLine();
        }

        private void WriteMethodImplementations()
        {
            _asmWriter?.WriteLine("    ; --- Method Implementations ---");

            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
                WriteClassMethods(cls);
            }
        }

        private void WriteClassMethods(ClassMetadata cls)
        {
            _asmWriter?.WriteLine($"; Methods of {cls.FullName}");

            foreach (var method in cls.Methods.Where(m => m.IsNeeded))
            {
                WriteMethod(cls, method);
            }
            _asmWriter?.WriteLine();
        }

        private void WriteMethod(ClassMetadata cls, MethodMetadata method)
        {
            string methodLabel = GetMethodLabel(cls, method);
            _asmWriter?.WriteLine($"{methodLabel}:");

            if (method.IsConstructor)
            {
                WriteConstructorCode(cls, method);
            }
            else if (method.IsStaticConstructor)
            {
                WriteStaticConstructorCode(cls, method);
            }
            else if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToAsm(method);
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: Implement {method.Name}{method.Signature}");
            }

            _asmWriter?.WriteLine("    RTS");
            _asmWriter?.WriteLine();
        }

        private void WriteConstructorCode(ClassMetadata cls, MethodMetadata method)
        {
            _asmWriter?.WriteLine("    ; Constructor prologue");
            _asmWriter?.WriteLine("    MOVEM.L A6,-(A7)     ; Save return address");
            _asmWriter?.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            _asmWriter?.WriteLine("    SUBI.L #" + cls.DataSize + ",A7");
            _asmWriter?.WriteLine();
            _asmWriter?.WriteLine("    ; Initialize fields");
            _asmWriter?.WriteLine("    LEA (0,A6),A0");
            _asmWriter?.WriteLine("    MOVE.L #0,D0");
            _asmWriter?.WriteLine("    MOVE.L D0,(A0)+");
            _asmWriter?.WriteLine();
            _asmWriter?.WriteLine("    MOVEM.L (A7)+,A6");
        }

        private void WriteStaticConstructorCode(ClassMetadata cls, MethodMetadata method)
        {
            _asmWriter?.WriteLine("    ; Static constructor prologue");
            _asmWriter?.WriteLine("    ; Initialize static fields");
        }

        private void WriteMsilToAsm(MethodMetadata method)
        {
            _asmWriter?.WriteLine("    ; Method prologue");
            _asmWriter?.WriteLine("    MOVEM.L A6,-(A7)     ; Save return address");
            _asmWriter?.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            _asmWriter?.WriteLine($"    SUBI.L #{method.MaxLocals * 4},A7 ; Allocate locals");
            _asmWriter?.WriteLine();

            // Skip translation if no IL code or invalid stack/locals metadata
            if (method.Code == null || method.Code.Length == 0)
            {
                _asmWriter?.WriteLine("    ; No MSIL code (abstract, P/Invoke, or interface method)");
                return;
            }

            // Ensure reasonable stack/locals values
            int maxStack = Math.Max(method.MaxStack, 2);  // Minimum of 2 registers
            int maxLocals = Math.Max(method.MaxLocals, 0);

            var stackSim = new StackSimulator(maxLocals, maxStack);
            var labelMapper = new LabelMapper();
            var msilIterator = new MsilIterator(method.Code, method);

            _asmWriter?.WriteLine($"    ; MSIL Code ({method.CodeLength} bytes, {maxStack} max stack, {maxLocals} locals)");
            _asmWriter?.WriteLine();

            // Iterate through MSIL instructions and translate each one
            while (msilIterator.MoveNext())
            {
                TranslateOpcode(msilIterator, method, stackSim, labelMapper);
            }

            _asmWriter?.WriteLine();
            _asmWriter?.WriteLine("    ; Method epilogue");
            _asmWriter?.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        /// <summary>Translate a single MSIL opcode to 68000 assembly</summary>
        private void TranslateOpcode(MsilIterator iterator, MethodMetadata method, StackSimulator stack, LabelMapper labels)
        {
            OpCode opcode = iterator.CurrentOpcode;
            object? operand = iterator.CurrentOperand;

            _asmWriter?.WriteLine($"    ; Offset {iterator.CurrentIndex:X4}: {opcode.Name}");

            // Load constants
            if (opcode == OpCodes.Ldc_I4_0)
            {
                _asmWriter?.WriteLine("    CLR.L D0             ; Load 0");
                stack.Push(D0);
            }
            else if (opcode == OpCodes.Ldc_I4_1)
            {
                _asmWriter?.WriteLine("    MOVE.L #1,D0         ; Load 1");
                stack.Push(D0);
            }
            else if (opcode == OpCodes.Ldc_I4)
            {
                if (operand is int intVal)
                {
                    _asmWriter?.WriteLine($"    MOVE.L #{intVal},D0  ; Load constant");
                    stack.Push(D0);
                }
            }
            else if (opcode == OpCodes.Ldc_I8)
            {
                if (operand is long longVal)
                {
                    _asmWriter?.WriteLine($"    MOVE.L #{(int)(longVal >> 32)},D0     ; Load high word");
                    _asmWriter?.WriteLine($"    MOVE.L #{(int)(longVal & 0xFFFFFFFF)},D1 ; Load low word");
                    stack.Push(D0);
                    stack.Push(D1);
                }
            }
            else if (opcode == OpCodes.Ldc_R8)
            {
                if (operand is double dVal)
                {
                    _asmWriter?.WriteLine($"    LEA DOUBLE_CONST_{iterator.CurrentIndex:X4}(PC),A0");
                    _asmWriter?.WriteLine($"    MOVE.L (A0),D0");
                    _asmWriter?.WriteLine($"    MOVE.L 4(A0),D1");
                    stack.Push(D0);
                    stack.Push(D1);
                }
            }
            // Load local variables
            else if (opcode == OpCodes.Ldloc)
            {
                if (operand is int localIndex)
                {
                    int offset = -4 - (localIndex * 4);
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    MOVE.L {offset}(A6),{targetReg} ; Load local {localIndex}");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldloc_0)
            {
                {
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    MOVE.L -4(A6),{targetReg}   ; Load local 0");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldloc_1)
            {
                {
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    MOVE.L -8(A6),{targetReg}   ; Load local 1");
                    stack.Push(targetReg);
                }
            }
            // Store local variables
            else if (opcode == OpCodes.Stloc)
            {
                if (operand is int storeIdx)
                {
                    int offset = -4 - (storeIdx * 4);
                    string src = stack.Pop();
                    _asmWriter?.WriteLine($"    MOVE.L {src},{offset}(A6) ; Store to local {storeIdx}");
                }
            }
            else if (opcode == OpCodes.Stloc_0)
            {   
                string src = stack.Pop();
                _asmWriter?.WriteLine($"    MOVE.L {src},-4(A6)  ; Store to local 0");
            }
            else if (opcode == OpCodes.Stloc_1)
            {
                string src = stack.Pop();
                _asmWriter?.WriteLine($"    MOVE.L {src},-8(A6)  ; Store to local 1");
            }
            // Arithmetic operations
            else if (opcode == OpCodes.Add)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                _asmWriter?.WriteLine($"    ADD.L {val2},{val1}  ; Add");
                stack.Push(val1);
            }
            else if (opcode == OpCodes.Sub)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                _asmWriter?.WriteLine($"    SUB.L {val2},{val1}  ; Subtract");
                stack.Push(val1);
            }
            else if (opcode == OpCodes.Mul)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                _asmWriter?.WriteLine($"    MULS.L {val2},{val1} ; Multiply");
                stack.Push(val1);
            }
            else if (opcode == OpCodes.Div)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                _asmWriter?.WriteLine($"    DIVS.L {val2},{val1} ; Divide");
                stack.Push(val1);
            }
            // Comparison and branching
            else if (opcode == OpCodes.Brfalse || opcode == OpCodes.Brfalse_S)
            {
                string val = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    TST.L {val}");
                _asmWriter?.WriteLine($"    BEQ {label}");
            }
            else if (opcode == OpCodes.Brtrue || opcode == OpCodes.Brtrue_S)
            {
                string val = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    TST.L {val}");
                _asmWriter?.WriteLine($"    BNE {label}");
            }
            else if (opcode == OpCodes.Br || opcode == OpCodes.Br_S)
            {
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    BRA {label}");
            }
            else if (opcode == OpCodes.Beq || opcode == OpCodes.Beq_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BEQ {label}");
            }
            else if (opcode == OpCodes.Bne_Un || opcode == OpCodes.Bne_Un_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BNE {label}");
            }
            // Method calls
            else if (opcode == OpCodes.Call || opcode == OpCodes.Callvirt)
            {
                if (operand is int methodToken)
                {
                    var targetMethod = ResolveMethodToken(method.OwningClass, methodToken);

                    if (targetMethod != null)
                    {
                        string methodLabel = GetMethodLabel(targetMethod.OwningClass, targetMethod);
                        _asmWriter?.WriteLine($"    ; Call {targetMethod.OwningClass.FullName}.{targetMethod.Name}{targetMethod.Signature}");
                        _asmWriter?.WriteLine($"    JSR {methodLabel}");

                        // Only push return value if method is not void
                        if (targetMethod.Signature != "()V" && !targetMethod.Signature.EndsWith(")V"))
                        {
                            stack.Push(D0); // Return value in D0
                            if (Program.CodeOptions?.Verbosity > 2)
                            {
                                _asmWriter?.WriteLine($"    ; Return value pushed (non-void method)");
                            }
                        }
                        else
                        {
                            if (Program.CodeOptions?.Verbosity > 2)
                            {
                                _asmWriter?.WriteLine($"    ; Void method, no return value");
                            }
                        }
                    }
                    else
                    {
                        // Fallback to token-based label if resolution fails
                        _asmWriter?.WriteLine($"    ; Call method token {methodToken:X8} (unresolved)");
                        _asmWriter?.WriteLine($"    JSR UNKNOWN_METHOD_{methodToken:X8}");
                        stack.Push(D0); // Assume it might return something
                    }
                }
            }
            // Return
            else if (opcode == OpCodes.Ret)
            {
                if (stack.StackDepth > 0)
                {
                    string retVal = stack.Pop();
                    if (retVal != D0)
                    {
                        _asmWriter?.WriteLine($"    MOVE.L {retVal},D0  ; Move return value to D0");
                    }
                }
                else
                {
                    _asmWriter?.WriteLine("    CLR.L D0            ; Clear return value (void)");
                }
            }
            // Stack operations
            else if (opcode == OpCodes.Pop)
            {
                stack.Pop();
                _asmWriter?.WriteLine("    ; Pop");
            }
            else if (opcode == OpCodes.Dup)
            {
                string val = stack.Peek();
                _asmWriter?.WriteLine($"    ; Duplicate {val}");
                stack.Push(val);
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: {opcode.Name}");
            }

            _asmWriter?.WriteLine();
        }

        private void WriteDataSection()
        {
            _asmWriter?.WriteLine("    ; --- Data Section ---");
            _asmWriter?.WriteLine("    SECTION DATA");
            _asmWriter?.WriteLine();

            // Write virtual tables
            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.ClassIndex >= 0))
            {
                WriteVtable(cls);
            }
        }

        private void WriteVtable(ClassMetadata cls)
        {
            _asmWriter?.WriteLine($"{cls.FullName}_vtable:");
            _asmWriter?.WriteLine($"    DC.L {cls.FullName}         ; Class pointer");

            foreach (var method in cls.Vtable)
            {
                _asmWriter?.WriteLine($"    DC.L {GetMethodLabel(cls, method)}");
            }
            _asmWriter?.WriteLine();
        }

        private void WriteFooter()
        {
            _asmWriter?.WriteLine("    END");
        }

        private string GetMethodLabel(ClassMetadata cls, MethodMetadata method)
        {
            return $"{cls.FullName}_{method.Name}";
        }

        private string GetUniqueLabel()
        {
            return $"L_{_labelCounter++}";
        }

        /// <summary>Get an available register for the next stack push, spilling if necessary</summary>
        private string GetAvailableRegister(StackSimulator stack)
        {
            // If stack has 0-1 items, we have registers available
            if (stack.StackDepth < 2)
            {
                // Return D0 or D1 based on stack depth
                return stack.StackDepth == 0 ? D0 : D1;
            }
            
            // Stack is full, need to spill to frame
            // Pop the oldest value and spill it
            string spilledReg = stack.Peek();
            int spillOffset = stack.CurrentFrameOffset;
            _asmWriter?.WriteLine($"    MOVE.L {spilledReg},{spillOffset}(A6)  ; Spill to frame");
            stack.Pop();
            
            // Now we have a free register
            return D0;
        }
    }
}