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
                // Update _nextIndex based on operand size
                _nextIndex += GetOperandSize(opcode);
            }

            CurrentOperand = operand;
            return true;
        }

        /// <summary>Get the size of an operand based on opcode type</summary>
        private int GetOperandSize(OpCode opcode)
        {
            return opcode.OperandType switch
            {
                OperandType.InlineI => 4,
                OperandType.InlineI8 => 8,
                OperandType.InlineR => 8,
                OperandType.InlineVar => 2,
                OperandType.ShortInlineI => 1,
                OperandType.ShortInlineVar => 1,
                OperandType.ShortInlineR => 4,  // ← ADD THIS: 4-byte float
                OperandType.InlineTok => 4,
                OperandType.InlineMethod => 4,
                OperandType.InlineField => 4,
                OperandType.InlineType => 4,
                OperandType.InlineString => 4,
                OperandType.InlineBrTarget => 4,
                OperandType.ShortInlineBrTarget => 1,
                OperandType.InlineSwitch => 0,  // Handled specially in ReadSwitchTargets
                _ => 0
            };
        }

        /// <summary>Decode operand value based on opcode type</summary>
        private object? DecodeOperand(OpCode opcode)
        {
            object? result = opcode.OperandType switch
            {
                OperandType.InlineI =>
                    ReadInt32(_nextIndex),

                OperandType.InlineI8 =>
                    ReadInt64(_nextIndex),

                OperandType.InlineR =>
                    // CRITICAL: InlineR is 8 bytes (double)
                    // ldc.r8 (8-byte double) uses InlineR
                    ReadDouble(_nextIndex),

                OperandType.ShortInlineR =>
                    // ADD THIS: 4-byte float (single precision)
                    // ldc.r4 (4-byte float) uses ShortInlineR
                    ReadFloat(_nextIndex),

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

            // Debug tracing for ldc.r4/ldc.r8
            if (opcode == OpCodes.Ldc_R4 || opcode == OpCodes.Ldc_R8)
            {
                if (Program.CodeOptions?.Verbosity >= 2)
                {
                    Console.WriteLine($"[DEBUG] {opcode.Name} at offset {_currentIndex:X4}:");
                    Console.WriteLine($"  OperandType: {opcode.OperandType}");
                    Console.WriteLine($"  Result type: {result?.GetType().Name ?? "null"}");
                    Console.WriteLine($"  Result value: {result ?? "null"}");
                    if (result != null)
                    {
                        Console.WriteLine($"  Hex bytes: {string.Join(" ", _ilBytes.Skip(_nextIndex).Take(8).Select(b => b.ToString("X2")))}");
                    }
                }
            }

            return result;
        }

        /// <summary>Read 32-bit float (for ldc.r4)</summary>
        private float ReadFloat(int offset)
        {
            if (offset + 3 >= _ilBytes.Length)
                return 0f;
            int intBits = _ilBytes[offset] |
                (_ilBytes[offset + 1] << 8) |
                (_ilBytes[offset + 2] << 16) |
                (_ilBytes[offset + 3] << 24);
            return BitConverter.Int32BitsToSingle(intBits);
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