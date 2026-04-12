using System.Reflection;
using System.Reflection.Emit;
using JumpCS.Core;

namespace JumpCS.Backend
{
    /// <summary>Abstract base class for assembly code generators</summary>
    public abstract class BackEnd
    {
        protected string OutputBaseName { get; }
        protected List<string> GeneratedFiles { get; } = new();
        protected Dictionary<int, MethodMetadata?> _methodCache = new();

        public BackEnd(string outputBaseName)
        {
            OutputBaseName = outputBaseName;
        }

        /// <summary>Update method - resolve dependencies, calculate code sizes</summary>
        public abstract void UpdateAll();

        /// <summary>Generate target output (assembly code, machine code, etc.)</summary>
        public abstract void Generate();

        /// <summary>Report generation statistics</summary>
        public virtual void Report()
        {
            Console.WriteLine($"Backend: {GetType().Name}");
            Console.WriteLine($"Output files: {string.Join(", ", GeneratedFiles)}");
        }

        /// <summary>Insert native method implementations for a class</summary>
        public virtual void InsertNatives(ClassMetadata cls)
        {
            // Override in subclasses to provide native implementations
        }

        protected void AddGeneratedFile(string path)
        {
            GeneratedFiles.Add(path);
        }

        // --- MSIL Resolution ---

        /// <summary>Analyze MSIL bytecode to discover method call dependencies</summary>
        protected void AnalyzeMsilDependencies()
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

        /// <summary>Resolve a method token to a MethodBase via reflection</summary>
        protected MethodBase? MyGetMethodInfo(ClassMetadata callingClass, int methodToken)
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
        protected MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken)
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

        /// <summary>Build a method signature string from reflection info</summary>
        protected string GetMethodSignature(MethodBase method)
        {
            var paramTypes = method.GetParameters()
                .Select(p => GetTypeSignature(p.ParameterType))
                .ToList();

            string returnType = method is MethodInfo mi ?
                GetTypeSignature(mi.ReturnType) : "V";

            var paramList = string.Concat(paramTypes);
            return $"({paramList}){returnType}";
        }

        /// <summary>Map a .NET type to a single-character signature</summary>
        protected string GetTypeSignature(Type type)
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

        /// <summary>Check if a method token refers to a framework method</summary>
        protected bool IsFrameworkMethod(int methodToken, ClassMetadata callingClass)
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

        /// <summary>Try to resolve a framework method via reflection</summary>
        protected MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
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

        /// <summary>Last-resort identification of common System.* methods</summary>
        protected MethodBase? TryIdentifySystemMethod(int methodToken)
        {
            try
            {
                var mathType = Type.GetType("System.Math");
                if (mathType != null)
                {
                    var methods = mathType.GetMethods(
                        BindingFlags.Public | BindingFlags.Static);

                    var match = methods.FirstOrDefault(m =>
                        new[] { "Abs", "Round", "Truncate", "Floor", "Ceiling", "Min", "Max" }.Contains(m.Name));
                    if (match != null) return match;
                }

                var decimalType = Type.GetType("System.Decimal");
                if (decimalType != null)
                {
                    var methods = decimalType.GetMethods(
                        BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance);

                    var commonDecimalNames = new[] {
                        ".ctor", "op_Addition", "op_Subtraction", "op_Multiply", "op_Division",
                        "op_Modulus", "op_UnaryNegation", "op_Negation",
                        "op_LessThan", "op_GreaterThan", "op_LessThanOrEqual", "op_GreaterThanOrEqual",
                        "op_Equality", "op_Inequality", "Equals", "CompareTo"
                    };

                    var match = methods.FirstOrDefault(m => commonDecimalNames.Contains(m.Name));
                    if (match != null) return match;
                }

                var int32Type = Type.GetType("System.Int32");
                if (int32Type != null)
                {
                    var methods = int32Type.GetMethods(
                        BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance);

                    var commonInt32Names = new[] {
                        ".ctor", "op_Addition", "op_Subtraction", "op_Multiply", "op_Division",
                        "op_Modulus", "op_BitwiseAnd", "op_BitwiseOr", "op_ExclusiveOr",
                        "op_LeftShift", "op_RightShift", "op_UnaryNegation", "op_OnesComplement",
                        "op_Equality", "op_Inequality", "op_LessThan", "op_GreaterThan",
                        "op_LessThanOrEqual", "op_GreaterThanOrEqual", "Equals", "CompareTo"
                    };

                    var match = methods.FirstOrDefault(m => commonInt32Names.Contains(m.Name));
                    if (match != null) return match;
                }

                var singleType = Type.GetType("System.Single");
                if (singleType != null)
                {
                    var methods = singleType.GetMethods(
                        BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance);

                    var commonSingleNames = new[] {
                        ".ctor", "op_Addition", "op_Subtraction", "op_Multiply", "op_Division",
                        "op_UnaryNegation", "op_Equality", "op_Inequality",
                        "op_LessThan", "op_GreaterThan", "op_LessThanOrEqual", "op_GreaterThanOrEqual",
                        "Equals", "CompareTo"
                    };

                    var match = methods.FirstOrDefault(m => commonSingleNames.Contains(m.Name));
                    if (match != null) return match;
                }

                var doubleType = Type.GetType("System.Double");
                if (doubleType != null)
                {
                    var methods = doubleType.GetMethods(
                        BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance);

                    var commonDoubleNames = new[] {
                        ".ctor", "op_Addition", "op_Subtraction", "op_Multiply", "op_Division",
                        "op_UnaryNegation", "op_Equality", "op_Inequality",
                        "op_LessThan", "op_GreaterThan", "op_LessThanOrEqual", "op_GreaterThanOrEqual",
                        "Equals", "CompareTo"
                    };

                    var match = methods.FirstOrDefault(m => commonDoubleNames.Contains(m.Name));
                    if (match != null) return match;
                }

                var objectType = Type.GetType("System.Object");
                if (objectType != null)
                {
                    var methods = objectType.GetMethods(
                        BindingFlags.Public | BindingFlags.Static | BindingFlags.Instance);

                    var commonObjectNames = new[] {
                        "Equals", "GetHashCode", "GetType", "ToString", "ReferenceEquals"
                    };

                    var match = methods.FirstOrDefault(m => commonObjectNames.Contains(m.Name));
                    if (match != null) return match;
                }
            }
            catch { }

            return null;
        }
    }
}