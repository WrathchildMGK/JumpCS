namespace JumpCS.Backend.Core
{
    /// <summary>Information about a supported framework method's direct low-level implementation</summary>
    public class FrameworkMethodInfo
    {
        /// <summary>Name of the runtime library function (e.g., "__console_writeline")</summary>
        public string LibraryFunction { get; }

        /// <summary>Number of parameters the method takes (excluding implicit 'this' for instance methods)</summary>
        public int ParameterCount { get; }

        /// <summary>Whether this method has a return value that needs to be pushed to stack</summary>
        public bool HasReturnValue { get; }

        public FrameworkMethodInfo(string libraryFunction, int parameterCount, bool hasReturnValue = false)
        {
            LibraryFunction = libraryFunction;
            ParameterCount = parameterCount;
            HasReturnValue = hasReturnValue;
        }
    }
}