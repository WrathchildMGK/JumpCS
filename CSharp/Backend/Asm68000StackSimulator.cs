namespace JumpCS.Backend
{
    /// <summary>Stack simulator for tracking evaluation stack during MSIL translation</summary>
    public class Asm68000StackSimulator
    {
        private List<string> _stack = new();
        private int _spillOffset;
        private readonly int _maxLocals;
        private readonly int _maxStack;

        // Register pools - now separated by purpose
        private readonly string[] _dataRegisters = { "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7" };
        private readonly string[] _addressRegisters = { "A0", "A1", "A2", "A3", "A4", "A5" };

        // Track which registers are currently allocated
        private Queue<string> _availableDataRegisters;
        private Queue<string> _availableAddressRegisters;

        public int StackDepth => _stack.Count;
        public int CurrentFrameOffset => _spillOffset;

        public Asm68000StackSimulator(int maxLocals, int maxStack)
        {
            _maxLocals = maxLocals;
            _maxStack = maxStack;
            _spillOffset = -maxLocals * 4 - 4;

            // Initialize register queues
            _availableDataRegisters = new Queue<string>(_dataRegisters);
            _availableAddressRegisters = new Queue<string>(_addressRegisters);
        }

        /// <summary>Get next available data register for arithmetic operations</summary>
        public string GetNextDataRegister()
        {
            int registerIndex = _stack.Count;

            if (registerIndex < _dataRegisters.Length)
            {
                return _dataRegisters[registerIndex];
            }

            return _dataRegisters[registerIndex % _dataRegisters.Length];
        }

        /// <summary>Allocate a data register (D0-D7) for temporary arithmetic use. Safe to destroy.</summary>
        public string AllocateDataRegister()
        {
            if (_availableDataRegisters.Count == 0)
            {
                // Wrap around - reuse registers (they're for temporary data anyway)
                return _dataRegisters[0];
            }

            return _availableDataRegisters.Dequeue();
        }

        /// <summary>Release a data register back to the pool for reuse</summary>
        public void ReleaseDataRegister(string register)
        {
            if (Array.Exists(_dataRegisters, r => r == register))
            {
                _availableDataRegisters.Enqueue(register);
            }
        }

        /// <summary>Allocate an address register (A0-A5) for struct addresses. Must be preserved.</summary>
        public string AllocateAddressRegister()
        {
            if (_availableAddressRegisters.Count == 0)
            {
                throw new InvalidOperationException("No address registers available - too many nested struct operations");
            }

            return _availableAddressRegisters.Dequeue();
        }

        /// <summary>Release an address register back to the pool for reuse</summary>
        public void ReleaseAddressRegister(string register)
        {
            if (Array.Exists(_addressRegisters, r => r == register))
            {
                _availableAddressRegisters.Enqueue(register);
            }
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
            _availableDataRegisters = new Queue<string>(_dataRegisters);
            _availableAddressRegisters = new Queue<string>(_addressRegisters);
        }
    }
}