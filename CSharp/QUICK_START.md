# JumpCS Quick Start Guide

## What is JumpCS?

JumpCS is a post-compiler that converts C# applications (compiled to MSIL) into native assembly code for embedded systems, primarily targeting Motorola 68000 processors.

## Installation

1. Clone the repository:
2. Build the project:

## Basic Usage

## Key Features

✅ **MSIL Analysis** - Parses .NET assemblies
✅ **Dependency Resolution** - Automatically includes needed types
✅ **Virtual Table Generation** - Supports OOP with vtables
✅ **Type Safety** - Optional bounds/null checking
✅ **Optimization** - Configurable optimization levels

## Common Options

| Option | Description |
|--------|-------------|
| `-v` | Verbose output |
| `-V` | Super-verbose output |
| `-t` | Small memory model (default) |
| `-m` | Large memory model |
| `-h` | Huge memory model |
| `-O[0-6]` | Optimization level |
| `-g` | Include debug symbols |
| `-c` | Disable class names in output |
| `-a` | Disable array bounds checking |
| `-n` | Disable null checking |
| `-s BYTES` | Set stack size |

## Example Walkthrough

1. **Create a simple C# program**:

	2. **Compile to .NET assembly**:

	3. **Compile to 68000 assembly**:
4. **Output files**:
   - `TestApp_generated.asm` - Generated 68000 assembly

## Running Tests

## Troubleshooting

**Q: Assembly not found**
A: Make sure the file exists and provide the full path

**Q: No entry point found**
A: Ensure the assembly has a `Main()` or `PilotMain()` method

**Q: OutOfMemoryException**
A: Increase stack size with `-s` option or use larger memory model

## Next Steps

- Read [PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md) for architecture details
- Check [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md) for advanced builds
- Review [FIXES_APPLIED.md](FIXES_APPLIED.md) for implementation notes

## Support & Contribution

For issues, questions, or contributions:
- Repository: https://github.com/WrathchildMGK/JumpCS
- Issues: https://github.com/WrathchildMGK/JumpCS/issues

## License

GNU General Public License v2 (GPL v2) - See COPYING file for details