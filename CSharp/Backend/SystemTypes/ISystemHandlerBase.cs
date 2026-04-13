using JumpCS.Backend.Interfaces;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.SystemTypes
{
    public interface ISystemHandlerBase
    {
        void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack);
        void HandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack);
        void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack);
        bool IsMethod(MethodMetadata method);
        bool IsReflectionMethod(MethodBase method);
        bool TryHandleMethod(MethodMetadata method, IBackendStackSimulator stack);
        bool TryHandleNewObj(MethodBase methodInfo, IBackendStackSimulator stack);
        bool TryHandleReflectionMethod(MethodBase methodInfo, IBackendStackSimulator stack);
    }
}