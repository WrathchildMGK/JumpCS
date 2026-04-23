using JumpCS.Backend;
using JumpCS.Backend.Interfaces;
using JumpCS.Core;
using Microsoft.Extensions.Configuration;
using System.Reflection;

namespace JumpCS
{
    class Program
    {
        private const string JUMP_VERSION = "3.0.0";

        private static CodeOptions? codeOptions;
        private static IConfiguration? configuration;
        private static string? mainAssemblyPath;
        private static AssemblyMetadata? mainAssembly;
        private static ClassMetadata? mainClass;
        public static CodeOptions? CodeOptions => codeOptions;
        private static bool newNeeds;

        public static void SetNeedsNewIteration() => newNeeds = true;

        static int Main(string[] args)
        {
            Console.WriteLine($"Jump  .NET/C# Post-Compiler for Embedded Systems  Version {JUMP_VERSION}");
            Console.WriteLine("Copyright (c) 1996,1997 by Greg Hewgill");
            Console.WriteLine("Copyright (c) 2000,2004 by Ralf Kleberhoff");
            Console.WriteLine("Copyright (c) 2026 by .NET Port Contributors");
            Console.WriteLine("Please see the file COPYING (GPL v2) for distribution rights.\n");

            try
            {
                // Load configuration
                var configBuilder = new ConfigurationBuilder()
                    .SetBasePath(Directory.GetCurrentDirectory())
                    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: false);
                configuration = configBuilder.Build();

                // Parse command-line arguments
                if (args.Length == 0 || !ParseArguments(args))
                {
                    ShowUsage();
                    return 1;
                }

                Console.WriteLine($"Compiling assembly: {mainAssemblyPath}");

                // Initialize code generation options
                codeOptions = new CodeOptions(args, configuration);
                Console.WriteLine($"Options: {codeOptions}");

                // Validate dangerous combinations
                if (codeOptions.MemoryModel == MemoryModel.Huge &&
                    (!codeOptions.CheckBounds || !codeOptions.CheckNull))
                {
                    Console.WriteLine("\n **************************************");
                    Console.WriteLine(" ***    HIGH RISK OF DATA LOSS      ***");
                    Console.WriteLine(" ***     Memory Model 'Huge'.       ***");
                    Console.WriteLine(" *** Make sure code has been tested ***");
                    Console.WriteLine(" ***  with null pointer and bounds  ***");
                    Console.WriteLine(" ***       checking enabled.        ***");
                    Console.WriteLine(" **************************************\n");
                }

                // Load main assembly and dependencies
                mainAssembly = new AssemblyMetadata(mainAssemblyPath!);
                mainClass = mainAssembly.GetMainType();

                if (mainClass == null)
                {
                    Console.Error.WriteLine("Error: Could not find main class in assembly");
                    return 1;
                }

                // Load all classes from the assembly upfront
                foreach (var cls in mainAssembly.GetAllClasses())
                {
                    // This ensures all classes are in the ClassMetadata registry
                    ClassMetadata.ForName(cls.FullName);
                }

                // Initialize backend using factory
                string outputBaseName = Path.GetFileNameWithoutExtension(mainAssemblyPath) ?? "JumpCS";
                IBackEnd backEnd = BackendFactory.CreateBackend(codeOptions.Target, outputBaseName, codeOptions.MemoryModel);

                // Mark entry points as needed
                MarkEntryPoints();

                // Iteratively resolve dependencies
                do
                {
                    newNeeds = false;
                    ClassMetadata.UpdateAll();
                    backEnd.UpdateAll();
                } while (newNeeds);

                // Layout phase
                ClassMetadata.AssignAllClassIndices();
                ClassMetadata.LayoutFieldsAll();
                ClassMetadata.LayoutVtableAll();
                ClassMetadata.LayoutItableAll();

                if (codeOptions.Verbosity > 0)
                {
                    ClassMetadata.ReportAll();
                }

                // Statistics
                var statistics = new CompilationStatistics();
                foreach (var cls in ClassMetadata.AllClasses)
                {
                    statistics.AddClass(cls);
                    foreach (var method in cls.Methods)
                    {
                        statistics.AddMethod(method);
                    }
                }
                statistics.Report();

                // Code generation
                backEnd.Generate();

                // Optional optimization passes using factory
                if (codeOptions.UsePeephole)
                {
                    var peephole = BackendFactory.CreatePeepholeOptimizer(codeOptions.Target);
                    peephole.Process(outputBaseName, codeOptions.Target);
                }

                Console.WriteLine("\nCompilation completed successfully.");
                return 0;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"Exception encountered: {ex.Message}");
                if (ex.InnerException != null)
                    Console.Error.WriteLine($"Inner exception: {ex.InnerException.Message}");
                if (codeOptions?.Verbosity > 1)
                    Console.Error.WriteLine(ex.StackTrace);
                return 1;
            }
        }

        static bool ParseArguments(string[] args)
        {
            if (args.Length == 0)
                return false;

            mainAssemblyPath = args[^1];

            if (mainAssemblyPath.EndsWith(".dll", StringComparison.OrdinalIgnoreCase) ||
                mainAssemblyPath.EndsWith(".exe", StringComparison.OrdinalIgnoreCase))
            {
                mainAssemblyPath = mainAssemblyPath[..^4];
            }

            if (!File.Exists($"{mainAssemblyPath}.dll") && !File.Exists($"{mainAssemblyPath}.exe"))
            {
                Console.Error.WriteLine($"Error: Assembly not found: {mainAssemblyPath}");
                return false;
            }

            return true;
        }

        static void ShowUsage()
        {
            Console.WriteLine("Usage: jump [-options] assemblyname");
            Console.WriteLine();
            Console.WriteLine("Options:");
            Console.WriteLine("         -t         single segment code (SMALL model, default)");
            Console.WriteLine("         -m         multi-segment code (LARGE model)");
            Console.WriteLine("         -h         storage-memory heap (HUGE model)");
            Console.WriteLine("         -y         use dynamic class init (more compatible but more code)");
            Console.WriteLine("         -g         include debugger symbols");
            Console.WriteLine("         -v         verbose output");
            Console.WriteLine("         -V         super-verbose output");
            Console.WriteLine("         -s bytes   stack size in bytes");
            Console.WriteLine("         -B bytes   set limit on bytecodes per segment");
            Console.WriteLine("         -On        code optimization level n=0 to 6");
            Console.WriteLine("         -c         disable inclusion of class names (save space)");
            Console.WriteLine("         -a         disable array bound checking *** DANGEROUS ***");
            Console.WriteLine("         -n         disable null checking *** DANGEROUS ***");
            Console.WriteLine("         -S         disable stack checking *** DANGEROUS ***");
            Console.WriteLine("         -Z         disable divide-by-zero checking *** DANGEROUS ***");
            Console.WriteLine("         -N         inline null checking, faster but more code");
            Console.WriteLine("         -A         initialize static array data");
            Console.WriteLine("         -P         enable/disable peephole optimization phase");
            Console.WriteLine("         -q         don't use package name in asm file name");
            Console.WriteLine("         -Dsymbol   define preprocessor symbol for assembler");
            Console.WriteLine("         -f         disable finalize support");
            Console.WriteLine("         -Ttarget   target platform (68000 default, st, 6502)");
        }

        static void MarkEntryPoints()
        {
            if (mainClass == null)
                return;

            // Look for PilotMain entry point (legacy support)
            var pilotMainMethod = mainClass.FindMethod("Main", "()V");
            if (pilotMainMethod != null)
            {
                pilotMainMethod.MarkNeeded("Main");
            }

            // Look for standard .NET entry point
            var mainMethod = mainClass.FindMethod("Main", "(LSystem/String[];)V");
            if (mainMethod != null)
            {
                mainMethod.MarkNeeded("Main");
            }
        }
    }
}