using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000.Opcodes
{
    public class Endfinally : IOpcodeTranslation
    {
        public void Translate(object? operand, IBackendSupport support)
        {
            support.AsmWriter.WriteLine($"    ; Endfinally - exit exception handler");
            // In 68000, this typically means jump to the end of the exception handler
            // The actual target will be determined by the exception handling mechanism
        }
    }
}