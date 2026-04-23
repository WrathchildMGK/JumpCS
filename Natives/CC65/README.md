# CC65 Backend Refactoring - Implementation TODO

## Current Status

**Completed**: ✅
- SystemIntegerHandler.cs refactored with proper 6502 calling conventions
- native-integer.asm created with 16 integer operations
- SystemMathHandler.cs refactored for integer Math operations
- native-math.asm created with Abs implementations
- Documentation (README.md, REFACTORING_GUIDE.md)

**In Progress**: 🔄
- Testing native integer operations
- Validating generated assembly syntax

**Pending**: ⏳
- Complete handler method implementations
- Full 64-bit operation support
- Floating-point investigation
- Comprehensive testing

---

## Phase 1: Integer Operations (CURRENT)

### Handler Implementation

- [x] SystemIntegerHandler.cs refactored
- [x] All binary operations route to library functions
- [x] All unary operations route to library functions
- [x] All comparison operations route to library functions
- [ ] Test coverage added

### Native Function Implementation

#### Already Implemented in native-integer.asm

- [x] Int32_Modulus
- [x] Int32_ShiftLeft (partial - requires 64-bit support)
- [x] Int32_ShiftRight (partial - requires 64-bit support)
- [x] Int32_Negate (partial - 16-bit only)
- [x] Int32_OnesComplement (partial - 16-bit only)
- [x] Int32_Equals (partial - 16-bit only)
- [x] Int32_NotEquals (derived from Equals)
- [x] Int32_LessThan (stub)
- [x] Int32_GreaterThan (stub)
- [x] Int32_LessOrEqual (derived)
- [x] Int32_GreaterOrEqual (derived)
- [x] Int32_BitwiseAnd (partial - 16-bit only)
- [x] Int32_BitwiseOr (partial - 16-bit only)
- [x] Int32_BitwiseXor (partial - 16-bit only)
- [x] Int32_InstanceEquals (stub)
- [x] Int32_CompareTo (stub)

#### Functions Needing Completion

**High Priority** (16-bit to full 32-bit):

1. [ ] **Int32_Negate** - Complete 32-bit two's complement
   - Status: Partial (16-bit only)
   - Issue: Need to handle all 4 bytes
   - Estimate: 1 hour

2. [ ] **Int32_OnesComplement** - Complete 32-bit bitwise NOT
   - Status: Partial (16-bit only)
   - Issue: Need to handle all 4 bytes
   - Estimate: 30 minutes

3. [ ] **Int32_Equals** - Complete 32-bit equality check
   - Status: Partial (16-bit only)
   - Issue: Need to compare all 4 bytes
   - Estimate: 1 hour

4. [ ] **Int32_LessThan** - Implement full signed comparison
   - Status: Stub
   - Issue: Complex - requires sign detection and byte-by-byte comparison
   - Estimate: 2 hours

5. [ ] **Int32_GreaterThan** - Implement full signed comparison
   - Status: Stub
   - Estimate: 2 hours

6. [ ] **Int32_BitwiseAnd** - Complete 32-bit AND
   - Status: Partial (16-bit only)
   - Estimate: 30 minutes

7. [ ] **Int32_BitwiseOr** - Complete 32-bit OR
   - Status: Partial (16-bit only)
   - Estimate: 30 minutes

8. [ ] **Int32_BitwiseXor** - Complete 32-bit XOR
   - Status: Partial (16-bit only)
   - Estimate: 30 minutes

**Medium Priority** (Instance methods):

9. [ ] **Int32_InstanceEquals** - Instance Equals(object) method
   - Status: Stub
   - Issue: Requires type checking, then comparison
   - Estimate: 2 hours

10. [ ] **Int32_CompareTo** - CompareTo(object) method
    - Status: Stub
    - Issue: Similar to InstanceEquals, but return -1/0/1
    - Estimate: 2 hours

**Lower Priority** (Already implemented or derived):

- [x] Int32_NotEquals (= EOR #1 after Equals)
- [x] Int32_LessOrEqual (= EOR #1 after GreaterThan)
- [x] Int32_GreaterOrEqual (= EOR #1 after LessThan)

### Testing for Phase 1

- [ ] Unit test: Int32_Negate with boundary values
- [ ] Unit test: Int32_Equals with matching/non-matching values
- [ ] Unit test: Int32_LessThan with various signed values
- [ ] Integration test: Build sample program with integer operations
- [ ] Assembly validation: Verify no syntax errors
- [ ] Linking: Verify all symbols resolve

**Estimated effort**: 10-12 hours for completion + testing

---

## Phase 2: Math Operations (NEXT)

### Handler Implementation

- [x] SystemMathHandler.cs refactored
- [x] Math.Abs dispatch for Int32/Int64
- [ ] Math.Round, Floor, Ceiling documentation
- [ ] Transcendental functions marked TODO

### Native Function Implementation

#### Already Implemented in native-math.asm

- [x] Math_Abs_Int32
- [x] Math_Abs_Int64 (stub)
- [x] Math_Sqrt (placeholder)
- [x] Math_Pow (placeholder)
- [x] Math_Log (placeholder)
- [x] Math_Sin (placeholder)
- [x] Math_Cos (placeholder)

#### Functions Needing Completion

**High Priority**:

1. [ ] **Math_Abs_Int64** - 64-bit absolute value
   - Status: Stub
   - Issue: Requires handling 8 bytes (on 6502 with extended memory)
   - Estimate: 2 hours

**Medium Priority** (Decision needed):

2. [ ] **Transcendental functions investigation**
   - Decision: Use lookup tables vs external library
   - Impact: Affects ROM size and performance
   - Estimate: Investigation = 1 hour

3. [ ] **Floating-point support evaluation**
   - Decision: Support or mark as unsupported?
   - Impact: Big - affects all Single/Double operations
   - Estimate: Research = 2 hours

**Lower Priority** (Usually no-op for integers):

- [x] Math.Round (no-op for integers)
- [x] Math.Floor (no-op for integers)
- [x] Math.Ceiling (no-op for integers)
- [x] Math.Truncate (no-op for integers)

**Estimated effort**: 3-4 hours (depends on transcendental decision)

---

## Phase 3: Floating-Point Support (FUTURE)

### Investigation Needed

1. [ ] Survey CC65 floating-point support
2. [ ] Evaluate 16-bit float vs 32-bit float vs 64-bit
3. [ ] Check available libraries and licensing
4. [ ] Decide: Build vs delegate vs unsupported

### Potential Handlers Affected

- SystemFloatHandler.cs (Single/32-bit float)
- SystemDoubleHandler.cs (Double/64-bit float)

### Potential Native Files

- native-float.asm (IEEE 754 32-bit operations)
- native-double.asm (IEEE 754 64-bit operations)

**Status**: Not started - depends on investigation  
**Estimated effort**: 20+ hours if implemented from scratch

---

## Phase 4: Documentation & Polish (FINAL)

### Documentation

- [x] README.md - Architecture and usage
- [x] REFACTORING_GUIDE.md - Migration guide
- [x] IMPLEMENTATION_TODO.md (this file)
- [ ] Code comments in all native functions
- [ ] Example test program in C#
- [ ] Assembly reference for each function

### Code Quality

- [ ] All TODO comments completed or updated
- [ ] Consistent naming throughout
- [ ] Clear input/output documentation for each function
- [ ] Proper zero-page allocation documented
- [ ] No unused code

### Testing

- [ ] Unit tests for all native functions
- [ ] Integration tests with sample programs
- [ ] Edge case testing (overflow, underflow, boundary values)
- [ ] Performance benchmarks

**Estimated effort**: 4-6 hours

---

## Timeline Estimate

### If doing full implementation:

- **Phase 1 (Integer)**: 12-14 hours
- **Phase 2 (Math)**: 4-6 hours (depending on decisions)
- **Phase 3 (Floating-Point)**: 20+ hours (uncertain, may skip)
- **Phase 4 (Polish)**: 4-6 hours

**Total**: 40-50 hours of concentrated work

### Recommended Schedule:

1. **Week 1**: Complete Phase 1 integer operations
2. **Week 2**: Phase 2 investigation + decisions
3. **Week 3**: Polish and documentation
4. **Week 4+**: Floating-point (if decided to implement)

---

## Known Issues & Workarounds

### Issue 1: 6502 can only shift by 1

**Impact**: Variable shifts must loop (slow for large amounts)

**Workarounds**:
- For compile-time known shifts: Use inline shifts (3-30 instructions)
- For variable shifts: Accept loop penalty or use lookup table
- For critical paths: Implement special case for common shifts (8, 16, 24)

**Resolution**: Already handled with loop in Int32_ShiftLeft/Right

### Issue 2: Limited zero-page space

**Impact**: Can't store many temp values simultaneously

**Current allocation**:
- $80-$83: Left operand
- $84-$87: Right operand
- $88-$8B: Result
- $8C-$8F: Temp

**If more space needed**:
- Negotiate with CC65 runtime
- Use stack instead of zero page
- Carefully manage temps (reuse locations)

### Issue 3: Multi-byte operations are slow

**Impact**: Any 32-bit op on 6502 is much slower than 68000

**Example timings**:
- 32-bit add: ~12 cycles (vs 2 on 68000)
- 32-bit multiply: ~200 cycles (vs 40 on 68000)
- 32-bit compare: ~15 cycles (vs 3 on 68000)

**Mitigation**: Accept performance tradeoff for 6502

### Issue 4: Instance method dispatch unclear

**Impact**: Int32.Equals(object) and CompareTo(object) need type checking

**Decision needed**:
- Full runtime type checking?
- Or assume Int32 type (performance)?
- Or delegate to comparison function?

**Current approach**: Stub - needs design decision

---

## Next Steps

### Immediate (Today/Tomorrow)

1. [ ] Validate native-integer.asm syntax
cd C:\Users\stefan\source\repos\JumpCS ca65 Natives/CC65/native-integer.asm -l native-integer.lst

2. [ ] Verify handler generates correct JSR calls
   - Build test program
   - Check generated assembly

3. [ ] Check linking
   - Include native files in build script

### Short Term (This Week)

1. [ ] Complete Phase 1 functions (16-bit → 32-bit)
2. [ ] Write unit tests for each function
3. [ ] Fix any assembly issues

### Medium Term (Next Week)

1. [ ] Phase 2 investigation and decisions
2. [ ] Complete Math_Abs_Int64
3. [ ] Decide on floating-point support

### Long Term (Later)

1. [ ] Floating-point implementation (if approved)
2. [ ] Performance optimization
3. [ ] Additional test coverage

---

## Questions & Decisions Needed

1. **Q**: Should we support floating-point on 6502?
   - Current answer: Investigate first
   - Impact: Affects compatibility

2. **Q**: How should instance methods (Equals, CompareTo) work?
   - Current answer: Stub - needs design
   - Impact: Object comparison functionality

3. **Q**: Should we optimize for speed or size?
   - Current answer: Size (ROMs are precious)
   - Tradeoff: Slower execution

4. **Q**: Any restrictions on zero-page usage?
   - Current answer: $80-$8F reserved for library
   - Coordination: Check with CC65 startup code

---

**Document Version**: 1.0  
**Last Updated**: 2026-04-23  
**Owner**: JumpCS Backend Team  
**Status**: Ready for implementation phase 1