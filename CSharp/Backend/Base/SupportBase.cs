using JumpCS.Backend.CC65;
using JumpCS.Backend.Interfaces;
using JumpCS.Backend.SystemTypes;
using JumpCS.Core;
using System.Collections;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.Remoting;

namespace JumpCS.Backend.Base
{
    public class SupportBase : IBackendSupport
    {
        private readonly MsilIterator _iterator;
        private readonly MethodMetadata _method;
        private readonly StreamWriter _writer;
        private readonly IBackendLabelMapper _labels;
        private readonly IBackendStackSimulator _stack;
        private readonly Func<ClassMetadata, int, MethodMetadata?> _resolveMethodToken;
        private readonly Func<ClassMetadata, int, MethodBase?> _tryResolveFrameworkMethod;

        public SupportBase(
            MsilIterator iterator,
            MethodMetadata method,
            IBackendStackSimulator stack,
            IBackendLabelMapper labels,
            StreamWriter writer,
            Func<ClassMetadata, int, MethodMetadata?> resolveMethodToken,
            Func<ClassMetadata, int, MethodBase?> tryResolveFrameworkMethod)
        {
            _iterator = iterator;
            _method = method;
            _stack = stack;
            _labels = labels;
            _writer = writer;
            _resolveMethodToken = resolveMethodToken;
            _tryResolveFrameworkMethod = tryResolveFrameworkMethod;
        }

        public MsilIterator Iterator => _iterator;
        public MethodMetadata Method => _method;
        public StreamWriter AsmWriter => _writer;
        public IBackendStackSimulator Stack => _stack;
        public IBackendLabelMapper Labels { get { return _labels; } }

        public virtual ISystemDecimalHandler DecimalHandler => throw new NotImplementedException();

        public virtual Dictionary<int, double> DoubleConstants => throw new NotImplementedException();

        public virtual Dictionary<int, float> FloatConstants => throw new NotImplementedException();
        public virtual HashSet<int> DoubleLocals => throw new NotImplementedException();

        public virtual ISystemIntegerHandler IntegerHandler => throw new NotImplementedException();
        public virtual ISystemDoubleHandler DoubleHandler => throw new NotImplementedException();
        public virtual ISystemFloatHandler FloatHandler => throw new NotImplementedException();
        public virtual ISystemMathHandler MathHandler => throw new NotImplementedException();

        public virtual ISystemObjectHandler ObjectHandler => throw new NotImplementedException();

        // --- Method resolution ---

        public MethodMetadata? ResolveMethodToken(ClassMetadata callingClass, int methodToken)
            => _resolveMethodToken(callingClass, methodToken);

        public MethodBase? TryResolveFrameworkMethod(ClassMetadata callingClass, int methodToken)
            => _tryResolveFrameworkMethod(callingClass, methodToken);

        // --- Code emission helpers ---

        public virtual void Emit(string line) => throw new NotImplementedException();
        public virtual void EmitComment(string comment) => throw new NotImplementedException();
        public virtual void EmitLabel(string label) => throw new NotImplementedException();
        public virtual void EmitBlank() => throw new NotImplementedException();
        public virtual string EmitAssign(string expr, bool isWide = false) => throw new NotImplementedException();
        public virtual void EmitReassign(string varName, string expr) => throw new NotImplementedException();
    }
}
