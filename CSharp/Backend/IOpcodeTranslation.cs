using JumpCS.Backend;

namespace CSharp.Backend
{
    public interface IOpcodeTranslation
    {
        void Translate(object? operand, Asm68000StackSimulator stack, StreamWriter asmWriter);
    }
}