using System.Reflection;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;

namespace JumpCS.Backend.Core
{
    /// <summary>
    /// Registry of framework/system methods that have implementations (either direct
    /// low-level library functions or via system type handlers). This prevents us from
    /// trying to compile framework code and allows us to emit appropriate calls.
    /// </summary>
    public static class FrameworkMethodRegistry
    {
        // Direct library function mappings (for methods with explicit low-level implementations)
        private static readonly Dictionary<string, FrameworkMethodInfo> _directRegistry = new()
        {
            // System.Console methods
            ["System.Console::WriteLine()V"] = new("__console_writeline_empty", 0),
            ["System.Console::WriteLine(Ljava/lang/String;)V"] = new("__console_writeline", 1),
            ["System.Console::WriteLine(I)V"] = new("__console_writeline_int", 1),
            ["System.Console::WriteLine(D)V"] = new("__console_writeline_double", 1),
            ["System.Console::Write(Ljava/lang/String;)V"] = new("__console_write", 1),
            ["System.Console::Write(I)V"] = new("__console_write_int", 1),
            ["System.Console::Write(D)V"] = new("__console_write_double", 1),
            ["System.Console::ReadLine()Ljava/lang/String;"] = new("__console_readline", 0, true),
            ["System.Console::Read()I"] = new("__console_read", 0, true),

            // System.Math methods
            ["System.Math::Round(D)D"] = new("__round", 1, true),
            ["System.Math::Floor(D)D"] = new("__floor", 1, true),
            ["System.Math::Ceiling(D)D"] = new("__ceil", 1, true),
            ["System.Math::Truncate(D)D"] = new("__trunc", 1, true),
            ["System.Math::Sqrt(D)D"] = new("__sqrt", 1, true),
            ["System.Math::Abs(D)D"] = new("__abs_double", 1, true),
            ["System.Math::Abs(I)I"] = new("__abs_int", 1, true),
            ["System.Math::Min(II)I"] = new("__min_int", 2, true),
            ["System.Math::Max(II)I"] = new("__max_int", 2, true),
        };

        /// <summary>
        /// System type handlers that can handle entire System.* classes
        /// (These are instantiated on-demand and cached)
        /// </summary>
        private static readonly Lazy<ISystemHandlerBase[]> _systemHandlers = 
            new(() => new ISystemHandlerBase[]
            {
                // Order matters - more specific handlers first
                new SystemDecimalHandlerProxy(),
                new SystemMathHandlerProxy(),
                new SystemDoubleHandlerProxy(),
                new SystemFloatHandlerProxy(),
                new SystemIntegerHandlerProxy(),
                new SystemObjectHandlerProxy(),
                new SystemConsoleHandlerProxy(),
                // NOTE: DefaultInterpolatedStringHandler removed as test
            });

        /// <summary>
        /// Check if a framework method has a low-level implementation available
        /// (either direct library function or via system type handler)
        /// </summary>
        public static bool IsSupported(string fullTypeName, string methodName, string signature)
        {
            // Check direct registry first
            string key = $"{fullTypeName}::{methodName}{signature}";
            if (_directRegistry.ContainsKey(key))
                return true;

            // Check if any system handler supports this type
            foreach (var handler in _systemHandlers.Value)
            {
                // Create a dummy MethodInfo to test if handler supports it
                try
                {
                    var type = Type.GetType(fullTypeName);
                    if (type == null)
                        continue;

                    var method = type.GetMethod(methodName, 
                        System.Reflection.BindingFlags.Public | 
                        System.Reflection.BindingFlags.Static |
                        System.Reflection.BindingFlags.Instance);
                    
                    if (method != null && handler.IsReflectionMethod(method))
                        return true;
                }
                catch
                {
                    // Silently skip - type might not exist or be accessible
                }
            }

            return false;
        }

        /// <summary>
        /// Check if a reflection method has a low-level implementation available
        /// </summary>
        public static bool IsSupported(MethodBase method)
        {
            string typeName = method.DeclaringType?.FullName ?? "";
            string methodName = method.Name;
            
            var parameters = method is MethodInfo mi ? mi.GetParameters() : method.GetParameters();
            string paramSig = string.Concat(parameters.Select(p => GetTypeSignature(p.ParameterType)));
            
            string returnSig = method is MethodInfo mi2 
                ? GetTypeSignature(mi2.ReturnType)
                : "V";
            
            string signature = $"({paramSig}){returnSig}";
            
            // Check direct registry
            string key = $"{typeName}::{methodName}{signature}";
            if (_directRegistry.ContainsKey(key))
                return true;

            // Check system handlers
            foreach (var handler in _systemHandlers.Value)
            {
                if (handler.IsReflectionMethod(method))
                    return true;
            }

            return false;
        }

        /// <summary>
        /// Get the low-level implementation details for a framework method
        /// Returns null if method is handled by a system type handler
        /// </summary>
        public static bool TryGetDirectImplementation(string fullTypeName, string methodName, string signature, 
            out FrameworkMethodInfo info)
        {
            string key = $"{fullTypeName}::{methodName}{signature}";
            return _directRegistry.TryGetValue(key, out info!);
        }

        /// <summary>
        /// Get the low-level implementation details from a reflection method
        /// Returns null if method is handled by a system type handler (caller should use handler directly)
        /// </summary>
        public static bool TryGetDirectImplementation(MethodBase method, out FrameworkMethodInfo info)
        {
            string typeName = method.DeclaringType?.FullName ?? "";
            string methodName = method.Name;
            
            var parameters = method is MethodInfo mi ? mi.GetParameters() : method.GetParameters();
            string paramSig = string.Concat(parameters.Select(p => GetTypeSignature(p.ParameterType)));
            
            string returnSig = method is MethodInfo mi2 
                ? GetTypeSignature(mi2.ReturnType)
                : "V";
            
            string signature = $"({paramSig}){returnSig}";
            return TryGetDirectImplementation(typeName, methodName, signature, out info);
        }

        /// <summary>
        /// Get the system type handler for a framework method, if one exists
        /// </summary>
        public static ISystemHandlerBase? GetSystemHandler(MethodBase method)
        {
            foreach (var handler in _systemHandlers.Value)
            {
                if (handler.IsReflectionMethod(method))
                    return handler;
            }
            return null;
        }

        /// <summary>
        /// Get all registered framework methods (for documentation/validation)
        /// </summary>
        public static IEnumerable<string> GetAllSupportedDirectMethods()
        {
            return _directRegistry.Keys.OrderBy(k => k);
        }

        private static string GetTypeSignature(Type type)
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
    }

    // --- Proxy handlers for system types ---
    // These are lightweight proxies that delegate to the actual handlers
    // They allow us to check if a method is supported without being target-specific

    internal interface ISystemHandlerProxy : ISystemHandlerBase
    {
    }

    internal class SystemDecimalHandlerProxy : ISystemHandlerProxy
    {
        public bool IsMethod(MethodMetadata method) => 
            method.OwningClass.FullName == "System.Decimal";
        public bool IsReflectionMethod(MethodBase method) => 
            method.DeclaringType?.FullName == "System.Decimal";
        public void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack) { }
        public void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack) => false;
        public bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) => false;
        public bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack) => false;
    }

    internal class SystemMathHandlerProxy : ISystemHandlerProxy
    {
        public bool IsMethod(MethodMetadata method) => 
            method.OwningClass.FullName == "System.Math";
        public bool IsReflectionMethod(MethodBase method) => 
            method.DeclaringType?.FullName == "System.Math";
        public void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack) { }
        public void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack) => false;
        public bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) => false;
        public bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack) => false;
    }

    internal class SystemDoubleHandlerProxy : ISystemHandlerProxy
    {
        public bool IsMethod(MethodMetadata method) => 
            method.OwningClass.FullName == "System.Double";
        public bool IsReflectionMethod(MethodBase method) => 
            method.DeclaringType?.FullName == "System.Double";
        public void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack) { }
        public void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack) => false;
        public bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) => false;
        public bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack) => false;
    }

    internal class SystemFloatHandlerProxy : ISystemHandlerProxy
    {
        public bool IsMethod(MethodMetadata method) => 
            method.OwningClass.FullName == "System.Single";
        public bool IsReflectionMethod(MethodBase method) => 
            method.DeclaringType?.FullName == "System.Single";
        public void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack) { }
        public void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack) => false;
        public bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) => false;
        public bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack) => false;
    }

    internal class SystemIntegerHandlerProxy : ISystemHandlerProxy
    {
        public bool IsMethod(MethodMetadata method) => 
            method.OwningClass.FullName == "System.Int32" || method.OwningClass.FullName == "System.Int64";
        public bool IsReflectionMethod(MethodBase method) => 
            method.DeclaringType?.FullName == "System.Int32" || method.DeclaringType?.FullName == "System.Int64";
        public void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack) { }
        public void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack) => false;
        public bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) => false;
        public bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack) => false;
    }

    internal class SystemObjectHandlerProxy : ISystemHandlerProxy
    {
        public bool IsMethod(MethodMetadata method) => 
            method.OwningClass.FullName == "System.Object";
        public bool IsReflectionMethod(MethodBase method) => 
            method.DeclaringType?.FullName == "System.Object";
        public void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack) { }
        public void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack) => false;
        public bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) => false;
        public bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack) => false;
    }

    internal class SystemConsoleHandlerProxy : ISystemHandlerProxy
    {
        public bool IsMethod(MethodMetadata method) => 
            method.OwningClass.FullName == "System.Console";
        public bool IsReflectionMethod(MethodBase method) => 
            method.DeclaringType?.FullName == "System.Console";
        public void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack) { }
        public void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack) { }
        public bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack) => false;
        public bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack) => false;
        public bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack) => false;
    }
}