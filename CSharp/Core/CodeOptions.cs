using Microsoft.Extensions.Configuration;

namespace JumpCS.Core
{
    public enum MemoryModel { Small, Large, Huge }
    public enum TargetPlatform { Motorola68000, AtariST, Atari6502 }
    public enum OptimizationLevel { None = 0, Low = 1, Medium = 2, High = 3, Aggressive = 6 }

    public class CodeOptions
    {
        public MemoryModel MemoryModel { get; set; } = MemoryModel.Small;
        public TargetPlatform Target { get; set; } = TargetPlatform.Motorola68000;
        public int Verbosity { get; set; } = 0;
        public bool CheckBounds { get; set; } = true;
        public bool CheckNull { get; set; } = true;
        public bool CheckStack { get; set; } = true;
        public bool InlineNullCheck { get; set; } = false;
        public bool IncludeClassNames { get; set; } = true;
        public bool IncludeDebugSymbols { get; set; } = false;
        public bool UseDynamicInit { get; set; } = false;
        public bool InitializeStaticArrays { get; set; } = false;
        public bool UsePeephole { get; set; } = true;
        public bool UsePackageInAsmFileName { get; set; } = true;
        public bool DisableFinalizeSupport { get; set; } = false;
        public int StackSize { get; set; } = 8192;
        public int BytecodesPerSegmentLimit { get; set; } = 65536;
        public OptimizationLevel Optimization { get; set; } = OptimizationLevel.Medium;
        public Dictionary<string, string> PreprocessorSymbols { get; } = new();

        public CodeOptions(string[] args, IConfiguration config)
        {
            // Load from configuration file
            if (config != null)
            {
                ApplyConfigurationDefaults(config);
            }

            // Parse command-line arguments (override config)
            ParseArguments(args);
        }

        private void ApplyConfigurationDefaults(IConfiguration config)
        {
            var section = config.GetSection("CodeGeneration");
            if (section.Exists())
            {
                if (Enum.TryParse<MemoryModel>(section["MemoryModel"], true, out var memModel))
                    MemoryModel = memModel;
                
                if (Enum.TryParse<TargetPlatform>(section["Target"], true, out var target))
                    Target = target;

                if (int.TryParse(section["StackSize"], out var stackSize))
                    StackSize = stackSize;

                if (bool.TryParse(section["CheckBounds"], out var checkBounds))
                    CheckBounds = checkBounds;

                if (bool.TryParse(section["CheckNull"], out var checkNull))
                    CheckNull = checkNull;
            }
        }

        private void ParseArguments(string[] args)
        {
            for (int i = 0; i < args.Length - 1; i++)
            {
                string arg = args[i];
                if (!arg.StartsWith("-"))
                    continue;

                switch (arg)
                {
                    case "-t": MemoryModel = MemoryModel.Small; break;
                    case "-m": MemoryModel = MemoryModel.Large; break;
                    case "-h": MemoryModel = MemoryModel.Huge; break;
                    case "-y": UseDynamicInit = true; break;
                    case "-g": IncludeDebugSymbols = true; break;
                    case "-v": Verbosity = 1; break;
                    case "-V": Verbosity = 2; break;
                    case "-c": IncludeClassNames = false; break;
                    case "-a": CheckBounds = false; break;
                    case "-n": CheckNull = false; break;
                    case "-S": CheckStack = false; break;
                    case "-N": InlineNullCheck = true; break;
                    case "-A": InitializeStaticArrays = true; break;
                    case "-P": UsePeephole = !UsePeephole; break;
                    case "-q": UsePackageInAsmFileName = false; break;
                    case "-f": DisableFinalizeSupport = true; break;

                    case string s when s.StartsWith("-s"):
                        if (int.TryParse(arg[2..], out var size))
                            StackSize = size;
                        break;

                    case string s when s.StartsWith("-B"):
                        if (int.TryParse(arg[2..], out var limit))
                            BytecodesPerSegmentLimit = limit;
                        break;

                    case string s when s.StartsWith("-O"):
                        if (int.TryParse(arg[2..], out var opt))
                            Optimization = (OptimizationLevel)opt;
                        break;

                    case string s when s.StartsWith("-T"):
                        if (Enum.TryParse<TargetPlatform>(arg[2..], true, out var target))
                            Target = target;
                        break;

                    case string s when s.StartsWith("-D"):
                        var symbol = arg[2..];
                        var parts = symbol.Split('=');
                        PreprocessorSymbols[parts[0]] = parts.Length > 1 ? parts[1] : "1";
                        break;
                }
            }
        }

        public override string ToString()
        {
            var parts = new List<string>
            {
                $"Model={MemoryModel}",
                $"Target={Target}",
                $"Optimization={Optimization}",
                $"CheckBounds={CheckBounds}",
                $"CheckNull={CheckNull}",
                $"StackSize={StackSize}"
            };
            return string.Join(", ", parts);
        }
    }
}