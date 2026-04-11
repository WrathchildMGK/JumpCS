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
            private List<string> _stack = new();
            private int _spillOffset;
            private readonly int _maxLocals;
            private readonly int _maxStack;
            private readonly string[] _dataRegisters = { "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7" };

            public int StackDepth => _stack.Count;
            public int CurrentFrameOffset => _spillOffset;

            public StackSimulator(int maxLocals, int maxStack)
            {
                _maxLocals = maxLocals;
                _maxStack = maxStack;
                _spillOffset = -maxLocals * 4 - 4;
            }

            /// <summary>Get next available register based on current stack depth</summary>
            public string GetNextRegister()
            {
                int registerIndex = _stack.Count;
                
                if (registerIndex < _dataRegisters.Length)
                {
                    return _dataRegisters[registerIndex];
                }
                
                return _dataRegisters[registerIndex % _dataRegisters.Length];
            }

            /// <summary>Push a register onto the evaluation stack</summary>
            public void Push(string register)
            {
                if (_stack.Count >= _maxStack)
                    throw new InvalidOperationException("Evaluation stack overflow");
                _stack.Add(register);
            }

            /// <summary>Pop a register from the evaluation stack</summary>
            public string Pop()
            {
                if (_stack.Count == 0)
                    throw new InvalidOperationException("Evaluation stack underflow");
                string register = _stack[^1];
                _stack.RemoveAt(_stack.Count - 1);
                return register;
            }

            /// <summary>Peek at top of stack without popping</summary>
            public string Peek()
            {
                if (_stack.Count == 0)
                    throw new InvalidOperationException("Evaluation stack is empty");
                return _stack[^1];
            }

            /// <summary>Clear the stack and reset register allocation</summary>
            public void Clear()
            {
                _stack.Clear();
                _spillOffset = -_maxLocals * 4 - 4;
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
                        if (Program.CodeOptions?.Verbosity >= 1)
                            Console.WriteLine($"Warning: Failed to analyze MSIL for {method}: {ex.Message}");
                    }
                }
            }
        }

        private MethodBase? MyGetMethodInfo(ClassMetadata callingClass, int methodToken)
        {
            try
            {
                var module = callingClass.ReflectionType?.Module;
                
                if (module == null)
                    return null;

                MethodBase? resolveMethod = null;
                try
                {
                    resolveMethod = module.ResolveMethod(methodToken);
                }
                catch
                {
                    // Module resolution failed - this is expected for cross-assembly refs
                    // Continue to fallback below
                }
                
                if (resolveMethod == null)
                    return null;

                RuntimeMethodHandle methodHandle = resolveMethod.MethodHandle;
                return MethodBase.GetMethodFromHandle(methodHandle);
            }
            catch (Exception ex)
            {
                if (Program.CodeOptions?.Verbosity >= 1)
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
                if (Program.CodeOptions?.Verbosity > 1)
                    Console.WriteLine($"  Token {methodToken:X8}: No module in calling class {callingClass.FullName}");
                return null;
            }

            try
            {
                // Get the MethodBase from the handle
                var methodInfo = MyGetMethodInfo(callingClass, methodToken);

                if (methodInfo?.DeclaringType is null)
                {
                    if (Program.CodeOptions?.Verbosity > 1)
                        Console.WriteLine($"  Token {methodToken:X8}: MethodBase has no declaring type");
                    _methodCache.Add(methodToken, null);
                    return null;
                }

                // Resolve the declaring type to get the correct class context
                var targetClass = ClassMetadata.ForName(methodInfo.DeclaringType.FullName ?? "");
                if (targetClass is null)
                {
                    if (Program.CodeOptions?.Verbosity > 1)
                        Console.WriteLine($"  Token {methodToken:X8}: Target class not found: {methodInfo.DeclaringType.FullName}");
                    _methodCache.Add(methodToken, null);
                    return null;
                }

                var signature = GetMethodSignature(methodInfo);
                var resolvedMethod = targetClass.FindMethod(methodInfo.Name, signature);

                if (resolvedMethod != null && Program.CodeOptions?.Verbosity > 1)
                {
                    Console.WriteLine($"  Token {methodToken:X8} → {targetClass.FullName}.{methodInfo.Name}{signature}");
                }
                else if (Program.CodeOptions?.Verbosity > 1)
                {
                    Console.WriteLine($"  Token {methodToken:X8}: Method not found in class: {methodInfo.Name}{signature}");
                }

                _methodCache.Add(methodToken, resolvedMethod);

                return resolvedMethod;
            }
            catch (Exception ex)
            {
                if (Program.CodeOptions?.Verbosity >= 1)
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
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    CLR.L {targetReg}             ; Load 0");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_1)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L #1,{targetReg}         ; Load 1");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_2)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L #2,{targetReg}         ; Load 2");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_3)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L #3,{targetReg}         ; Load 3");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_4)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L #4,{targetReg}         ; Load 4");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_5)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L #5,{targetReg}         ; Load 5");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_M1)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L #-1,{targetReg}        ; Load -1");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4)
            {
                if (operand is int intVal)
                {
                    string targetReg = stack.GetNextRegister();
                    _asmWriter?.WriteLine($"    MOVE.L #{intVal},{targetReg}  ; Load constant");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldc_I4_S)
            {
                if (operand is int shortIntVal)
                {
                    string targetReg = stack.GetNextRegister();
                    _asmWriter?.WriteLine($"    MOVE.L #{shortIntVal},{targetReg}  ; Load short constant");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldc_I8)
            {
                if (operand is long longVal)
                {
                    string targetReg1 = stack.GetNextRegister();
                    string targetReg2 = stack.GetNextRegister();
                    _asmWriter?.WriteLine($"    MOVE.L #{(int)(longVal >> 32)},{targetReg1}     ; Load high word");
                    _asmWriter?.WriteLine($"    MOVE.L #{(int)(longVal & 0xFFFFFFFF)},{targetReg2} ; Load low word");
                    stack.Push(targetReg1);
                    stack.Push(targetReg2);
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
                    string targetReg = stack.GetNextRegister();
                    _asmWriter?.WriteLine($"    MOVE.L {offset}(A6),{targetReg} ; Load local {localIndex}");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldloc_0)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L -4(A6),{targetReg}   ; Load local 0");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldloc_1)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L -8(A6),{targetReg}   ; Load local 1");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldloc_2)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L -12(A6),{targetReg}  ; Load local 2");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldloc_3)
            {
                string targetReg = stack.GetNextRegister();
                _asmWriter?.WriteLine($"    MOVE.L -16(A6),{targetReg}  ; Load local 3");
                stack.Push(targetReg);
            }
            // Load local variable address (for passing by reference)
            else if (opcode == OpCodes.Ldloca_S)
            {
                if (operand is int localAddr)
                {
                    int offset = -4 - (localAddr * 4);
                    string targetReg = stack.GetNextRegister();
                    _asmWriter?.WriteLine($"    LEA {offset}(A6),{targetReg}  ; Load address of local {localAddr}");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldloca)
            {
                if (operand is int localAddrIdx)
                {
                    int offset = -4 - (localAddrIdx * 4);
                    string targetReg = stack.GetNextRegister();
                    _asmWriter?.WriteLine($"    LEA {offset}(A6),{targetReg}  ; Load address of local {localAddrIdx}");
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
            else if (opcode == OpCodes.Stloc_2)
            {
                string src = stack.Pop();
                _asmWriter?.WriteLine($"    MOVE.L {src},-12(A6)  ; Store to local 2");
            }
            else if (opcode == OpCodes.Stloc_3)
            {
                string src = stack.Pop();
                _asmWriter?.WriteLine($"    MOVE.L {src},-16(A6)  ; Store to local 3");
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
                        // Check for System.Decimal special handling
                        if (IsSystemDecimalMethod(targetMethod))
                        {
                            HandleSystemDecimalCall(targetMethod, stack);
                        }
                        else
                        {
                            string methodLabel = GetMethodLabel(targetMethod.OwningClass, targetMethod);
                            _asmWriter?.WriteLine($"    ; Call {targetMethod.OwningClass.FullName}.{targetMethod.Name}{targetMethod.Signature}");
                            _asmWriter?.WriteLine($"    JSR {methodLabel}");

                            // Only push return value if method is not void
                            if (targetMethod.Signature != "()V" && !targetMethod.Signature.EndsWith(")V"))
                            {
                                stack.Push(D0);
                                if (Program.CodeOptions?.Verbosity > 1)
                                {
                                    _asmWriter?.WriteLine($"    ; Return value pushed (non-void method)");
                                }
                            }
                        }
                    }
                    else
                    {
                        // Method not in our compiled metadata - try reflection for framework types
                        var reflectionMethod = TryResolveFrameworkMethod(method.OwningClass, methodToken);
                        
                        if (reflectionMethod != null)
                        {
                            _asmWriter?.WriteLine($"    ; Resolved: {reflectionMethod.DeclaringType?.FullName}::{reflectionMethod.Name}");
                            
                            if (reflectionMethod.DeclaringType?.FullName == "System.Decimal")
                            {
                                HandleSystemDecimalMethodByReflection(reflectionMethod, stack);     
                            }
                            else if (IsSystemMathMethod(reflectionMethod))
                            {
                                HandleSystemMathCall(reflectionMethod, stack);
                            }
                            else
                            {
                                _asmWriter?.WriteLine($"    ; Framework method: {reflectionMethod.DeclaringType?.FullName}::{reflectionMethod.Name}");
                                _asmWriter?.WriteLine($"    ; TODO: Implement framework call");
                                // Pop all arguments to avoid stack overflow
                                var paramCount = reflectionMethod is System.Reflection.MethodInfo mi ? 
                                    mi.GetParameters().Length : 0;
                                for (int i = 0; i < paramCount; i++)
                                {
                                    try { stack.Pop(); } catch { /* ignore if stack underflow */ }
                                }
                                // Push return value if non-void
                                if (reflectionMethod is System.Reflection.MethodInfo methodInfo &&
                                    methodInfo.ReturnType != typeof(void))
                                {
                                    string resultReg = GetAvailableRegister(stack);
                                    stack.Push(resultReg);
                                }
                            }
                        }
                        else
                        {
                            // CRITICAL: Even if resolution fails, we need to try to manage the stack
                            // This is a fallback that pops a reasonable number of arguments
                            _asmWriter?.WriteLine($"    ; WARNING: Unresolved method token {methodToken:X8}");
                            
                            // Try to infer from the IL signature if available
                            // For now, be conservative and output an error
                            _asmWriter?.WriteLine($"    ; JSR UNKNOWN_METHOD_{methodToken:X8}  ; UNRESOLVED - may cause stack corruption!");
                        }
                    }
                }
            }
            // newobj - create new instance
            else if (opcode == OpCodes.Newobj)
            {
                if (operand is int methodToken)
                {
                    var reflectionMethod = TryResolveFrameworkMethod(method.OwningClass, methodToken);
                    
                    if (reflectionMethod?.DeclaringType?.FullName == "System.Decimal")
                    {
                        HandleSystemDecimalNewObj(reflectionMethod, stack);
                    }
                    else
                    {
                        _asmWriter?.WriteLine($"    ; TODO: newobj {methodToken:X8}");
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


        /// <summary>Check if a method token refers to a framework/system method</summary>
        private bool IsFrameworkMethod(int methodToken, ClassMetadata callingClass)
        {
            try
            {
                if (callingClass.ReflectionType?.Module is null)
                    return false;

                var methodInfo = MyGetMethodInfo(callingClass, methodToken);
                if (methodInfo?.DeclaringType is null)
                    return false;

                string? fullName = methodInfo.DeclaringType.FullName;
                // Check for System.Runtime framework types
                return fullName?.StartsWith("System.") == true ||
                       fullName?.Contains("System.Runtime") == true;
            }
            catch
            {
                return false;
            }
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

        /// <summary>Check if a method is System.Decimal constructor</summary>
        private bool IsSystemDecimalConstructor(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Decimal" && method.IsConstructor;
        }

        /// <summary>Check if a method belongs to System.Decimal</summary>
        private bool IsSystemDecimalMethod(MethodMetadata method)
        {
            return method.OwningClass.FullName == "System.Decimal" && 
                   (method.Name == "op_Addition" || method.Name == "op_Subtraction" || 
                    method.Name == "Equals" || method.Name == ".ctor");
        }

        /// <summary>Handle System.Decimal constructor inline</summary>
        /// <remarks>
        /// Decimal constructor signature: .ctor(int32 lo, int32 mid, int32 hi, bool isNegative, uint8 scale)
        /// Decimal layout in memory (16 bytes):
        /// Offset 0-3: flags (contains scale in bits 16-23, sign in bit 31)
        /// Offset 4-7: high 32 bits
        /// Offset 8-11: low 32 bits
        /// Offset 12-15: mid 32 bits
        /// </remarks>
        private void HandleSystemDecimalConstructor(MethodMetadata method, StackSimulator stack)
        {
            // Pop all constructor parameters in reverse order
            // Stack order: this (address), lo, mid, hi, isNegative, scale
            string scale = stack.Pop();      // uint8 scale
            string isNegative = stack.Pop(); // bool sign
            string hi = stack.Pop();         // int32 hi
            string mid = stack.Pop();        // int32 mid
            string lo = stack.Pop();         // int32 lo
            string thisAddr = stack.Pop();   // address of Decimal struct

            _asmWriter?.WriteLine($"    ; System.Decimal constructor inline");
            _asmWriter?.WriteLine($"    ; this @ {thisAddr}, lo={lo}, mid={mid}, sign={isNegative}, scale={scale}");

            // Construct flags: scale in bits 16-23, sign in bit 31
            string skipNegLabel = GetUniqueLabel();
            
            _asmWriter?.WriteLine($"    CLR.L D2                  ; Clear flags");
            _asmWriter?.WriteLine($"    AND.L #0xFF,{scale}      ; Ensure scale is 0-255");
            _asmWriter?.WriteLine($"    LSL.L #16,{scale}        ; Shift scale to bits 16-23");
            _asmWriter?.WriteLine($"    OR.L {scale},D2           ; Set scale in flags");
            
            _asmWriter?.WriteLine($"    TST.L {isNegative}        ; Check if negative");
            _asmWriter?.WriteLine($"    BEQ .SkipNegative_{skipNegLabel}");
            _asmWriter?.WriteLine($"    OR.L #0x80000000,D2      ; Set sign bit if negative");
            _asmWriter?.WriteLine($".SkipNegative_{skipNegLabel}:");
            _asmWriter?.WriteLine($"    MOVE.L D2,({thisAddr})    ; Store flags");

            // Store high at offset 4
            _asmWriter?.WriteLine($"    MOVE.L {hi},4({thisAddr}) ; Store high 32 bits");

            // Store low at offset 8
            _asmWriter?.WriteLine($"    MOVE.L {lo},8({thisAddr}) ; Store low 32 bits");

            // Store mid at offset 12
            _asmWriter?.WriteLine($"    MOVE.L {mid},12({thisAddr}) ; Store mid 32 bits");

            _asmWriter?.WriteLine($"    ; Decimal constructor complete");
        }

        /// <summary>Handle System.Decimal method calls inline</summary>
        private void HandleSystemDecimalCall(MethodMetadata method, StackSimulator stack)
        {
            if (method.Name == "op_Addition")
            {
                HandleDecimalAddition(stack);
            }
            else if (method.Name == "op_Subtraction")
            {
                HandleDecimalSubtraction(stack);
            }
            else if (method.Name == "Equals")
            {
                HandleDecimalEquals(stack);
            }
            else if (method.Name == "op_Multiply")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_Multiply");
                stack.Pop();
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (method.Name == "op_Division")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_Division");
                stack.Pop();
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (method.Name == "op_UnaryNegation")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_UnaryNegation");
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (method.Name == "op_Modulus")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_Modulus");
                stack.Pop();
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (method.Name.StartsWith("op_"))
            {
                // Handle other operators generically
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal.{method.Name}");
                // Most binary operators need 2 pops
                if (method.Name.Contains("Equality") || method.Name.Contains("Comparison"))
                {
                    stack.Pop();
                    stack.Pop();
                    string resultReg = GetAvailableRegister(stack);
                    stack.Push(resultReg);
                }
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal.{method.Name} not yet implemented");
            }
        }

        /// <summary>Check if a method is a System.Math method</summary>
        private bool IsSystemMathMethod(System.Reflection.MethodBase method)
        {
            return method.DeclaringType?.FullName == "System.Math";
        }

        /// <summary>Handle System.Math method calls</summary>
        private void HandleSystemMathCall(System.Reflection.MethodBase methodInfo, StackSimulator stack)
        {
            string methodName = methodInfo.Name;
            var parameters = ((System.Reflection.MethodInfo)methodInfo).GetParameters();
            int paramCount = parameters.Length;
            
            _asmWriter?.WriteLine($"    ; System.Math.{methodName} - {paramCount} parameters (stub)");

            // Pop all arguments
            for (int i = 0; i < paramCount; i++)
            {
                try
                {
                    stack.Pop();
                }
                catch
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Could not pop argument {i}");
                }
            }

            // Push return value if non-void
            if (((System.Reflection.MethodInfo)methodInfo).ReturnType != typeof(void))
            {
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L #0,{resultReg}     ; TODO: {methodName} result");
                stack.Push(resultReg);
            }
        }

        /// <summary>Handle System.Decimal method calls identified by reflection</summary>
        private void HandleSystemDecimalMethodByReflection(System.Reflection.MethodBase methodInfo, StackSimulator stack)
        {
            string methodName = methodInfo.Name;

            _asmWriter?.WriteLine($"    ; System.Decimal.{methodName} (inline)");

            if (methodName == ".ctor")
            {
                // Instance constructor call - VOID method, don't push result
                HandleSystemDecimalInstanceConstructor(methodInfo, stack);
            }
            else if (methodName == "op_Addition")
            {
                HandleDecimalAddition(stack);
            }
            else if (methodName == "op_Subtraction")
            {
                HandleDecimalSubtraction(stack);
            }
            else if (methodName == "Equals")
            {
                HandleDecimalEquals(stack);
            }
            else if (methodName == "op_Multiply")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_Multiply");
                stack.Pop();
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (methodName == "op_Division")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_Division");
                stack.Pop();
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (methodName == "op_UnaryNegation")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_UnaryNegation");
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (methodName == "op_Modulus")
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal op_Modulus");
                stack.Pop();
                stack.Pop();
                string resultReg = GetAvailableRegister(stack);
                stack.Push(resultReg);
            }
            else if (methodName.StartsWith("op_"))
            {
                // Handle other operators generically
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal.{methodName}");
                // Most binary operators need 2 pops
                if (methodName.Contains("Equality") || methodName.Contains("Comparison"))
                {
                    stack.Pop();
                    stack.Pop();
                    string resultReg = GetAvailableRegister(stack);
                    stack.Push(resultReg);
                }
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: System.Decimal.{methodName} not yet implemented");
            }
        }

        /// <summary>Handle System.Decimal newobj (create new instance)</summary>
        private void HandleSystemDecimalNewObj(System.Reflection.MethodBase methodInfo, StackSimulator stack)
        {
            var parameters = methodInfo.GetParameters();
            
            _asmWriter?.WriteLine($"    ; System.Decimal newobj - create new instance ({parameters.Length} parameters)");

            // Pop parameters in reverse order (NO this!)
            var parameterValues = new List<string>();
            for (int i = 0; i < parameters.Length; i++)
            {
                try
                {
                    parameterValues.Add(stack.Pop());
                }
                catch
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Could not pop parameter {i}");
                    parameterValues.Add("D0");
                }
            }
            parameterValues.Reverse();

            // Standard Decimal constructor: (int lo, int mid, int hi, bool isNegative, uint8 scale)
            if (parameterValues.Count == 5)
            {
                string scale = parameterValues[4];
                string isNegative = parameterValues[3];
                string hi = parameterValues[2];
                string mid = parameterValues[1];
                string lo = parameterValues[0];

                // For newobj, allocate space on the stack for the new Decimal
                string resultAddr = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    LEA -32(A6),{resultAddr}  ; Allocate new Decimal instance");

                _asmWriter?.WriteLine($"    ; System.Decimal newobj inline");
                _asmWriter?.WriteLine($"    ; result @ {resultAddr}, lo={lo}, mid={mid}, hi={hi}, sign={isNegative}, scale={scale}");

                string skipNegLabel = GetUniqueLabel();
                
                _asmWriter?.WriteLine($"    CLR.L D2                  ; Clear flags");
                _asmWriter?.WriteLine($"    AND.L #0xFF,{scale}      ; Ensure scale is 0-255");
                _asmWriter?.WriteLine($"    LSL.L #16,{scale}        ; Shift scale to bits 16-23");
                _asmWriter?.WriteLine($"    OR.L {scale},D2           ; Set scale in flags");
                
                _asmWriter?.WriteLine($"    TST.L {isNegative}        ; Check if negative");
                _asmWriter?.WriteLine($"    BEQ .SkipNegative_{skipNegLabel}");
                _asmWriter?.WriteLine($"    OR.L #0x80000000,D2      ; Set sign bit if negative");
                _asmWriter?.WriteLine($".SkipNegative_{skipNegLabel}:");

                _asmWriter?.WriteLine($"    MOVE.L D2,({resultAddr})    ; Store flags at offset 0");
                _asmWriter?.WriteLine($"    MOVE.L {hi},4({resultAddr}) ; Store high at offset 4");
                _asmWriter?.WriteLine($"    MOVE.L {lo},8({resultAddr}) ; Store low at offset 8");
                _asmWriter?.WriteLine($"    MOVE.L {mid},12({resultAddr}) ; Store mid at offset 12");
                
                _asmWriter?.WriteLine($"    ; newobj complete - push result address");
                
                stack.Push(resultAddr);
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: Decimal newobj with {parameterValues.Count} parameters (expected 5)");
                stack.Push("D0");
            }
        }

        /// <summary>Handle System.Decimal instance constructor (call .ctor)</summary>
        private void HandleSystemDecimalInstanceConstructor(System.Reflection.MethodBase methodInfo, StackSimulator stack)
        {
            var parameters = methodInfo.GetParameters();
            
            _asmWriter?.WriteLine($"    ; System.Decimal instance constructor (void) - {parameters.Length} parameters");

            // Pop parameters in reverse order
            var parameterValues = new List<string>();
            for (int i = 0; i < parameters.Length; i++)
            {
                try
                {
                    parameterValues.Add(stack.Pop());
                }
                catch
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Could not pop parameter {i}");
                    parameterValues.Add("D0");
                }
            }
            parameterValues.Reverse();

            // Pop the 'this' address
            string thisAddr;
            try
            {
                thisAddr = stack.Pop();
            }
            catch
            {
                _asmWriter?.WriteLine($"    ; WARNING: Could not pop this");
                thisAddr = "D0";
            }

            // Standard Decimal constructor: (int lo, int mid, int hi, bool isNegative, uint8 scale)
            if (parameterValues.Count == 5)
            {
                string scale = parameterValues[4];
                string isNegative = parameterValues[3];
                string hi = parameterValues[2];
                string mid = parameterValues[1];
                string lo = parameterValues[0];

                _asmWriter?.WriteLine($"    ; System.Decimal constructor inline");
                _asmWriter?.WriteLine($"    ; this @ {thisAddr}, lo={lo}, mid={mid}, hi={hi}, sign={isNegative}, scale={scale}");

                string skipNegLabel = GetUniqueLabel();
                
                _asmWriter?.WriteLine($"    CLR.L D2                  ; Clear flags");
                _asmWriter?.WriteLine($"    AND.L #0xFF,{scale}      ; Ensure scale is 0-255");
                _asmWriter?.WriteLine($"    LSL.L #16,{scale}        ; Shift scale to bits 16-23");
                _asmWriter?.WriteLine($"    OR.L {scale},D2           ; Set scale in flags");
                
                _asmWriter?.WriteLine($"    TST.L {isNegative}        ; Check if negative");
                _asmWriter?.WriteLine($"    BEQ .SkipNegative_{skipNegLabel}");
                _asmWriter?.WriteLine($"    OR.L #0x80000000,D2      ; Set sign bit if negative");
                _asmWriter?.WriteLine($".SkipNegative_{skipNegLabel}:");

                _asmWriter?.WriteLine($"    MOVE.L D2,({thisAddr})    ; Store flags at offset 0");
                _asmWriter?.WriteLine($"    MOVE.L {hi},4({thisAddr}) ; Store high at offset 4");
                _asmWriter?.WriteLine($"    MOVE.L {lo},8({thisAddr}) ; Store low at offset 8");
                _asmWriter?.WriteLine($"    MOVE.L {mid},12({thisAddr}) ; Store mid at offset 12");
                
                _asmWriter?.WriteLine($"    ; Decimal constructor complete (void - nothing pushed)");
                
                // Reset register allocation after consuming constructor arguments
                stack.Clear();
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: Decimal constructor with {parameterValues.Count} parameters (expected 5)");
                stack.Clear();
            }
        }

        /// <summary>Try to resolve a framework method using reflection</summary>
        private System.Reflection.MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
        {
            try
            {
                if (callingClass.ReflectionType?.Module is null)
                    return null;

                var resolved = MyGetMethodInfo(callingClass, methodToken);
                if (resolved != null)
                    return resolved;

                // Fallback: try to identify common System methods
                return TryIdentifySystemMethod(methodToken);
            }
            catch
            {
                return null;
            }
        }

        /// <summary>Fallback: identify common System.* methods</summary>
        private System.Reflection.MethodBase? TryIdentifySystemMethod(int methodToken)
        {
            try
            {
                var mathType = Type.GetType("System.Math");
                if (mathType != null)
                {
                    var methods = mathType.GetMethods(
                        System.Reflection.BindingFlags.Public | 
                        System.Reflection.BindingFlags.Static);
                    
                    // Look for common Math methods
                    var match = methods.FirstOrDefault(m => 
                        new[] { "Abs", "Round", "Truncate", "Floor", "Ceiling", "Min", "Max" }.Contains(m.Name));
                    if (match != null) return match;
                }

                var decimalType = Type.GetType("System.Decimal");
                if (decimalType != null)
                {
                    var methods = decimalType.GetMethods(
                        System.Reflection.BindingFlags.Public | 
                        System.Reflection.BindingFlags.Static |
                        System.Reflection.BindingFlags.Instance);
                    
                    // Look for Decimal methods - include constructor and all operators
                    var commonDecimalNames = new[] { 
                        ".ctor",  // Constructor
                        "op_Addition", 
                        "op_Subtraction", 
                        "op_Multiply", 
                        "op_Division",
                        "op_Modulus",
                        "op_UnaryNegation", 
                        "op_Negation",
                        "op_LessThan",
                        "op_GreaterThan", 
                        "op_LessThanOrEqual",
                        "op_GreaterThanOrEqual",
                        "op_Equality", 
                        "op_Inequality",
                        "Equals", 
                        "CompareTo"
                    };
                    
                    var match = methods.FirstOrDefault(m => commonDecimalNames.Contains(m.Name));
                    if (match != null) return match;
                }
            }
            catch { }

            return null;
        }

        /// <summary>Handle Decimal.op_Addition inline</summary>
        private void HandleDecimalAddition(StackSimulator stack)
        {
            _asmWriter?.WriteLine($"    ; System.Decimal op_Addition inline (simplified)");
            
            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();
            
            string resultAddr = GetAvailableRegister(stack);
            _asmWriter?.WriteLine($"    LEA -16(A6),{resultAddr}  ; Allocate result space");

            _asmWriter?.WriteLine($"    MOVE.L 8({leftAddr}),D0   ; Load left low");
            _asmWriter?.WriteLine($"    MOVE.L 8({rightAddr}),D1  ; Load right low");
            _asmWriter?.WriteLine($"    ADD.L D1,D0               ; Add low parts");
            _asmWriter?.WriteLine($"    MOVE.L D0,8({resultAddr}) ; Store result low");

            _asmWriter?.WriteLine($"    ; TODO: Complete decimal addition with carry");

            stack.Push(resultAddr);
        }

        /// <summary>Handle Decimal.op_Subtraction inline</summary>
        private void HandleDecimalSubtraction(StackSimulator stack)
        {
            _asmWriter?.WriteLine($"    ; System.Decimal op_Subtraction inline (simplified)");
            
            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();
            
            string resultAddr = GetAvailableRegister(stack);
            _asmWriter?.WriteLine($"    LEA -16(A6),{resultAddr}  ; Allocate result space");

            _asmWriter?.WriteLine($"    MOVE.L 8({leftAddr}),D0   ; Load left low");
            _asmWriter?.WriteLine($"    MOVE.L 8({rightAddr}),D1  ; Load right low");
            _asmWriter?.WriteLine($"    SUB.L D1,D0               ; Subtract low parts");
            _asmWriter?.WriteLine($"    MOVE.L D0,8({resultAddr}) ; Store result low");

            _asmWriter?.WriteLine($"    ; TODO: Complete decimal subtraction with borrow");

            stack.Push(resultAddr);
        }

        /// <summary>Handle Decimal.Equals inline</summary>
        private void HandleDecimalEquals(StackSimulator stack)
        {
            _asmWriter?.WriteLine($"    ; System.Decimal Equals inline");
            
            string rightAddr = stack.Pop();
            string leftAddr = stack.Pop();

            string resultReg = GetAvailableRegister(stack);
            
            string notEqualLabel = GetUniqueLabel();
            string doneLabel = GetUniqueLabel();

            _asmWriter?.WriteLine($"    MOVE.L #1,{resultReg}     ; Assume equal");
            
            _asmWriter?.WriteLine($"    MOVE.L ({leftAddr}),D0    ; Load left flags");
            _asmWriter?.WriteLine($"    CMP.L ({rightAddr}),D0    ; Compare flags");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    MOVE.L 4({leftAddr}),D0   ; Load left high");
            _asmWriter?.WriteLine($"    CMP.L 4({rightAddr}),D0   ; Compare high");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    MOVE.L 8({leftAddr}),D0   ; Load left low");
            _asmWriter?.WriteLine($"    CMP.L 8({rightAddr}),D0   ; Compare low");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    MOVE.L 12({leftAddr}),D0  ; Load left mid");
            _asmWriter?.WriteLine($"    CMP.L 12({rightAddr}),D0  ; Compare mid");
            _asmWriter?.WriteLine($"    BNE .NotEqual_{notEqualLabel}");

            _asmWriter?.WriteLine($"    BRA .EqualsDone_{doneLabel}");

            _asmWriter?.WriteLine($".NotEqual_{notEqualLabel}:");
            _asmWriter?.WriteLine($"    CLR.L {resultReg}         ; Not equal = false");

            _asmWriter?.WriteLine($".EqualsDone_{doneLabel}:");
            
            stack.Push(resultReg);
        }

        private string GetMethodLabel(ClassMetadata cls, MethodMetadata method)
        {
            return $"{cls.FullName}_{method.Name}";
        }

        private string GetUniqueLabel()
        {
            return $"L_{_labelCounter++}";
        }

        /// <summary>Get an available register for the next stack push</summary>
        private string GetAvailableRegister(StackSimulator stack)
        {
            return stack.GetNextRegister();
        }
    }
}