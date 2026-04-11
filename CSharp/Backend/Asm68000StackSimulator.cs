namespace JumpCS.Backend
{
    /// <summary>Stack simulator for tracking evaluation stack during MSIL translation</summary>
    public class Asm68000StackSimulator
    {
        private List<string> _stack = new();
        private int _spillOffset;
        private readonly int _maxLocals;
        private readonly int _maxStack;
        private readonly string[] _dataRegisters = { "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7" };

        public int StackDepth => _stack.Count;
        public int CurrentFrameOffset => _spillOffset;

        public Asm68000StackSimulator(int maxLocals, int maxStack)
        {
            _maxLocals = maxLocals;
            _maxStack = maxStack;
            _spillOffset = -maxLocals * 4 - 4;
        }

        /// <summary>Get next available register based on current stack depth</summary>
        public string GetNextRegister()
        {
            int registerIndex = _stack.Count;
            
            if (registerIndex < _dataRegisters.Length)
            {
                return _dataRegisters[registerIndex];
            }
            
            return _dataRegisters[registerIndex % _dataRegisters.Length];
        }

        /// <summary>Push a register onto the evaluation stack</summary>
        public void Push(string register)
        {
            if (_stack.Count >= _maxStack)
                throw new InvalidOperationException("Evaluation stack overflow");
            _stack.Add(register);
        }

        /// <summary>Pop a register from the evaluation stack</summary>
        public string Pop()
        {
            if (_stack.Count == 0)
                throw new InvalidOperationException("Evaluation stack underflow");
            string register = _stack[^1];
            _stack.RemoveAt(_stack.Count - 1);
            return register;
        }

        /// <summary>Peek at top of stack without popping</summary>
        public string Peek()
        {
            if (_stack.Count == 0)
                throw new InvalidOperationException("Evaluation stack is empty");
            return _stack[^1];
        }

        /// <summary>Clear the stack and reset register allocation</summary>
        public void Clear()
        {
            _stack.Clear();
            _spillOffset = -_maxLocals * 4 - 4;
        }
    }
}