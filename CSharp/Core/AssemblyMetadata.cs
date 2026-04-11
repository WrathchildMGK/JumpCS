using System.Reflection;
using System.Reflection.Metadata;
using System.Reflection.PortableExecutable;

namespace JumpCS.Core
{
    /// <summary>Wrapper for loading and accessing .NET assembly metadata</summary>
    public class AssemblyMetadata
    {
        private readonly string _assemblyPath;
        private Assembly? _assembly;
        private MetadataReader? _metadataReader;
        private Dictionary<string, ClassMetadata> _classCache = new();

        public Assembly? Reflection => _assembly;
        public MetadataReader? Metadata => _metadataReader;

        public AssemblyMetadata(string assemblyPath)
        {
            _assemblyPath = assemblyPath;
            LoadAssembly();
        }

        private void LoadAssembly()
        {
            // Resolve full path
            string fullPath = _assemblyPath;
            if (!fullPath.EndsWith(".dll", StringComparison.OrdinalIgnoreCase) && 
                !fullPath.EndsWith(".exe", StringComparison.OrdinalIgnoreCase))
            {
                fullPath = fullPath + ".dll";
                if (!File.Exists(fullPath))
                    fullPath = _assemblyPath + ".exe";
            }

            if (!File.Exists(fullPath))
                throw new FileNotFoundException($"Assembly not found: {fullPath}");

            try
            {
                _assembly = Assembly.LoadFrom(fullPath);
                
                using (var file = new FileStream(fullPath, FileMode.Open, FileAccess.Read))
                using (var peReader = new PEReader(file))
                {
                    _metadataReader = peReader.GetMetadataReader();
                }
            }
            catch (Exception ex)
            {
                throw new InvalidOperationException($"Failed to load assembly {fullPath}: {ex.Message}", ex);
            }
        }

        /// <summary>Get the main type (entry point) of the assembly</summary>
        public ClassMetadata? GetMainType()
        {
            if (_assembly == null)
                return null;

            // Look for type with Main method or entry point
        foreach (var type in _assembly.GetTypes())
            {
                var mainMethod = type.GetMethod("<Main>$", 
                    System.Reflection.BindingFlags.Static | 
                    System.Reflection.BindingFlags.Public);
                
                if (mainMethod != null)
                    return GetClass(type.FullName ?? "");

                var pilotMainMethod = type.GetMethod("Main", 
                    System.Reflection.BindingFlags.Static | 
                    System.Reflection.BindingFlags.Public);
                
                if (pilotMainMethod != null)
                    return GetClass(type.FullName ?? "");
            }

            // Default to first public type
            var firstType = _assembly.GetTypes().FirstOrDefault();
            return firstType != null ? GetClass(firstType.FullName ?? "") : null;
        }

        /// <summary>Get or create class metadata for a type</summary>
        public ClassMetadata GetClass(string className)
        {
            if (_classCache.TryGetValue(className, out var cached))
                return cached;

            var classType = _assembly?.GetType(className);
            if (classType == null)
            {
                // Create synthetic metadata for external types
                return ClassMetadata.CreateSynthetic(className);
            }

            var metadata = ClassMetadata.FromType(className, classType);
            _classCache[className] = metadata;
            return metadata;
        }

        /// <summary>Get all types in the assembly</summary>
        public IEnumerable<ClassMetadata> GetAllClasses()
        {
            if (_assembly == null)
                yield break;

            foreach (var type in _assembly.GetTypes())
            {
                yield return GetClass(type.FullName ?? "");
            }
        }
    }
}