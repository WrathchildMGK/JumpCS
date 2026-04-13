using JumpCS.Backend.Asm68000.SystemTypes;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Reflection;

namespace JumpCS.Backend.Asm68000
{
    public class Asm68000Support : IBackendSupport
    {
        private readonly Dictionary<int, float> _floatConstants;
        private readonly Dictionary<int, double> _doubleConstants;

        private HashSet<int> _doubleLocals = new();

        private readonly Asm68000StackSimulator _stack;
        private readonly StreamWriter _asmWriter;
        private readonly MsilIterator _iterator;
        private readonly MethodMetadata _method;
        private readonly Asm68000LabelMapper _labels;

        private readonly SystemDecimalHandler _decimalHandler;
        private readonly SystemMathHandler _mathHandler;
        private readonly SystemDoubleHandler _doubleHandler;
        private readonly SystemFloatHandler _floatHandler;
        private readonly SystemIntegerHandler _integerHandler;
        private readonly SystemObjectHandler _objectHandler;

        // Method resolution delegates — injected from BackEnd
        private readonly Func<ClassMetadata, int, MethodMetadata?> _resolveMethodToken;
        private readonly Func<ClassMetadata, int, MethodBase?> _tryResolveFrameworkMethod;

        public Asm68000Support(
            MsilIterator iterator,
            MethodMetadata method,
            Asm68000StackSimulator stack,
            Asm68000LabelMapper labels,
            StreamWriter asmWriter,
            Dictionary<int, float> floatConstants,
            Dictionary<int, double> doubleConstants,
            Func<ClassMetadata, int, MethodMetadata?> resolveMethodToken,
            Func<ClassMetadata, int, MethodBase?> tryResolveFrameworkMethod)
        {
            _iterator = iterator;
            _method = method;
            _stack = stack;
            _labels = labels;
            _asmWriter = asmWriter;
            _floatConstants = floatConstants;
            _doubleConstants = doubleConstants;
            _resolveMethodToken = resolveMethodToken;
            _tryResolveFrameworkMethod = tryResolveFrameworkMethod;

            _mathHandler = new SystemMathHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister()
            );

            _decimalHandler = new SystemDecimalHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _doubleHandler = new SystemDoubleHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _floatHandler = new SystemFloatHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _integerHandler = new SystemIntegerHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _objectHandler = new SystemObjectHandler(
                _asmWriter,
                (stack) => stack.AllocateDataRegister(),
                () => _labels.GetUniqueLabel()
            );

            _doubleLocals.Clear();
        }

        // --- Existing properties (unchanged) ---
        public Dictionary<int, float> FloatConstants { get { return _floatConstants; } }
        public Dictionary<int, double> DoubleConstants { get { return _doubleConstants; } }
        public HashSet<int> DoubleLocals { get { return _doubleLocals; } }
        public IBackendStackSimulator Stack { get { return _stack; } }
        public StreamWriter AsmWriter { get { return _asmWriter; } }
        public MsilIterator Iterator { get { return _iterator; } }
        public MethodMetadata Method { get { return _method; } }
        public IBackendLabelMapper Labels { get { return _labels; } }
        public ISystemDecimalHandler DecimalHandler { get { return _decimalHandler; } }
        public ISystemMathHandler MathHandler { get { return _mathHandler; } }
        public ISystemDoubleHandler DoubleHandler { get { return _doubleHandler; } }
        public ISystemFloatHandler FloatHandler { get { return _floatHandler; } }
        public ISystemIntegerHandler IntegerHandler { get { return _integerHandler; } }
        public ISystemObjectHandler ObjectHandler { get { return _objectHandler; } }

        // --- New: method resolution ---
        public MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken)
            => _resolveMethodToken(callingClass, methodToken);

        public MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
            => _tryResolveFrameworkMethod(callingClass, methodToken);
    }
}
