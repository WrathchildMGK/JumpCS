using System.Reflection;
using System.Text;

namespace JumpCS.Backend.SystemTypes
{
    /// <summary>Base class for handling System.* type operations</summary>
    public abstract class SystemHandlerBase
    {
        protected readonly StreamWriter AsmWriter;
        protected readonly Func<Asm68000StackSimulator, string> GetAvailableRegister;
        protected readonly Func<string> GetUniqueLabel;

        protected SystemHandlerBase(
            StreamWriter asmWriter,
            Func<Asm68000StackSimulator, string> getAvailableRegister,
            Func<string> getUniqueLabel = null)
        {
            AsmWriter = asmWriter;
            GetAvailableRegister = getAvailableRegister;
            GetUniqueLabel = getUniqueLabel ?? (() => "L_0");
        }

        /// <summary>Check if a method is for this type</summary>
        public abstract bool IsMethod(JumpCS.Core.MethodMetadata method);

        /// <summary>Check if a reflection method is for this type</summary>
        public abstract bool IsReflectionMethod(MethodBase method);

        /// <summary>Handle method call from compiled metadata</summary>
        public abstract void HandleMethodCall(JumpCS.Core.MethodMetadata method, Asm68000StackSimulator stack);

        /// <summary>Handle method call from reflection</summary>
        public abstract void HandleReflectionMethodCall(MethodBase methodInfo, Asm68000StackSimulator stack);

        /// <summary>Try to handle method - returns true if handled</summary>
        public virtual bool TryHandleMethod(JumpCS.Core.MethodMetadata method, Asm68000StackSimulator stack)
        {
            if (!IsMethod(method))
                return false;

            HandleMethodCall(method, stack);
            return true;
        }

        /// <summary>Try to handle reflection method - returns true if handled</summary>
        public virtual bool TryHandleReflectionMethod(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            if (!IsReflectionMethod(methodInfo))
                return false;

            HandleReflectionMethodCall(methodInfo, stack);
            return true;
        }

        /// <summary>Handle newobj constructor call</summary>
        public virtual void HandleNewObj(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            // Override in subclasses if needed
        }

        /// <summary>Try to handle newobj - returns true if handled</summary>
        public virtual bool TryHandleNewObj(MethodBase methodInfo, Asm68000StackSimulator stack)
        {
            if (methodInfo?.DeclaringType == null)
                return false;

            HandleNewObj(methodInfo, stack);
            return true;
        }
    }
}