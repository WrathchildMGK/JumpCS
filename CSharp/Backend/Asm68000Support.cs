using JumpCS.Backend;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace CSharp.Backend
{
    public class Asm68000Support 
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

            _doubleLocals.Clear();
        }

        // --- Existing properties (unchanged) ---
        public Dictionary<int, float> FloatConstants { get { return _floatConstants; } }
        public Dictionary<int, double> DoubleConstants { get { return _doubleConstants; } }
        public HashSet<int> DoubleLocals { get { return _doubleLocals; } }
        public Asm68000StackSimulator Stack { get { return _stack; } }
        public StreamWriter AsmWriter { get { return _asmWriter; } }
        public MsilIterator Iterator { get { return _iterator; } }
        public MethodMetadata Method { get { return _method; } }
        public Asm68000LabelMapper Labels { get { return _labels; } }
        public SystemDecimalHandler DecimalHandler { get { return _decimalHandler; } }
        public SystemMathHandler MathHandler { get { return _mathHandler; } }
        public SystemDoubleHandler DoubleHandler { get { return _doubleHandler; } }
        public SystemFloatHandler FloatHandler { get { return _floatHandler; } }
        public SystemIntegerHandler IntegerHandler { get { return _integerHandler; } }

        // --- New: method resolution ---
        public MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken)
            => _resolveMethodToken(callingClass, methodToken);

        public MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
            => _tryResolveFrameworkMethod(callingClass, methodToken);
    }
}
