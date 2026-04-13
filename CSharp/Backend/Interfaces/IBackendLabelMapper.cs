namespace JumpCS.Backend.Interfaces
{
    public interface IBackendLabelMapper
    {
        void Clear();
        string GetOrCreateLabel(int msilOffset);
        string GetUniqueLabel();
    }
}