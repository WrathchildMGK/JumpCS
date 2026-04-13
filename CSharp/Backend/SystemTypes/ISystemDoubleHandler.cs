using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.SystemTypes
{
    public interface ISystemDoubleHandler : ISystemHandlerBase
    {
        void HandleAddition(IBackendStackSimulator stack);
        void HandleDivision(IBackendStackSimulator stack);
        void HandleMultiply(IBackendStackSimulator stack);
        void HandleRemainder(IBackendStackSimulator stack);
        void HandleSubtraction(IBackendStackSimulator stack);
    }
}