using JumpCS.Backend.Interfaces;

namespace JumpCS.Backend.CC65
{
    /// <summary>Stack simulator for tracking evaluation stack during MSIL translation</summary>
    public class CC65StackSimulator : IBackendStackSimulator
    {
        private List<string> _stack = new();
        private List<bool> _stackIsDoubleWord = new();
        private int _spillOffset;
        private readonly int _maxLocals;
        private readonly int _maxStack;

        // Register pools - now separated by purpose
        private readonly string[] _dataRegisters = { "D0", "D1", "D2", "D3", "D4", "D5", "D6", "D7" };
        private readonly string[] _addressRegisters = { "A0", "A1", "A2", "A3", "A4", "A5" };

        // Track which registers are currently allocated - using Stack (LIFO)
        private Stack<string> _availableDataRegisters;
        private Stack<string> _availableAddressRegisters;

        public int StackDepth => _stack.Count;
        public int CurrentFrameOffset => _spillOffset;

        /// <summary>Whether the top stack entry is part of a double-word (64-bit) pair</summary>
        public bool IsTopDoubleWord => _stackIsDoubleWord.Count > 0 && _stackIsDoubleWord[^1];

        public CC65StackSimulator(int maxLocals, int maxStack)
        {
            _maxLocals = maxLocals;
            _maxStack = maxStack;
            _spillOffset = -maxLocals * 4 - 4;

            // Initialize register stacks (LIFO) - push D7,D6,D5...D1,D0 so D7 pops first
            var dataRegsForStack = new Stack<string>();
            for (int i = 7; i >= 0; i--)
            {
                dataRegsForStack.Push(_dataRegisters[i]);
            }
            _availableDataRegisters = dataRegsForStack;

            var addrRegsForStack = new Stack<string>();
            for (int i = 5; i >= 0; i--)
            {
                addrRegsForStack.Push(_addressRegisters[i]);
            }
            _availableAddressRegisters = addrRegsForStack;
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
                // All allocated - try to reclaim registers not on stack
                foreach (var reg in _dataRegisters)
                {
                    if (!_stack.Contains(reg))
                    {
                        _availableDataRegisters.Push(reg);
                    }
                }

                // If still nothing, we're truly exhausted
                if (_availableDataRegisters.Count == 0)
                {
                    if (Program.CodeOptions?.Verbosity >= 2)
                    {
                        Console.WriteLine("\n[CRITICAL] REGISTER EXHAUSTION:");
                        Console.WriteLine($"  Stack depth: {_stack.Count}");
                        Console.WriteLine($"  Registers on stack: {string.Join(", ", _stack)}");
                        Console.WriteLine($"  Available registers: {string.Join(", ", _availableDataRegisters)}");
                        Console.WriteLine($"  All registers: {string.Join(", ", _dataRegisters)}");
                    }

                    throw new InvalidOperationException($"Evaluation stack overflow: all {_dataRegisters.Length} data registers in use. Stack contains: {string.Join(", ", _stack)}");
                }
            }

            // Pop from the LIFO queue
            string allocated = _availableDataRegisters.Pop();

            // If the popped register is on the stack, find a replacement
            if (_stack.Contains(allocated))
            {
                // Search all registers for one NOT on the stack
                foreach (var reg in _dataRegisters)
                {
                    if (!_stack.Contains(reg))
                    {
                        if (Program.CodeOptions?.Verbosity >= 2)
                        {
                            Console.WriteLine($"[ALLOC] Allocated {reg} (fallback, queue had {allocated} which was on stack) | Stack depth: {_stack.Count}");
                        }
                        return reg;
                    }
                }

                // No clean registers available - truly exhausted
                throw new InvalidOperationException($"Evaluation stack overflow: all {_dataRegisters.Length} data registers in use. Stack contains: {string.Join(", ", _stack)}");
            }

            if (Program.CodeOptions?.Verbosity >= 2)
            {
                Console.WriteLine($"[ALLOC] Allocated {allocated} | Stack depth: {_stack.Count} | Available: {_availableDataRegisters.Count}");
            }

            return allocated;
        }

        /// <summary>Release a data register back to the pool for reuse</summary>
        public void ReleaseDataRegister(string register)
        {
            if (Array.Exists(_dataRegisters, r => r == register))
            {
                _availableDataRegisters.Push(register);
            }
        }

        /// <summary>Allocate an address register (A0-A5) for struct addresses. Must be preserved.</summary>
        public string AllocateAddressRegister()
        {
            if (_availableAddressRegisters.Count == 0)
            {
                throw new InvalidOperationException("No address registers available - too many nested struct operations");
            }

            return _availableAddressRegisters.Pop();
        }

        /// <summary>Release an address register back to the pool for reuse</summary>
        public void ReleaseAddressRegister(string register)
        {
            if (Array.Exists(_addressRegisters, r => r == register))
            {
                _availableAddressRegisters.Push(register);
            }
        }

        /// <summary>Push a register onto the evaluation stack</summary>
        public void Push(string register, bool isDoubleWord = false)
        {
            if (_stack.Count > _maxStack)
                throw new InvalidOperationException("Evaluation stack overflow");

            _stack.Add(register);
            _stackIsDoubleWord.Add(isDoubleWord);

            if (Program.CodeOptions?.Verbosity >= 2)
            {
                Console.WriteLine($"[PUSH] {register}{(isDoubleWord ? " (dbl)" : "")} | Stack depth: {_stack.Count} ({string.Join(", ", _stack)})");
            }
        }

        /// <summary>Pop a register from the evaluation stack</summary>
        public string Pop()
        {
            if (_stack.Count == 0)
                throw new InvalidOperationException("Evaluation stack underflow");

            string register = _stack[^1];
            _stack.RemoveAt(_stack.Count - 1);
            _stackIsDoubleWord.RemoveAt(_stackIsDoubleWord.Count - 1);

            if (Program.CodeOptions?.Verbosity >= 2)
            {
                Console.WriteLine($"[POP] {register} | Stack depth: {_stack.Count} ({string.Join(", ", _stack)})");
            }

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
            _stackIsDoubleWord.Clear();
            _spillOffset = -_maxLocals * 4 - 4;

            // Re-initialize register stacks
            var dataRegsForStack = new Stack<string>();
            for (int i = 7; i >= 0; i--)
            {
                dataRegsForStack.Push(_dataRegisters[i]);
            }
            _availableDataRegisters = dataRegsForStack;

            var addrRegsForStack = new Stack<string>();
            for (int i = 5; i >= 0; i--)
            {
                addrRegsForStack.Push(_addressRegisters[i]);
            }
            _availableAddressRegisters = addrRegsForStack;
        }
    }
}