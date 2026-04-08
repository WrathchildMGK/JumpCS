# JumpCS - C# MSIL to 68000 Assembler Compiler

A sophisticated post-compiler that converts C# applications (compiled to MSIL) into Motorola 68000 assembly language for embedded systems. This is a modern port of the original Jump Java-to-Palm-Pilot compiler.

## 🚀 Quick Start

## 📦 Project Structure

## 📚 Documentation

Start here for complete information:

1. **[QUICK_START.md](QUICK_START.md)** - Get up and running in 5 minutes
2. **[PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)** - Architecture and design
3. **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** - Detailed build guide
4. **[FIXES_APPLIED.md](FIXES_APPLIED.md)** - Implementation notes
5. **[CHECKLIST.md](CHECKLIST.md)** - Development progress
6. **[SOLUTION_REVIEW_SUMMARY.md](SOLUTION_REVIEW_SUMMARY.md)** - Full review

## ✨ Features

✅ **Full MSIL Analysis** - Parses .NET assemblies using System.Reflection.Metadata
✅ **Smart Dependency Tracking** - Automatically includes only needed types/methods
✅ **Object-Oriented Support** - Virtual method tables, interface tables, inheritance
✅ **Type Safety** - Optional bounds checking, null pointer detection, stack monitoring
✅ **Comprehensive Testing** - 108 test cases for arithmetic and type operations
✅ **Highly Configurable** - 20+ command-line options and configuration file support

## 📋 Command-Line Options

| Option | Description |
|--------|-------------|
| `-t`/`-m`/`-h` | Memory model (Small/Large/Huge) |
| `-v`/`-V` | Verbose/Super-verbose output |
| `-O[0-6]` | Optimization level |
| `-g` | Include debug symbols |
| `-a`/`-n`/`-S` | Disable safety checks |
| `-s BYTES` | Stack size |
| `-P` | Enable/disable peephole optimization |
| `-Ttarget` | Target platform (68000, st, 6502) |
| `-Dsymbol` | Define preprocessor symbol |

## 🎯 Compilation Workflow

1. **Load Assembly** - Parse .NET metadata
2. **Analyze Classes** - Build class hierarchy
3. **Resolve Dependencies** - Iteratively mark needed elements
4. **Layout Phase** - Calculate field offsets, vtable indices
5. **Code Generation** - Translate MSIL to 68000
6. **Optimization** - Apply peephole patterns
7. **Output** - Generate assembly file

## 🔧 Configuration

Edit `appsettings.json`:

## 🧪 Test Suite

**108 comprehensive tests** covering:
- Integer (Int32) arithmetic
- Single-precision (Float) operations
- Double-precision (Double) operations
- Decimal (128-bit) arithmetic
- Type conversions
- Special values (NaN, Infinity)
- Financial calculations

Run tests:

## 📊 Project Status

| Component | Status |
|-----------|--------|
| Core Analysis | ✅ Complete |
| Test Framework | ✅ Complete |
| Assembly Loading | ✅ Complete |
| 68000 Backend | 🔶 In Progress |
| MSIL Translation | 🔶 In Progress |
| Optimization | 🔶 Planned |

**Overall**: 20% complete, actively developed

## 🔗 Links

- **Repository**: https://github.com/WrathchildMGK/JumpCS
- **Original Project**: Jump Java compiler for PalmPilot
- **Target**: Motorola 68000 architecture

## 📝 License

GNU General Public License v2 (GPL v2)

See [COPYING](COPYING) file for full license text.

## 👥 Contributors

- **Original Jump**: Greg Hewgill, Ralf Kleberhoff, Peter Dickerson
- **C# Port**: 2026 Contributors

## 🐛 Issue Tracker

Found a bug? Have a feature request?
→ [Open an issue on GitHub](https://github.com/WrathchildMGK/JumpCS/issues)

## 🤝 Contributing

We welcome contributions! Please:
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## ❓ FAQ

**Q: What's the difference between Jump and JumpCS?**
A: Jump compiles Java bytecode to 68000. JumpCS compiles C# MSIL to 68000.

**Q: Why 68000?**
A: Primary target for embedded/legacy systems with tight memory constraints.

**Q: Can I target other architectures?**
A: 68000 is fully supported. AtariST and 6502 support is planned.

**Q: How complete is the compiler?**
A: Core analysis is complete. Code generation is in active development.

## 🚦 Current Focus

Currently implementing:
- MSIL to 68000 instruction translation
- Register allocation strategy
- Stack frame management

See [CHECKLIST.md](CHECKLIST.md) for detailed progress.

---

**Updated**: April 2026
**Status**: Actively Developed
**Language**: C# (.NET 10)
