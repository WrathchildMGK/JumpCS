using JumpCS.Core;

namespace JumpCS.Backend.Base
{
    /// <summary>
    /// Abstract base class for peephole optimization across different backend targets
    /// Handles file resolution and common logic; derived classes override ProcessTarget()
    /// </summary>
    public abstract class PeepholeBase
    {
        /// <summary>Get the file extension for this target (e.g., ".asm" or ".c")</summary>
        protected abstract string FileExtension { get; }

        /// <summary>Get the folder suffix for this target (e.g., "_68000" or "_cc65")</summary>
        protected abstract string FolderSuffix { get; }

        /// <summary>Target platform identifier</summary>
        protected abstract TargetPlatform TargetPlatform { get; }

        /// <summary>Get the human-readable target name</summary>
        protected abstract string TargetName { get; }

        /// <summary>
        /// Process assembly/code file for peephole optimization
        /// Supports both old format (outputName_generated.asm) and new format (outputName_target/outputName.ext)
        /// </summary>
        public void Process(string asmFileName, TargetPlatform? target = null)
        {
            Console.WriteLine("Running peephole optimization pass...");

            // Resolve the actual file path
            string asmPath = ResolveFilePath(asmFileName, target);

            if (asmPath == null || !File.Exists(asmPath))
            {
                ReportFileNotFound(asmFileName);
                return;
            }

            Console.WriteLine($"Processing: {asmPath}");
            ProcessTarget(asmPath);
        }

        /// <summary>Override this to implement target-specific peephole optimization</summary>
        protected abstract void ProcessTarget(string filePath);

        /// <summary>Resolve the file path based on new or legacy format</summary>
        private string ResolveFilePath(string asmFileName, TargetPlatform? target)
        {
            string asmPath = null;

            // Try new folder-based format first
            if (target == TargetPlatform)
            {
                asmPath = Path.Combine($"{asmFileName}{FolderSuffix}", $"{asmFileName}{FileExtension}");
            }
            else if (target != null)
            {
                // Requesting a different target; try that format
                string suffix = GetFolderSuffixForTarget(target.Value);
                string ext = GetFileExtensionForTarget(target.Value);
                asmPath = Path.Combine($"{asmFileName}{suffix}", $"{asmFileName}{ext}");
            }
            else
            {
                // Auto-detect based on what exists
                string newPath = Path.Combine($"{asmFileName}{FolderSuffix}", $"{asmFileName}{FileExtension}");
                string oldPath = $"{asmFileName}_generated.asm";

                if (File.Exists(newPath))
                {
                    asmPath = newPath;
                }
                else if (File.Exists(oldPath))
                {
                    asmPath = oldPath;  // Legacy support
                    Console.WriteLine($"Note: Using legacy file format: {asmPath}");
                }
            }

            return asmPath;
        }

        /// <summary>Get folder suffix for a specific target platform</summary>
        private string GetFolderSuffixForTarget(TargetPlatform target)
        {
            return target switch
            {
                TargetPlatform.Motorola68000 => "_68000",
                TargetPlatform.AtariCC65 => "_cc65",
                _ => "_unknown"
            };
        }

        /// <summary>Get file extension for a specific target platform</summary>
        private string GetFileExtensionForTarget(TargetPlatform target)
        {
            return target switch
            {
                TargetPlatform.Motorola68000 => ".asm",
                TargetPlatform.AtariCC65 => ".c",
                _ => ".out"
            };
        }

        /// <summary>Report that the file could not be found</summary>
        private void ReportFileNotFound(string asmFileName)
        {
            Console.WriteLine($"Warning: Assembly file not found for: {asmFileName}");
            Console.WriteLine($"  Searched for:");
            Console.WriteLine($"    {Path.Combine($"{asmFileName}{FolderSuffix}", $"{asmFileName}{FileExtension}")}");
            Console.WriteLine($"    {asmFileName}_generated.asm (legacy)");
        }
    }
}