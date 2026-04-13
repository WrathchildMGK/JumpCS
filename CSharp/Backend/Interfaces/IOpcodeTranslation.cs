namespace JumpCS.Backend.Interfaces
{
    public interface IOpcodeTranslation
    {
        void Translate(object? operand, IBackendSupport support);
    }
}