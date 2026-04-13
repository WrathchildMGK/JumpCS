using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.Asm68000
{
    public class Asm68000LabelMapper : IBackendLabelMapper
    {
        /// <summary>Label mapping for control flow targets</summary>
        private Dictionary<int, string> _offsetToLabel = new();
        private int _labelCounter = 0;

        public string GetOrCreateLabel(int msilOffset)
        {
            if (!_offsetToLabel.TryGetValue(msilOffset, out var label))
            {
                label = $"L_{msilOffset:X4}";
                _offsetToLabel[msilOffset] = label;
            }
            return label;
        }

        public string GetUniqueLabel()
        {
            return $"L_{_labelCounter++}";
        }

        public void Clear()
        {
            _offsetToLabel.Clear();
        }
    }
}
