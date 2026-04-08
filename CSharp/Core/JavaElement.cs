namespace JumpCS.Core
{
    /// <summary>
    /// JavaElement is the superclass of all components of a runnable program.
    /// Contains decisions whether a component is needed in the resulting program.
    /// </summary>
    public abstract class JavaElement
    {
        /// <summary>needed-mode constant: element unneeded</summary>
        public const int UNNEEDED = 0;

        /// <summary>needed-mode constant: needed in default-mode</summary>
        public const int NEEDED = 1;

        /// <summary>needed-mode constant: instances of this class needed</summary>
        public const int INSTANCE_NEEDED = 2;

        /// <summary>needed-mode constant: instances with byte-exact layout</summary>
        public const int EXACT_INSTANCE_NEEDED = 3;

        /// <summary>needed-mode constant: method is being called virtually</summary>
        public const int NEEDED_VIRTUALLY = 256;

        /// <summary>needed-mode constant: instances checked for instanceof</summary>
        public const int NEEDED_INSTANCEOF = 256;

        /// <summary>Current needing status of this element</summary>
        protected int needStatus = UNNEEDED;

        /// <summary>Reason why this element is needed</summary>
        protected string? needReason;

        /// <summary>Get the needing status of this element</summary>
        public int NeedStatus => needStatus;

        /// <summary>Check if this element is needed at all</summary>
        public bool IsNeeded => needStatus != UNNEEDED;

        /// <summary>Mark this element as needed with a reason</summary>
        public void MarkNeeded(string reason, int status = NEEDED)
        {
            if (status > needStatus)
            {
                needStatus = status;
                needReason = reason;

                if (Program.CodeOptions?.Verbosity > 0)
                    Console.WriteLine($"Marking {GetType().Name} as needed (status={status}): {reason}");

                OnMarkedNeeded();
            }
        }

        /// <summary>Called when this element is marked as needed. Override in subclasses for dependency handling.</summary>
        protected virtual void OnMarkedNeeded()
        {
        }

        /// <summary>Update dependencies based on current need status</summary>
        public virtual void UpdateDependencies()
        {
        }

        /// <summary>Get a human-readable string for debugging</summary>
        public override string ToString()
        {
            return $"{GetType().Name}(status={needStatus})";
        }
    }
}