using JumpCS.Backend.Asm68000;
using JumpCS.Backend.CC65;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;

namespace JumpCS.Backend
{
    /// <summary>
    /// Factory for creating backend and peephole optimizer instances based on target platform
    /// </summary>
    public static class BackendFactory
    {
        /// <summary>Create a backend instance for the specified target platform</summary>
        public static IBackEnd CreateBackend(TargetPlatform target, string outputBaseName, MemoryModel memoryModel = MemoryModel.Small)
        {
            return target switch
            {
                TargetPlatform.AtariCC65 => new CC65BackEnd(outputBaseName, memoryModel),
                TargetPlatform.Motorola68000 => new Asm68000BackEnd(outputBaseName),
                _ => throw new ArgumentException($"Unsupported target platform: {target}")
            };
        }

        /// <summary>Create a peephole optimizer instance for the specified target platform</summary>
        public static Base.PeepholeBase CreatePeepholeOptimizer(TargetPlatform target)
        {
            return target switch
            {
                TargetPlatform.AtariCC65 => new CC65.Optimization.Peephole(),
                TargetPlatform.Motorola68000 => new Asm68000.Optimization.Peephole(),
                _ => throw new ArgumentException($"Unsupported target platform for peephole optimization: {target}")
            };
        }
    }
}