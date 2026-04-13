using JumpCS.Backend.Interfaces;
using System.Reflection;

namespace JumpCS.Backend.Base
{
    /// <summary>Base class for handling System.* type operations</summary>
    public abstract class SystemHandlerBase
    {
        protected readonly StreamWriter AsmWriter;
        protected readonly Func<IBackendStackSimulator, string> GetAvailableRegister;
        protected readonly Func<string> GetUniqueLabel;

        protected SystemHandlerBase(
            StreamWriter asmWriter,
            Func<IBackendStackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel = null)
        {
            AsmWriter = asmWriter;
            GetAvailableRegister = getAvailableRegister;
            GetUniqueLabel = getUniqueLabel ?? (() => "L_0");
        }

        /// <summary>Check if a method is for this type</summary>
        public abstract bool IsMethod(Core.MethodMetadata method);

        /// <summary>Check if a reflection method is for this type</summary>
        public abstract bool IsReflectionMethod(MethodBase method);

        /// <summary>Handle method call from compiled metadata</summary>
        public abstract void HandleMethodCall(Core.MethodMetadata method, IBackendStackSimulator stack);

        /// <summary>Handle method call from reflection</summary>
        public abstract void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack);

        /// <summary>Try to handle method - returns true if handled</summary>
        public virtual bool TryHandleMethod(Core.MethodMetadata method, IBackendStackSimulator stack)
        {
            if (!IsMethod(method))
                return false;

            HandleMethodCall(method, stack);
            return true;
        }

        /// <summary>Try to handle reflection method - returns true if handled</summary>
        public virtual bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            if (!IsReflectionMethod(methodInfo))
                return false;

            HandleReflectionMethodCall(methodInfo, stack);
            return true;
        }

        /// <summary>Handle newobj constructor call</summary>
        public virtual void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            // Override in subclasses if needed
        }

        /// <summary>Try to handle newobj - returns true if handled</summary>
        public virtual bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack)
        {
            if (methodInfo?.DeclaringType == null)
                return false;

            HandleNewObj(methodInfo, stack);
            return true;
        }
    }
}