using JumpCS.Backend.Interfaces;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.SystemTypes
{
    public interface ISystemIntegerHandler
    {
        void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack);
        void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack);
        bool IsMethod(MethodMetadata method);
        bool IsReflectionMethod(MethodBase method);
    }
}