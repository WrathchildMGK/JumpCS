using System.Text;
using JumpCS.Core;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.Base;

namespace JumpCS.Backend.CC65
{
    /// <summary>CC65 C/assembly code backend</summary>
    public class CC65BackEnd : BackEndBase, IBackEnd
    {
        // Constant tracking for ldc.r4 and ldc.r8
        private Dictionary<int, float> _floatConstants = new();
        private Dictionary<int, double> _doubleConstants = new();

        private StreamWriter _asmWriter;
        private CC65LabelMapper _labels;
        private CC65Support _support;
        private Dictionary<string, int> _methodOffsets = new();
        private int _currentOffset = 0;

        public CC65BackEnd(string outputBaseName) : base(outputBaseName)
        {
            _labels = new CC65LabelMapper();
        }

        /// <summary>Update dependencies and calculate code sizes</summary>
        public override void UpdateAll()
        {
            _methodCache.Clear();
            _methodOffsets.Clear();
            _currentOffset = 0;

            AnalyzeMsilDependencies();

            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
                foreach (var method in cls.Methods.Where(m => m.IsNeeded))
                {
                    _methodOffsets[method.ToString()] = _currentOffset;
                    _currentOffset += method.CodeLength * 3;
                }
            }
        }

        /// <summary>Generate CC65 assembly output</summary>
        public override void Generate()
        {
            string outputPath = $"{OutputBaseName}_generated_CC65.c";
            Console.WriteLine($"Generating CC65 code: {outputPath}");

            using (_asmWriter = new StreamWriter(outputPath, false, Encoding.ASCII))
            {
                _floatConstants.Clear();
                _doubleConstants.Clear();

                WriteHeader();
                WriteClassDefinitions();
                WriteClassTable();
                WriteMethodImplementations();
                WriteConstantsSection();
                WriteDataSection();
                WriteFooter();
            }

            AddGeneratedFile(outputPath);
        }

        private void WriteHeader()
        {
            _asmWriter.WriteLine("; Generated CC65 C/Assembly Code");
            _asmWriter.WriteLine("; Converted from C# MSIL");
            _asmWriter.WriteLine($"; Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
            _asmWriter.WriteLine();
            _asmWriter.WriteLine("    ; --- Code Section ---");
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    SECTION CODE");
            _asmWriter.WriteLine();
        }

        private void WriteClassDefinitions()
        {
            _asmWriter.WriteLine("    ; --- Class Definitions ---");
            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
                // TODO: Fix for CC65
                _asmWriter.WriteLine($"; Class: {cls.FullName}");
                _asmWriter.WriteLine($"    CLASS_{cls.ClassIndex} EQU {cls.ClassIndex}");
                _asmWriter.WriteLine($"    CLASS_SIZE_{cls.ClassIndex} EQU {cls.DataSize}");
            }
            _asmWriter.WriteLine();
        }

        private void WriteClassTable()
        {
            _asmWriter.WriteLine("    ; --- Class Table ---");
            _asmWriter.WriteLine("CLASS_TABLE:");

            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.ClassIndex >= 0))
            {
                // TODO: Fix for CC65
                _asmWriter.WriteLine($"    DC.L {cls.FullName}_vtable     ; Class {cls.FullName}");
                _asmWriter.WriteLine($"    DC.L {cls.DataSize}             ; Instance size");
            }
            _asmWriter.WriteLine();
        }

        private void WriteMethodImplementations()
        {
            _asmWriter.WriteLine("    ; --- Method Implementations ---");

            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
                WriteClassMethods(cls);
            }
        }

        private void WriteClassMethods(ClassMetadata cls)
        {
            _asmWriter.WriteLine($"; Methods of {cls.FullName}");

            foreach (var method in cls.Methods.Where(m => m.IsNeeded))
            {
                WriteMethod(cls, method);
            }
            _asmWriter.WriteLine();
        }

        private void WriteMethod(ClassMetadata cls, MethodMetadata method)
        {
            string methodLabel = cls.GetMethodLabel(method);
            _asmWriter.WriteLine($"{methodLabel}:");

            if (method.IsConstructor)
            {
                WriteConstructorCode(cls, method);
            }
            else if (method.IsStaticConstructor)
            {
                WriteStaticConstructorCode(cls, method);
            }
            else if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToC(method);
            }
            else
            {
                _asmWriter.WriteLine($"    ; TODO: Implement {method.Name}{method.Signature}");
            }

            // TODO: Fix for CC65
            _asmWriter.WriteLine("    RTS");
            _asmWriter.WriteLine();
        }

        private void WriteConstructorCode(ClassMetadata cls, MethodMetadata method)
        {
            _asmWriter.WriteLine("    ; Constructor prologue");
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    MOVEM.L A6,-(A7)     ; Save return address");
            _asmWriter.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            _asmWriter.WriteLine("    SUBI.L #" + cls.DataSize + ",A7");
            _asmWriter.WriteLine();

            if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToC(method);
            }

            _asmWriter.WriteLine("    ; Constructor epilogue");
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        private void WriteStaticConstructorCode(ClassMetadata cls, MethodMetadata method)
        {
            _asmWriter.WriteLine("    ; Static constructor prologue");
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    MOVEM.L A6,-(A7)     ; Save frame");
            _asmWriter.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            _asmWriter.WriteLine();

            if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToC(method);
            }

            _asmWriter.WriteLine("    ; Static constructor epilogue");
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        private void WriteMsilToC(MethodMetadata method)
        {
            _asmWriter.WriteLine("    ; Method prologue");
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    MOVEM.L A6,-(A7)     ; Save frame");
            _asmWriter.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            if (method.MaxLocals > 0)
            {
                // TODO: Fix for CC65
                _asmWriter.WriteLine($"    SUBI.L #{method.MaxLocals * 4},A7");
            }
            _asmWriter.WriteLine();

            var iterator = new MsilIterator(method.Code, method);
            // Increase maxStack to account for 64-bit values being split into two 32-bit registers
            // MSIL MaxStack counts 64-bit as 1 slot, but we use 2 registers per 64-bit value
            int adjustedMaxStack = method.MaxStack * 2;
            var stack = new CC65StackSimulator(method.MaxLocals, adjustedMaxStack);
            _support = new CC65Support(iterator, method, stack, _labels, _asmWriter,
                _floatConstants, _doubleConstants, ResolveMethodToken, TryResolveFrameworkMethod);
            var translator = new CC65OpcodeTranslator(_support);

            while (iterator.MoveNext())
            {
                translator.TranslateCurrentOpcode();
            }

            _asmWriter.WriteLine();
            _asmWriter.WriteLine("    ; Method epilogue");
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        /// <summary>Write constants (float and double) data section</summary>
        private void WriteConstantsSection()
        {
            if (_floatConstants.Count == 0 && _doubleConstants.Count == 0)
                return;

            _asmWriter.WriteLine();
            _asmWriter.WriteLine("    ; --- Constants Section ---");

            foreach (var kvp in _doubleConstants.OrderBy(x => x.Key))
            {
                byte[] doubleBytes = BitConverter.GetBytes(kvp.Value);
                // TODO: Fix for CC65
                _asmWriter.WriteLine($"DOUBLE_CONST_{kvp.Key:X4}:");
                _asmWriter.WriteLine($"    DC.L ${BitConverter.ToInt32(doubleBytes, 0):X8}");
                _asmWriter.WriteLine($"    DC.L ${BitConverter.ToInt32(doubleBytes, 4):X8}");
            }

            foreach (var kvp in _floatConstants.OrderBy(x => x.Key))
            {
                byte[] floatBytes = BitConverter.GetBytes(kvp.Value);
                // TODO: Fix for CC65
                _asmWriter.WriteLine($"FLOAT_CONST_{kvp.Key:X4}:");
                _asmWriter.WriteLine($"    DC.L ${BitConverter.ToInt32(floatBytes, 0):X8}");
            }

            _asmWriter.WriteLine();
        }

        private void WriteDataSection()
        {
            // TODO: Fix for CC65
            _asmWriter.WriteLine("    ; --- Data Section ---");
            _asmWriter.WriteLine("    SECTION DATA");
            _asmWriter.WriteLine();

            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.ClassIndex >= 0))
            {
                WriteVtable(cls);
            }
        }

        private void WriteVtable(ClassMetadata cls)
        {
            _asmWriter.WriteLine($"{cls.FullName}_vtable:");
            // TODO: Fix for CC65
            _asmWriter.WriteLine($"    DC.L {cls.FullName}         ; Class pointer");

            foreach (var method in cls.Vtable)
            {
                // TODO: Fix for CC65
                _asmWriter.WriteLine($"    DC.L {cls.GetMethodLabel(method)}");
            }
            _asmWriter.WriteLine();
        }

        private void WriteFooter()
        {
        }
    }
}