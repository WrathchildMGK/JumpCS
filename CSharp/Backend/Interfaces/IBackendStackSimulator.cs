namespace JumpCS.Backend.Interfaces
{
    public interface IBackendStackSimulator
    {
        int CurrentFrameOffset { get; }
        bool IsTopDoubleWord { get; }
        int StackDepth { get; }

        string AllocateAddressRegister();
        string AllocateDataRegister();
        void Clear();
        string GetNextDataRegister();
        string Peek();
        string Pop();
        void Push(string register, bool isDoubleWord = false);
        void ReleaseAddressRegister(string register);
        void ReleaseDataRegister(string register);
    }
}