using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;
using System.Reflection.Emit;
using System.Text;

namespace JumpCS.Backend.Asm68000
{
    /// <summary>68000 assembly code backend</summary>
    public class Asm68000BackEnd : BackEndBase, IBackEnd
    {
        // Constant tracking for ldc.r4 and ldc.r8
        private Dictionary<int, float> _floatConstants = new();
        private Dictionary<int, double> _doubleConstants = new();

        private StreamWriter _asmWriter = StreamWriter.Null;
        private Dictionary<string, int> _methodOffsets = new();
        private int _currentOffset = 0;

        public Asm68000BackEnd(string outputBaseName) : base(outputBaseName)
        {
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

        /// <summary>Generate 68000 assembly output</summary>
        public override void Generate()
        {
            string outputDir = $"{OutputBaseName}_68000";
            Directory.CreateDirectory(outputDir);
            
            string outputPath = Path.Combine(outputDir, $"{OutputBaseName}.asm");
            Console.WriteLine($"Generating 68000 assembly: {outputPath}");

            try
            {
                using (_asmWriter = new StreamWriter(outputPath, false, Encoding.ASCII))
                {
                    _floatConstants.Clear();
                    _doubleConstants.Clear();

                    WriteHeader();
                    WriteClassDefinitions();
                    WriteClassTable();
                    
                    try
                    {
                        WriteMethodImplementations();
                    }
                    catch (Exception ex)
                    {
                        _asmWriter.WriteLine();
                        _asmWriter.WriteLine($"    ; ERROR: Exception during method generation: {ex.Message}");
                        Console.Error.WriteLine($"[ERROR] Exception during method generation: {ex.Message}");
                        if (Program.CodeOptions?.Verbosity > 1)
                        {
                            _asmWriter.WriteLine($"    ; {ex.StackTrace}");
                            Console.Error.WriteLine(ex.StackTrace);
                        }
                    }
                    
                    try
                    {
                        WriteConstantsSection();
                        WriteDataSection();
                        WriteFooter();
                    }
                    catch (Exception ex)
                    {
                        Console.Error.WriteLine($"[ERROR] Exception during footer generation: {ex.Message}");
                    }
                }

                AddGeneratedFile(outputPath);
                Console.WriteLine($"✓ Assembly generation completed: {outputPath}");
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"[FATAL] Failed to generate assembly: {ex.Message}");
                Console.Error.WriteLine(ex.StackTrace);
                throw;
            }
        }

        private void WriteHeader()
        {
            _asmWriter.WriteLine("; Generated 68000 Assembly Code");
            _asmWriter.WriteLine("; Converted from C# MSIL");
            _asmWriter.WriteLine($"; Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
            _asmWriter.WriteLine();
            _asmWriter.WriteLine("    ; --- Code Section ---");
            _asmWriter.WriteLine("    SECTION CODE");
            _asmWriter.WriteLine();
        }

        private void WriteClassDefinitions()
        {
            _asmWriter.WriteLine("    ; --- Class Definitions ---");
            foreach (var cls in ClassMetadata.AllClasses.Where(c => c.IsNeeded))
            {
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
                WriteMsilToAsm(method);
            }
            else
            {
                _asmWriter.WriteLine($"    ; TODO: Implement {method.Name}{method.Signature}");
            }

            _asmWriter.WriteLine("    RTS");
            _asmWriter.WriteLine();
        }

        private void WriteConstructorCode(ClassMetadata cls, MethodMetadata method)
        {
            _asmWriter.WriteLine("    ; Constructor prologue");
            _asmWriter.WriteLine("    MOVEM.L A6,-(A7)     ; Save return address");
            _asmWriter.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            _asmWriter.WriteLine("    SUBI.L #" + cls.DataSize + ",A7");
            _asmWriter.WriteLine();

            if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToAsm(method);
            }

            _asmWriter.WriteLine("    ; Constructor epilogue");
            _asmWriter.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        private void WriteStaticConstructorCode(ClassMetadata cls, MethodMetadata method)
        {
            _asmWriter.WriteLine("    ; Static constructor prologue");
            _asmWriter.WriteLine("    MOVEM.L A6,-(A7)     ; Save frame");
            _asmWriter.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            _asmWriter.WriteLine();

            if (method.Code != null && method.Code.Length > 0)
            {
                WriteMsilToAsm(method);
            }

            _asmWriter.WriteLine("    ; Static constructor epilogue");
            _asmWriter.WriteLine("    MOVEM.L (A7)+,A6     ; Restore frame");
        }

        private void WriteMsilToAsm(MethodMetadata method)
        {
            _asmWriter.WriteLine("    ; Method prologue");
            _asmWriter.WriteLine("    MOVEM.L A6,-(A7)     ; Save frame");
            _asmWriter.WriteLine("    MOVE.L A7,A6         ; Set up frame pointer");
            if (method.MaxLocals > 0)
            {
                _asmWriter.WriteLine($"    SUBI.L #{method.MaxLocals * 4},A7");
            }
            _asmWriter.WriteLine();

            var iterator = new MsilIterator(method.Code, method);
            // Increase maxStack to account for 64-bit values being split into two 32-bit registers
            // MSIL MaxStack counts 64-bit as 1 slot, but we use 2 registers per 64-bit value
            int adjustedMaxStack = method.MaxStack * 2;
            var stack = new Asm68000StackSimulator(method.MaxLocals, adjustedMaxStack);
            var labels = new Asm68000LabelMapper();
            var support = new Asm68000Support(iterator, method, stack, labels, _asmWriter,
                _floatConstants, _doubleConstants, ResolveMethodToken, TryResolveFrameworkMethod);
            var branchTargets = Asm68000OpcodeTranslator.FindBranchTargets(method.Code, method);
            var translator = new Asm68000OpcodeTranslator(support, branchTargets);

            while (iterator.MoveNext())
            {
                translator.TranslateCurrentOpcode();
            }

            _asmWriter.WriteLine();
            _asmWriter.WriteLine("    ; Method epilogue");
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
                _asmWriter.WriteLine($"DOUBLE_CONST_{kvp.Key:X4}:");
                _asmWriter.WriteLine($"    DC.L ${BitConverter.ToInt32(doubleBytes, 0):X8}");
                _asmWriter.WriteLine($"    DC.L ${BitConverter.ToInt32(doubleBytes, 4):X8}");
            }

            foreach (var kvp in _floatConstants.OrderBy(x => x.Key))
            {
                byte[] floatBytes = BitConverter.GetBytes(kvp.Value);
                _asmWriter.WriteLine($"FLOAT_CONST_{kvp.Key:X4}:");
                _asmWriter.WriteLine($"    DC.L ${BitConverter.ToInt32(floatBytes, 0):X8}");
            }

            _asmWriter.WriteLine();
        }

        private void WriteDataSection()
        {
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
            _asmWriter.WriteLine($"    DC.L {cls.FullName}         ; Class pointer");

            foreach (var method in cls.Vtable)
            {
                _asmWriter.WriteLine($"    DC.L {cls.GetMethodLabel(method)}");
            }
            _asmWriter.WriteLine();
        }

        private void WriteFooter()
        {
            _asmWriter.WriteLine("    END");
        }
    }
}