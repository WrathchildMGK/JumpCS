using System.Reflection.Emit;

namespace JumpCS.Core
{
    /// <summary>Iterator for MSIL instructions within a method body</summary>
    public class MsilIterator
    {
        private readonly byte[] _ilBytes;
        private readonly MethodMetadata _method;
        private readonly ConstantPool? _constantPool;
        private int _currentIndex;
        private int _nextIndex;

        public int CurrentIndex => _currentIndex;
        public int NextIndex => _nextIndex;
        public OpCode CurrentOpcode { get; private set; }
        public object? CurrentOperand { get; private set; }

        public MsilIterator(byte[] ilBytes, MethodMetadata method, ConstantPool? pool = null)
        {
            _ilBytes = ilBytes;
            _method = method;
            _constantPool = pool;
            _currentIndex = 0;
            _nextIndex = 0;
        }

        /// <summary>Move to next instruction</summary>
        public bool MoveNext()
        {
            if (_nextIndex >= _ilBytes.Length)
                return false;

            _currentIndex = _nextIndex;
            return DecodeInstruction();
        }

        /// <summary>Decode current instruction</summary>
        private bool DecodeInstruction()
        {
            if (_currentIndex >= _ilBytes.Length)
                return false;

            byte opcodeByte = _ilBytes[_currentIndex];
            _nextIndex = _currentIndex + 1;

            OpCode opcode;
            int operandSize = 0;
            object? operand = null;

            // Handle two-byte opcodes
            if (opcodeByte == 0xFE && _currentIndex + 1 < _ilBytes.Length)
            {
                byte second = _ilBytes[_currentIndex + 1];
                opcode = FindOpCode(0xFE00 | second);
                _nextIndex = _currentIndex + 2;
            }
            else
            {
                opcode = FindOpCode(opcodeByte);
            }

            CurrentOpcode = opcode;

            // Decode operand based on opcode type
            if (opcode.OperandType != OperandType.InlineNone)
            {
                operand = DecodeOperand(opcode);
            }

            CurrentOperand = operand;
            return true;
        }

        /// <summary>Decode operand value based on opcode type</summary>
        private object? DecodeOperand(OpCode opcode)
        {
            return opcode.OperandType switch
            {
                OperandType.InlineI =>
                    ReadInt32(_nextIndex),

                OperandType.InlineI8 =>
                    ReadInt64(_nextIndex),

                OperandType.InlineR =>
                    ReadDouble(_nextIndex),

                OperandType.InlineVar =>
                    ReadInt16(_nextIndex),

                OperandType.ShortInlineI =>
                    (int)_ilBytes[_nextIndex],

                OperandType.ShortInlineVar =>
                    (int)_ilBytes[_nextIndex],

                OperandType.InlineTok or OperandType.InlineMethod or OperandType.InlineField or OperandType.InlineType =>
                    ReadInt32(_nextIndex),

                OperandType.InlineString =>
                    ReadInt32(_nextIndex),

                OperandType.InlineBrTarget =>
                    ReadInt32(_nextIndex),

                OperandType.ShortInlineBrTarget =>
                    (int)((sbyte)_ilBytes[_nextIndex]),

                OperandType.InlineSwitch =>
                    ReadSwitchTargets(),

                _ => null
            };
        }

        /// <summary>Read switch targets</summary>
        private int[]? ReadSwitchTargets()
        {
            int numTargets = ReadInt32(_nextIndex);
            var targets = new int[numTargets];

            int offset = _nextIndex + 4;
            for (int i = 0; i < numTargets; i++)
            {
                targets[i] = ReadInt32(offset);
                offset += 4;
            }

            _nextIndex = offset;
            return targets;
        }

        private int ReadInt32(int offset)
        {
            if (offset + 3 >= _ilBytes.Length)
                return 0;
            return _ilBytes[offset] |
                (_ilBytes[offset + 1] << 8) |
                (_ilBytes[offset + 2] << 16) |
                (_ilBytes[offset + 3] << 24);
        }

        private int ReadInt16(int offset)
        {
            if (offset + 1 >= _ilBytes.Length)
                return 0;
            return _ilBytes[offset] | (_ilBytes[offset + 1] << 8);
        }

        private long ReadInt64(int offset)
        {
            if (offset + 7 >= _ilBytes.Length)
                return 0;
            return ((long)ReadInt32(offset)) | (((long)ReadInt32(offset + 4)) << 32);
        }

        private double ReadDouble(int offset)
        {
            return BitConverter.Int64BitsToDouble(ReadInt64(offset));
        }

        private OpCode FindOpCode(int value)
        {
            try
            {
                var field = typeof(OpCodes).GetField($"Op{value:X4}") ??
                           typeof(OpCodes).GetFields()
                               .FirstOrDefault(f => ((OpCode)f.GetValue(null)!).Value == value);
                
                if (field != null)
                    return (OpCode)field.GetValue(null)!;
            }
            catch { }

            // Fallback for basic opcodes
            return value switch
            {
                0x00 => OpCodes.Nop,
                0x20 => OpCodes.Ldc_I4,
                0x23 => OpCodes.Ldc_I8,
                _ => OpCodes.Nop
            };
        }
    }
}