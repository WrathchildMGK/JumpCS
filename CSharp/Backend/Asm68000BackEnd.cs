using System.Reflection;
using System.Reflection.Emit;
using System.Text;
using JumpCS.Core;
using JumpCS.Backend.SystemTypes;  // Add this at the top

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

        private SystemDecimalHandler _decimalHandler; // Add this field
        private SystemMathHandler _mathHandler;

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
        private string GetMethodSignature(MethodBase method)
        {
            var paramTypes = method.GetParameters()
                .Select(p => GetTypeSignature(p.ParameterType))
                .ToList();

            string returnType = method is MethodInfo mi ? 
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
                // Initialize handlers
                _decimalHandler = new SystemDecimalHandler(
                    _asmWriter,
                    (stack) => GetAvailableRegister(stack),
                    () => GetUniqueLabel()
                );

                _mathHandler = new SystemMathHandler(
                    _asmWriter,
                    (stack) => GetAvailableRegister(stack)
                );

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

            var stackSim = new Asm68000StackSimulator(maxLocals, maxStack);
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
        private void TranslateOpcode(MsilIterator iterator, MethodMetadata method, Asm68000StackSimulator stack, LabelMapper labels)
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
            // Load single (float) constant
            else if (opcode == OpCodes.Ldc_R4)
            {
                if (operand is float fVal)
                {
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    LEA FLOAT_CONST_{iterator.CurrentIndex:X4}(PC),A0");
                    _asmWriter?.WriteLine($"    MOVE.L (A0),{targetReg}");
                    stack.Push(targetReg);
                }
            }
            // Branch if greater than (unsigned)
            else if (opcode == OpCodes.Bgt_Un || opcode == OpCodes.Bgt_Un_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BHI {label}  ; Branch if greater than (unsigned)");
            }
            // Load static field
            else if (opcode == OpCodes.Ldsfld)
            {
                if (operand is int fieldToken)
                {
                    _asmWriter?.WriteLine($"    ; TODO: ldsfld token {fieldToken:X8}");
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    CLR.L {targetReg}  ; TODO: Load static field {fieldToken:X8}");
                    stack.Push(targetReg);
                }
            }
            // Store local variable (short form)
            else if (opcode == OpCodes.Stloc_S)
            {
                if (operand is int localIdx)
                {
                    int offset = -4 - (localIdx * 4);
                    string src = stack.Pop();
                    _asmWriter?.WriteLine($"    MOVE.L {src},{offset}(A6)  ; Store to local {localIdx}");
                }
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
            // Branch if greater than (signed)
            else if (opcode == OpCodes.Bgt || opcode == OpCodes.Bgt_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BGT {label}  ; Branch if greater than (signed)");
            }
            // Branch if less than (unsigned)
            else if (opcode == OpCodes.Blt_Un || opcode == OpCodes.Blt_Un_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BLO {label}  ; Branch if less than (unsigned)");
            }
            // Branch if less than (signed)
            else if (opcode == OpCodes.Blt || opcode == OpCodes.Blt_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BLT {label}  ; Branch if less than (signed)");
            }
            // Load field (static or instance)
            else if (opcode == OpCodes.Ldfld)
            {
                if (operand is int fieldToken)
                {
                    _asmWriter?.WriteLine($"    ; TODO: ldfld token {fieldToken:X8}");
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    CLR.L {targetReg}  ; TODO: Load field {fieldToken:X8}");
                    stack.Push(targetReg);
                }
            }
            // Store field (static or instance)
            else if (opcode == OpCodes.Stfld)
            {
                if (operand is int fieldToken)
                {
                    string valueToStore = stack.Pop();
                    _asmWriter?.WriteLine($"    ; TODO: stfld token {fieldToken:X8}");
                    _asmWriter?.WriteLine($"    CLR.L {valueToStore}  ; TODO: Store field {fieldToken:X8}");
                }
            }
            // Branch if not equal (unsigned)
            else if (opcode == OpCodes.Bne_Un || opcode == OpCodes.Bne_Un_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BNE {label}  ; Branch if not equal (unsigned)");
            }
            // Branch if equal (signed)
            else if (opcode == OpCodes.Beq || opcode == OpCodes.Beq_S)
            {
                string val2 = stack.Pop();
                string val1 = stack.Pop();
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                _asmWriter?.WriteLine($"    BEQ {label}  ; Branch if equal (signed)");
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
                        if (_decimalHandler.TryHandleMethod(targetMethod, stack))
                        {
                            // Handled by SystemDecimalHandler
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
                            if (_decimalHandler.TryHandleReflectionMethod(reflectionMethod, stack))
                            {
                                // Handled by SystemDecimalHandler
                            }
                            else if (_mathHandler.TryHandleReflectionMethod(reflectionMethod, stack))
                            {
                                // Handled by SystemMathHandler
                            }
                            else
                            {
                                _asmWriter?.WriteLine($"    ; Framework method: {reflectionMethod.DeclaringType?.FullName}::{reflectionMethod.Name}");
                                _asmWriter?.WriteLine($"    ; TODO: Implement framework call");
                                var paramCount = reflectionMethod is MethodInfo mi ?
                                    mi.GetParameters().Length : 0;
                                for (int i = 0; i < paramCount; i++)
                                {
                                    try { stack.Pop(); } catch { }
                                }
                                if (reflectionMethod is MethodInfo methodInfo &&
                                    methodInfo.ReturnType != typeof(void))
                                {
                                    string resultReg = GetAvailableRegister(stack);
                                    stack.Push(resultReg);
                                }
                            }
                        }
                        else
                        {
                            _asmWriter?.WriteLine($"    ; WARNING: Unresolved method token {methodToken:X8}");
                            _asmWriter?.WriteLine($"    ; JSR UNKNOWN_METHOD_{methodToken:X8}  ; UNRESOLVED");
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

                    if (!_decimalHandler.TryHandleNewObj(reflectionMethod, stack))
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
                if (stack.StackDepth > 0)
                {
                    stack.Pop();
                    _asmWriter?.WriteLine("    ; Pop");
                }
                else
                {
                    _asmWriter?.WriteLine("    ; WARNING: Pop on empty stack");
                }
            }
            else if (opcode == OpCodes.Dup)
            {
                string val = stack.Peek();
                _asmWriter?.WriteLine($"    ; Duplicate {val}");
                stack.Push(val);
            }
            // Exception handling
            else if (opcode == OpCodes.Leave || opcode == OpCodes.Leave_S)
            {
                // leave exits an exception handler
                // For now, treat it like a branch to the target
                int targetOffset = iterator.NextIndex + (int)(operand ?? 0);
                string label = labels.GetOrCreateLabel(targetOffset);
                _asmWriter?.WriteLine($"    BRA {label}  ; leave - exit exception handler");

                // leave clears the stack
                stack.Clear();
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

        /// <summary>Try to resolve a framework method using reflection</summary>
        private MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
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
        private MethodBase? TryIdentifySystemMethod(int methodToken)
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

        private string GetMethodLabel(ClassMetadata cls, MethodMetadata method)
        {
            return $"{cls.FullName}_{method.Name}";
        }

        private string GetUniqueLabel()
        {
            return $"L_{_labelCounter++}";
        }

        /// <summary>Get an available register for the next stack push</summary>
        private string GetAvailableRegister(Asm68000StackSimulator stack)
        {
            return stack.GetNextRegister();
        }
    }
}