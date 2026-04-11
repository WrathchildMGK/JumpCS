using System.Reflection;
using System.Reflection.Emit;
using System.Text;
using JumpCS.Core;
using JumpCS.Backend.SystemTypes;

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
        
        // Constant tracking for ldc.r4 and ldc.r8
        private Dictionary<int, float> _floatConstants = new();
        private Dictionary<int, double> _doubleConstants = new();

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

        private SystemDecimalHandler _decimalHandler;
        private SystemMathHandler _mathHandler;
        private SystemDoubleHandler _doubleHandler;
        private SystemFloatHandler _floatHandler;
        private SystemIntegerHandler _integerHandler;

        public Asm68000BackEnd(string outputBaseName) : base(outputBaseName)
        {
        }

        /// <summary>Update dependencies and calculate code sizes</summary>
        public override void UpdateAll()
        {
            _methodCache.Clear();
            _methodOffsets.Clear();
            _currentOffset = 0;

            AnalyzeMsilDependencies();

            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
                foreach (var method in cls.Methods.Where(m => m.IsNeeded))
                {
                    _methodOffsets[method.ToString()] = _currentOffset;
                    _currentOffset += method.CodeLength * 3;
                }
            }
        }

        /// <summary>Analyze MSIL bytecode to discover method call dependencies</summary>
        private void AnalyzeMsilDependencies()
        {
            var classesToAnalyze = ClassMetadata.AllClasses.Where(c => c.IsNeeded).ToList();
            
            foreach (var cls in classesToAnalyze)
            {
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

                            if ((opcode == OpCodes.Call || opcode == OpCodes.Callvirt) && 
                                operand is int methodToken)
                            {
                                var targetMethod = ResolveMethodToken(method.OwningClass, methodToken);
                                if (targetMethod != null && !targetMethod.IsNeeded)
                                {
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

            if (callingClass.ReflectionType?.Module is null)
            {
                if (Program.CodeOptions?.Verbosity > 1)
                    Console.WriteLine($"  Token {methodToken:X8}: No module in calling class {callingClass.FullName}");
                return null;
            }

            try
            {
                var methodInfo = MyGetMethodInfo(callingClass, methodToken);

                // Framework methods should not be compiled - route through handlers instead
                if (methodInfo?.DeclaringType?.Namespace?.StartsWith("System") == true)
                {
                    _methodCache.Add(methodToken, null);
                    return null;
                }

                if (methodInfo?.DeclaringType is null)
                {
                    if (Program.CodeOptions?.Verbosity > 1)
                        Console.WriteLine($"  Token {methodToken:X8}: MethodBase has no declaring type");
                    _methodCache.Add(methodToken, null);
                    return null;
                }

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
                _decimalHandler = new SystemDecimalHandler(
                    _asmWriter,
                    (stack) => GetAvailableRegister(stack),
                    () => GetUniqueLabel()
                );

                _mathHandler = new SystemMathHandler(
                    _asmWriter,
                    (stack) => GetAvailableRegister(stack)
                );

                _doubleHandler = new SystemDoubleHandler(
                    _asmWriter,
                    (stack) => GetAvailableRegister(stack),
                    () => GetUniqueLabel()
                );

                _floatHandler = new SystemFloatHandler(
                    _asmWriter,
                    (stack) => GetAvailableRegister(stack),
                    () => GetUniqueLabel()
                );

                _integerHandler = new SystemIntegerHandler(
                    _asmWriter,
                    (stack) => GetAvailableRegister(stack),
                    () => GetUniqueLabel()
                );

                // Clear constants for fresh generation
                _floatConstants.Clear();
                _doubleConstants.Clear();

                WriteHeader();
                WriteClassDefinitions();
                WriteClassTable();
                WriteMethodImplementations();
                WriteConstantsSection();
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
            
            if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToAsm(method);
            }

            _asmWriter?.WriteLine("    ; Constructor epilogue");
            _asmWriter?.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        private void WriteStaticConstructorCode(ClassMetadata cls, MethodMetadata method)
        {
            _asmWriter?.WriteLine("    ; Static constructor prologue");
            _asmWriter?.WriteLine("    MOVEM.L A6,-(A7)     ; Save frame");
            _asmWriter?.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            _asmWriter?.WriteLine();

            if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToAsm(method);
            }

            _asmWriter?.WriteLine("    ; Static constructor epilogue");
            _asmWriter?.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        private void WriteMsilToAsm(MethodMetadata method)
        {
            _asmWriter?.WriteLine("    ; Method prologue");
            _asmWriter?.WriteLine("    MOVEM.L A6,-(A7)     ; Save frame");
            _asmWriter?.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            if (method.MaxLocals > 0)
            {
                _asmWriter?.WriteLine($"    SUBI.L #{method.MaxLocals * 4},A7");
            }
            _asmWriter?.WriteLine();

            var iterator = new MsilIterator(method.Code, method);
            var stack = new Asm68000StackSimulator(method.MaxLocals, method.MaxStack);
            var labels = new LabelMapper();

            while (iterator.MoveNext())
            {
                TranslateOpcode(iterator, method, stack, labels);
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

            // Add diagnostic output for problematic instructions
            if (Program.CodeOptions?.Verbosity >= 2)
            {
                string opInfo = $"{opcode.Name}";
                if (operand != null)
                    opInfo += $" ({operand})";
                
                Console.WriteLine($"[OPCODE] {iterator.CurrentIndex:X4}: {opInfo}");
            }

            _asmWriter?.WriteLine($"    ; Offset {iterator.CurrentIndex:X4}: {opcode.Name}");

            if (opcode == OpCodes.Ldc_I4_0)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    CLR.L {targetReg}             ; Load 0");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_1)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #1,{targetReg}         ; Load 1");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_2)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #2,{targetReg}         ; Load 2");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_3)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #3,{targetReg}         ; Load 3");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_4)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #4,{targetReg}         ; Load 4");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_5)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #5,{targetReg}         ; Load 5");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_6)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #6,{targetReg}         ; Load 6");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_7)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #7,{targetReg}         ; Load 7");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_8)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #8,{targetReg}         ; Load 8");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4_M1)
            {
                string targetReg = stack.AllocateDataRegister();
                _asmWriter?.WriteLine($"    MOVE.L #-1,{targetReg}        ; Load -1");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldc_I4)
            {
                if (operand is int intVal)
                {
                    string targetReg = stack.AllocateDataRegister();
                    _asmWriter?.WriteLine($"    MOVE.L #{intVal},{targetReg}  ; Load constant");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldc_I4_S)
            {
                if (operand is int shortIntVal)
                {
                    string targetReg = stack.AllocateDataRegister();
                    _asmWriter?.WriteLine($"    MOVE.L #{shortIntVal},{targetReg}  ; Load short constant");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Ldc_I8)
            {
                if (operand is long longVal)
                {
                    string targetReg1 = stack.AllocateDataRegister();
                    string targetReg2 = stack.AllocateDataRegister();
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
                    int constantIndex = iterator.CurrentIndex;
                    _doubleConstants[constantIndex] = dVal;
                    _asmWriter?.WriteLine($"    LEA DOUBLE_CONST_{constantIndex:X4}(PC),A0");
                    _asmWriter?.WriteLine($"    MOVE.L (A0),D0");
                    _asmWriter?.WriteLine($"    MOVE.L 4(A0),D1");
                    stack.Push(D0);
                    stack.Push(D1);
                }
            }
            else if (opcode == OpCodes.Ldc_R4)
            {
                float fVal = 0f;
                bool handled = false;
                
                // ldc.r4 operand is a 32-bit float
                if (operand is float f)
                {
                    fVal = f;
                    handled = true;
                }
                else if (operand is double d)
                {
                    // Fallback: if somehow we get a double, convert it
                    fVal = (float)d;
                    handled = true;
                }
                else if (operand is int intBits)
                {
                    // Raw int bits interpretation
                    fVal = BitConverter.Int32BitsToSingle(intBits);
                    handled = true;
                }
                
                if (handled)
                {
                    int constantIndex = iterator.CurrentIndex;
                    _floatConstants[constantIndex] = fVal;
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    LEA FLOAT_CONST_{constantIndex:X4}(PC),A0");
                    _asmWriter?.WriteLine($"    MOVE.L (A0),{targetReg}");
                    stack.Push(targetReg);
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: ldc.r4 operand type: {operand?.GetType().Name ?? "null"} value: {operand}");
                    string targetReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    CLR.L {targetReg}  ; TODO: Load float constant");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Add)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter?.WriteLine($"    ADD.L {right},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Sub)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter?.WriteLine($"    SUB.L {right},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Mul)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter?.WriteLine($"    MULS.L {right},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Div)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter?.WriteLine($"    DIVS.L {right},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Rem)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                _asmWriter?.WriteLine($"    MOVE.L {left},D0");
                _asmWriter?.WriteLine($"    DIVS.L {right},D0");
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L D1,{resultReg}  ; Remainder from division");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Box)
            {
                if (operand is int typeToken)
                {
                    string valueReg = stack.Pop();
                    _asmWriter?.WriteLine($"    ; Box type token {typeToken:X8}");
                    _asmWriter?.WriteLine($"    MOVE.L {valueReg},D0     ; Boxed value");
                    stack.Push(D0);
                }
            }
            else if (opcode == OpCodes.Unbox)
            {
                string objRef = stack.Pop();
                _asmWriter?.WriteLine($"    ; Unbox");
                _asmWriter?.WriteLine($"    MOVE.L {objRef},D0     ; Unboxed value");
                stack.Push(D0);
            }
            else if (opcode == OpCodes.Unbox_Any)
            {
                if (operand is int typeToken)
                {
                    string objRef = stack.Pop();
                    _asmWriter?.WriteLine($"    ; Unbox.Any type token {typeToken:X8}");
                    _asmWriter?.WriteLine($"    MOVE.L {objRef},D0     ; Unboxed value");
                    stack.Push(D0);
                }
            }
            else if (opcode == OpCodes.Ceq)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                string label = GetUniqueLabel();
                _asmWriter?.WriteLine($"    CMP.L {right},{left}");
                _asmWriter?.WriteLine($"    BEQ {label}_eq");
                _asmWriter?.WriteLine($"    CLR.L {resultReg}");
                _asmWriter?.WriteLine($"    BRA {label}_end");
                _asmWriter?.WriteLine($"{label}_eq:");
                _asmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
                _asmWriter?.WriteLine($"{label}_end:");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Clt || opcode == OpCodes.Clt_Un)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                string label = GetUniqueLabel();
                _asmWriter?.WriteLine($"    CMP.L {right},{left}");
                _asmWriter?.WriteLine($"    BLT {label}_lt");
                _asmWriter?.WriteLine($"    CLR.L {resultReg}");
                _asmWriter?.WriteLine($"    BRA {label}_end");
                _asmWriter?.WriteLine($"{label}_lt:");
                _asmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
                _asmWriter?.WriteLine($"{label}_end:");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Cgt || opcode == OpCodes.Cgt_Un)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                string label = GetUniqueLabel();
                _asmWriter?.WriteLine($"    CMP.L {right},{left}");
                _asmWriter?.WriteLine($"    BGT {label}_gt");
                _asmWriter?.WriteLine($"    CLR.L {resultReg}");
                _asmWriter?.WriteLine($"    BRA {label}_end");
                _asmWriter?.WriteLine($"{label}_gt:");
                _asmWriter?.WriteLine($"    MOVE.L #1,{resultReg}");
                _asmWriter?.WriteLine($"{label}_end:");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.And)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter?.WriteLine($"    AND.L {right},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Or)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter?.WriteLine($"    OR.L {right},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Xor)
            {
                string right = stack.Pop();
                string left = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {left},{resultReg}");
                _asmWriter?.WriteLine($"    EOR.L {right},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Shl)
            {
                string shiftAmount = stack.Pop();
                string value = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter?.WriteLine($"    MOVE.L {shiftAmount},D0");
                _asmWriter?.WriteLine($"    ASL.L D0,{resultReg}  ; Shift left");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Shr)
            {
                string shiftAmount = stack.Pop();
                string value = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter?.WriteLine($"    MOVE.L {shiftAmount},D0");
                _asmWriter?.WriteLine($"    ASR.L D0,{resultReg}  ; Shift right (arithmetic)");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Shr_Un)
            {
                string shiftAmount = stack.Pop();
                string value = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter?.WriteLine($"    MOVE.L {shiftAmount},D0");
                _asmWriter?.WriteLine($"    LSR.L D0,{resultReg}  ; Shift right (logical/unsigned)");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Neg)
            {
                string value = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    CLR.L {resultReg}");
                _asmWriter?.WriteLine($"    SUB.L {value},{resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Not)
            {
                string value = stack.Pop();
                
                string resultReg = GetAvailableRegister(stack);
                _asmWriter?.WriteLine($"    MOVE.L {value},{resultReg}");
                _asmWriter?.WriteLine($"    NOT.L {resultReg}");
                stack.Push(resultReg);
            }
            else if (opcode == OpCodes.Bne_Un || opcode == OpCodes.Bne_Un_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BNE {label}  ; Branch if not equal (unsigned)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Bne_Un with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Blt || opcode == OpCodes.Blt_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BLT {label}  ; Branch if < (signed)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Blt with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Blt_Un || opcode == OpCodes.Blt_Un_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BCS {label}  ; Branch if < (unsigned - Carry Set)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Blt_Un with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Br || opcode == OpCodes.Br_S)
            {
                // Unconditional branch - simple jump to target
                string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                _asmWriter?.WriteLine($"    BRA {label}  ; Unconditional branch");
                stack.Clear();  // Clear stack after unconditional branch
            }
            else if (opcode == OpCodes.Beq || opcode == OpCodes.Beq_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BEQ {label}  ; Branch if equal (signed)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Beq with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Bge || opcode == OpCodes.Bge_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BGE {label}  ; Branch if >= (signed)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Bge with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Ble || opcode == OpCodes.Ble_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BLE {label}  ; Branch if <= (signed)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Ble with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Bgt_Un || opcode == OpCodes.Bgt_Un_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BHI {label}  ; Branch if > (unsigned)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Bgt_Un with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Bge_Un || opcode == OpCodes.Bge_Un_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BCC {label}  ; Branch if >= (unsigned)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Bge_Un with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Ble_Un || opcode == OpCodes.Ble_Un_S)
            {
                if (stack.StackDepth >= 2)
                {
                    string val2 = stack.Pop();
                    string val1 = stack.Pop();
                    string label = labels.GetOrCreateLabel(iterator.NextIndex + (int)(operand ?? 0));
                    _asmWriter?.WriteLine($"    CMP.L {val2},{val1}");
                    _asmWriter?.WriteLine($"    BLS {label}  ; Branch if <= (unsigned)");
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Ble_Un with insufficient stack depth ({stack.StackDepth})");
                }
            }
            else if (opcode == OpCodes.Call || opcode == OpCodes.Callvirt)
            {
                if (operand is int methodToken)
                {
                    var targetMethod = ResolveMethodToken(method.OwningClass, methodToken);

                    if (targetMethod != null)
                    {
                        if (_decimalHandler.TryHandleMethod(targetMethod, stack))
                        {
                        }
                        else
                        {
                            string methodLabel = GetMethodLabel(targetMethod.OwningClass, targetMethod);
                            _asmWriter?.WriteLine($"    ; Call {targetMethod.OwningClass.FullName}.{targetMethod.Name}{targetMethod.Signature}");
                            _asmWriter?.WriteLine($"    JSR {methodLabel}");

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
                        var reflectionMethod = TryResolveFrameworkMethod(method.OwningClass, methodToken);

                        if (reflectionMethod != null)
                        {
                            if (_decimalHandler.TryHandleReflectionMethod(reflectionMethod, stack))
                            {
                            }
                            else if (_mathHandler.TryHandleReflectionMethod(reflectionMethod, stack))
                            {
                            }
                            else if (_doubleHandler.TryHandleReflectionMethod(reflectionMethod, stack))
                            {
                            }
                            else if (_floatHandler.TryHandleReflectionMethod(reflectionMethod, stack))
                            {
                            }
                            else if (_integerHandler.TryHandleReflectionMethod(reflectionMethod, stack))
                            {
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
            else if (opcode == OpCodes.Leave || opcode == OpCodes.Leave_S)
            {
                int targetOffset = iterator.NextIndex + (int)(operand ?? 0);
                string label = labels.GetOrCreateLabel(targetOffset);
                _asmWriter?.WriteLine($"    BRA {label}  ; leave - exit exception handler");
                stack.Clear();
            }
            else if (opcode == OpCodes.Nop)
            {
                _asmWriter?.WriteLine("    ; NOP");
            }
            else if (opcode == OpCodes.Conv_I4)
            {
                if (stack.StackDepth > 0)
                {
                    string value = stack.Pop();
                    string resultReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    MOVE.L {value},{resultReg}  ; Convert to I4");
                    stack.Push(resultReg);
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Conv_I4 with empty stack");
                }
            }
            else if (opcode == OpCodes.Conv_R4)
            {
                if (stack.StackDepth > 0)
                {
                    string value = stack.Pop();
                    string resultReg = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    MOVE.L {value},{resultReg}  ; Convert to R4");
                    stack.Push(resultReg);
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Conv_R4 with empty stack");
                }
            }
            else if (opcode == OpCodes.Conv_R8)
            {
                if (stack.StackDepth > 0)
                {
                    string value = stack.Pop();
                    string resultReg1 = GetAvailableRegister(stack);
                    string resultReg2 = GetAvailableRegister(stack);
                    _asmWriter?.WriteLine($"    MOVE.L {value},{resultReg1}  ; Convert to R8 (high word)");
                    _asmWriter?.WriteLine($"    CLR.L {resultReg2}          ; Convert to R8 (low word)");
                    stack.Push(resultReg1);
                    stack.Push(resultReg2);
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; WARNING: Conv_R8 with empty stack");
                }
            }
            else if (opcode == OpCodes.Ldloc_0 || opcode == OpCodes.Ldloc_1 || 
                     opcode == OpCodes.Ldloc_2 || opcode == OpCodes.Ldloc_3)
            {
                // Load local variable onto evaluation stack
                int localIndex = 0;
                if (opcode == OpCodes.Ldloc_1) localIndex = 1;
                else if (opcode == OpCodes.Ldloc_2) localIndex = 2;
                else if (opcode == OpCodes.Ldloc_3) localIndex = 3;
                
                string targetReg = GetAvailableRegister(stack);
                int frameOffset = -(localIndex + 1) * 4 - 4;
                _asmWriter?.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg}  ; Load local.{localIndex}");
                stack.Push(targetReg);
            }
            else if (opcode == OpCodes.Ldloc_S)
            {
                // Load short local variable - operand is Int32 (MsilIterator casts byte to int)
                if (operand is int localIdx)
                {
                    string targetReg = GetAvailableRegister(stack);
                    int frameOffset = -(localIdx + 1) * 4 - 4;
                    _asmWriter?.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg}  ; Load local.{localIdx}");
                    stack.Push(targetReg);
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; ERROR: ldloc.s with invalid operand type: {operand?.GetType().Name}");
                }
            }
            else if (opcode == OpCodes.Ldloc)
            {
                // Load local variable by index
                if (operand is ushort localIdx2)
                {
                    string targetReg = GetAvailableRegister(stack);
                    int frameOffset = -(localIdx2 + 1) * 4 - 4;
                    _asmWriter?.WriteLine($"    MOVE.L {frameOffset}(A6),{targetReg}  ; Load local.{localIdx2}");
                    stack.Push(targetReg);
                }
            }
            else if (opcode == OpCodes.Stloc_0 || opcode == OpCodes.Stloc_1 || 
                     opcode == OpCodes.Stloc_2 || opcode == OpCodes.Stloc_3)
            {
                // Store evaluation stack value to local variable
                if (stack.StackDepth > 0)
                {
                    string valueReg = stack.Pop();
                    int localIndex = 0;
                    if (opcode == OpCodes.Stloc_1) localIndex = 1;
                    else if (opcode == OpCodes.Stloc_2) localIndex = 2;
                    else if (opcode == OpCodes.Stloc_3) localIndex = 3;
                    
                    int frameOffset = -(localIndex + 1) * 4 - 4;
                    _asmWriter?.WriteLine($"    MOVE.L {valueReg},{frameOffset}(A6)  ; Store local.{localIndex}");
                    stack.ReleaseDataRegister(valueReg);
                }
                else
                {
                    int localIndex = 0;
                    if (opcode == OpCodes.Stloc_1) localIndex = 1;
                    else if (opcode == OpCodes.Stloc_2) localIndex = 2;
                    else if (opcode == OpCodes.Stloc_3) localIndex = 3;
                    _asmWriter?.WriteLine($"    ; WARNING: stloc.{localIndex} with empty stack");
                }
            }
            else if (opcode == OpCodes.Stloc_S)
            {
                // Store short local variable - operand is Int32 (MsilIterator casts byte to int)
                if (operand is int localIdx)
                {
                    if (stack.StackDepth > 0)
                    {
                        string valueReg = stack.Pop();
                        int frameOffset = -(localIdx + 1) * 4 - 4;
                        _asmWriter?.WriteLine($"    MOVE.L {valueReg},{frameOffset}(A6)  ; Store local.{localIdx}");
                        stack.ReleaseDataRegister(valueReg);
                    }
                    else
                    {
                        _asmWriter?.WriteLine($"    ; WARNING: stloc.s {localIdx} with empty stack");
                    }
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; ERROR: stloc.s with invalid operand type: {operand?.GetType().Name}");
                }
            }
            else if (opcode == OpCodes.Stloc)
            {
                // Store local variable by index - must have operand
                if (operand is ushort localIdx2)
                {
                    if (stack.StackDepth > 0)
                    {
                        string valueReg = stack.Pop();
                        int frameOffset = -(localIdx2 + 1) * 4 - 4;
                        _asmWriter?.WriteLine($"    MOVE.L {valueReg},{frameOffset}(A6)  ; Store local.{localIdx2}");
                        stack.ReleaseDataRegister(valueReg);
                    }
                    else
                    {
                        _asmWriter?.WriteLine($"    ; WARNING: stloc {localIdx2} with empty stack");
                    }
                }
                else
                {
                    _asmWriter?.WriteLine($"    ; ERROR: stloc with invalid operand type: {operand?.GetType().Name}");
                }
            }
            else
            {
                _asmWriter?.WriteLine($"    ; TODO: Unimplemented opcode {opcode.Name}");

                // Attempt to infer stack effects for common opcode patterns
                // This helps maintain stack balance when opcodes are not yet implemented
                string opName = opcode.Name.ToLower();

                // Load opcodes typically push a value
                if (opName.StartsWith("ld") && !opName.Contains("st"))
                {
                    try
                    {
                        string reg = stack.AllocateDataRegister();
                        _asmWriter?.WriteLine($"    CLR.L {reg}  ; TODO: Placeholder value");
                        stack.Push(reg);
                    }
                    catch { }
                }
                // Store opcodes typically pop a value
                else if (opName.StartsWith("st"))
                {
                    if (stack.StackDepth > 0)
                    {
                        stack.Pop();
                    }
                }
                // Call-like opcodes pop parameters and may push a return value
                else if (opName.Contains("call") || opName.Contains("new"))
                {
                    // Pop parameters (conservative estimate)
                    while (stack.StackDepth > 0)
                    {
                        try { stack.Pop(); }
                        catch { break; }
                    }
                    // May push return value (conservative)
                    try
                    {
                        string reg = stack.AllocateDataRegister();
                        stack.Push(reg);
                    }
                    catch { }
                }
            }

            _asmWriter?.WriteLine();
        }

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
                return fullName?.StartsWith("System.") == true ||
                       fullName?.Contains("System.Runtime") == true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>Write constants (float and double) data section</summary>
        private void WriteConstantsSection()
        {
            if (_floatConstants.Count == 0 && _doubleConstants.Count == 0)
                return;

            _asmWriter?.WriteLine();
            _asmWriter?.WriteLine("    ; --- Constants Section ---");
            
            foreach (var kvp in _doubleConstants.OrderBy(x => x.Key))
            {
                byte[] doubleBytes = BitConverter.GetBytes(kvp.Value);
                _asmWriter?.WriteLine($"DOUBLE_CONST_{kvp.Key:X4}:");
                _asmWriter?.WriteLine($"    DC.L ${BitConverter.ToInt32(doubleBytes, 0):X8}");
                _asmWriter?.WriteLine($"    DC.L ${BitConverter.ToInt32(doubleBytes, 4):X8}");
            }
            
            foreach (var kvp in _floatConstants.OrderBy(x => x.Key))
            {
                byte[] floatBytes = BitConverter.GetBytes(kvp.Value);
                _asmWriter?.WriteLine($"FLOAT_CONST_{kvp.Key:X4}:");
                _asmWriter?.WriteLine($"    DC.L ${BitConverter.ToInt32(floatBytes, 0):X8}");
            }
            
            _asmWriter?.WriteLine();
        }

        private void WriteDataSection()
        {
            _asmWriter?.WriteLine("    ; --- Data Section ---");
            _asmWriter?.WriteLine("    SECTION DATA");
            _asmWriter?.WriteLine();

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

        private MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
        {
            try
            {
                if (callingClass.ReflectionType?.Module is null)
                    return null;

                var resolved = MyGetMethodInfo(callingClass, methodToken);
                if (resolved != null)
                    return resolved;

                return TryIdentifySystemMethod(methodToken);
            }
            catch
            {
                return null;
            }
        }

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
                    
                    var commonDecimalNames = new[] { 
                        ".ctor", 
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

                var int32Type = Type.GetType("System.Int32");
                if (int32Type != null)
                {
                    var methods = int32Type.GetMethods(
                        System.Reflection.BindingFlags.Public | 
                        System.Reflection.BindingFlags.Static |
                        System.Reflection.BindingFlags.Instance);
                    
                    var commonInt32Names = new[] { 
                        ".ctor", 
                        "op_Addition", 
                        "op_Subtraction", 
                        "op_Multiply", 
                        "op_Division",
                        "op_Modulus",
                        "op_BitwiseAnd",
                        "op_BitwiseOr",
                        "op_ExclusiveOr",
                        "op_LeftShift",
                        "op_RightShift",
                        "op_UnaryNegation",
                        "op_OnesComplement",
                        "op_Equality", 
                        "op_Inequality",
                        "op_LessThan",
                        "op_GreaterThan",
                        "op_LessThanOrEqual",
                        "op_GreaterThanOrEqual",
                        "Equals", 
                        "CompareTo"
                    };
                    
                    var match = methods.FirstOrDefault(m => commonInt32Names.Contains(m.Name));
                    if (match != null) return match;
                }

                var singleType = Type.GetType("System.Single");
                if (singleType != null)
                {
                    var methods = singleType.GetMethods(
                        System.Reflection.BindingFlags.Public | 
                        System.Reflection.BindingFlags.Static |
                        System.Reflection.BindingFlags.Instance);
                    
                    var commonSingleNames = new[] { 
                        ".ctor", 
                        "op_Addition", 
                        "op_Subtraction", 
                        "op_Multiply", 
                        "op_Division",
                        "op_UnaryNegation",
                        "op_Equality", 
                        "op_Inequality",
                        "op_LessThan",
                        "op_GreaterThan",
                        "op_LessThanOrEqual",
                        "op_GreaterThanOrEqual",
                        "Equals", 
                        "CompareTo"
                    };
                    
                    var match = methods.FirstOrDefault(m => commonSingleNames.Contains(m.Name));
                    if (match != null) return match;
                }

                var doubleType = Type.GetType("System.Double");
                if (doubleType != null)
                {
                    var methods = doubleType.GetMethods(
                        System.Reflection.BindingFlags.Public | 
                        System.Reflection.BindingFlags.Static |
                        System.Reflection.BindingFlags.Instance);
                    
                    var commonDoubleNames = new[] { 
                        ".ctor", 
                        "op_Addition", 
                        "op_Subtraction", 
                        "op_Multiply", 
                        "op_Division",
                        "op_UnaryNegation",
                        "op_Equality", 
                        "op_Inequality",
                        "op_LessThan",
                        "op_GreaterThan",
                        "op_LessThanOrEqual",
                        "op_GreaterThanOrEqual",
                        "Equals", 
                        "CompareTo"
                    };
                    
                    var match = methods.FirstOrDefault(m => commonDoubleNames.Contains(m.Name));
                    if (match != null) return match;
                }

                // Add Object support
                var objectType = Type.GetType("System.Object");
                if (objectType != null)
                {
                    var methods = objectType.GetMethods(
                        System.Reflection.BindingFlags.Public | 
                        System.Reflection.BindingFlags.Static |
                        System.Reflection.BindingFlags.Instance);
                    
                    var commonObjectNames = new[] { 
                        "Equals",
                        "GetHashCode",
                        "GetType",
                        "ToString",
                        "ReferenceEquals"
                    };
                    
                    var match = methods.FirstOrDefault(m => commonObjectNames.Contains(m.Name));
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

        private string GetAvailableRegister(Asm68000StackSimulator stack)
        {
            return stack.AllocateDataRegister();
        }
    }
}