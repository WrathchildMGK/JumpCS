using JumpCS.Backend.Interfaces;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.SystemTypes
{
    public interface ISystemDoubleHandler
    {
        void HandleAddition(IBackendStackSimulator stack);
        void HandleDivision(IBackendStackSimulator stack);
        void HandleMethodCall(MethodMetadata method, IBackendStackSimulator stack);
        void HandleMultiply(IBackendStackSimulator stack);
        void HandleReflectionMethodCall(MethodBase methodInfo, IBackendStackSimulator stack);
        void HandleRemainder(IBackendStackSimulator stack);
        void HandleSubtraction(IBackendStackSimulator stack);
        bool IsMethod(MethodMetadata method);
        bool IsReflectionMethod(MethodBase method);
    }
}