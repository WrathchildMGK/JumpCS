using JumpCS.Backend.Asm68000.SystemTypes;
using JumpCS.Backend.Base;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.Asm68000
{
    public class Asm68000Support : SupportBase
    {
        private readonly Dictionary<int, float> _floatConstants;
        private readonly Dictionary<int, double> _doubleConstants;
        private readonly HashSet<int> _doubleLocals = new();

        private readonly SystemDecimalHandler _decimalHandler;
        private readonly SystemMathHandler _mathHandler;
        private readonly SystemDoubleHandler _doubleHandler;
        private readonly SystemFloatHandler _floatHandler;
        private readonly SystemIntegerHandler _integerHandler;
        private readonly SystemObjectHandler _objectHandler;

        public Asm68000Support(
            MsilIterator iterator,
            MethodMetadata method,
            Asm68000StackSimulator stack,
            Asm68000LabelMapper labels,
            StreamWriter writer,
            Dictionary<int, float> floatConstants,
            Dictionary<int, double> doubleConstants,
            Func<ClassMetadata, int, MethodMetadata?> resolveMethodToken,
            Func<ClassMetadata, int, MethodBase?> tryResolveFrameworkMethod) :
            base(iterator, method, stack, labels, writer, resolveMethodToken, tryResolveFrameworkMethod)
        {
            _floatConstants = floatConstants;
            _doubleConstants = doubleConstants;

            _mathHandler = new SystemMathHandler(
                writer,
                (stack) => stack.AllocateDataRegister(),
                () => labels.GetUniqueLabel()  // ADD THIS LINE
            );

            _decimalHandler = new SystemDecimalHandler(
                writer,
                (stack) => stack.AllocateDataRegister(),
                () => labels.GetUniqueLabel()
            );

            _doubleHandler = new SystemDoubleHandler(
                writer,
                (stack) => stack.AllocateDataRegister(),
                () => labels.GetUniqueLabel()
            );

            _floatHandler = new SystemFloatHandler(
                writer,
                (stack) => stack.AllocateDataRegister(),
                () => labels.GetUniqueLabel()
            );

            _integerHandler = new SystemIntegerHandler(
                writer,
                (stack) => stack.AllocateDataRegister(),
                () => labels.GetUniqueLabel()
            );

            _objectHandler = new SystemObjectHandler(
                writer,
                (stack) => stack.AllocateDataRegister(),
                () => labels.GetUniqueLabel()
            );

            _doubleLocals.Clear();
        }

        // --- Existing properties (unchanged) ---
        public override Dictionary<int, float> FloatConstants { get { return _floatConstants; } }
        public override Dictionary<int, double> DoubleConstants { get { return _doubleConstants; } }
        public override HashSet<int> DoubleLocals { get { return _doubleLocals; } }
        public override ISystemDecimalHandler DecimalHandler { get { return _decimalHandler; } }
        public override ISystemMathHandler MathHandler { get { return _mathHandler; } }
        public override ISystemDoubleHandler DoubleHandler { get { return _doubleHandler; } }
        public override ISystemFloatHandler FloatHandler { get { return _floatHandler; } }
        public override ISystemIntegerHandler IntegerHandler { get { return _integerHandler; } }
        public override ISystemObjectHandler ObjectHandler { get { return _objectHandler; } }
    }
}
