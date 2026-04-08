# JumpCS Project Structure

## Solution Overview

JumpCS is a C# compiler that converts .NET MSIL (Microsoft Intermediate Language) to Motorola 68000 assembly language, with potential to target other architectures (Atari ST, 6502).

## Directory Structure

## Key Components

### Core Analysis Pipeline

1. **Assembly Loading** (`AssemblyMetadata`)
   - Loads .NET assemblies using reflection
   - Provides access to metadata via `MetadataReader`

2. **Class Analysis** (`ClassMetadata`)
   - Analyzes class hierarchy
   - Tracks instance fields and methods
   - Builds virtual method tables (vtables)
   - Calculates instanceof compatibility tables (itables)

3. **Method Analysis** (`MethodMetadata`)
   - Analyzes method signatures and modifiers
   - Tracks method dependencies
   - Computes effective methods for virtual calls

4. **Dependency Resolution** (`JavaElement`)
   - Marks elements as needed/unneeded
   - Iteratively resolves transitive dependencies
   - Tracks why each element is needed

### Code Generation

1. **Backend** (`BackEnd`)
   - Abstract base for code generators
   - Supports multiple target architectures

2. **68000 Backend** (`Asm68000BackEnd`)
   - Generates Motorola 68000 assembly
   - Translates MSIL instructions to native code
   - Manages register allocation
   - Generates vtables and class tables

### Configuration

- **appsettings.json**: Runtime configuration
  - Memory model (Small, Large, Huge)
  - Target platform (68000, AtariST, 6502)
  - Optimization levels
  - Safety checks (bounds, null, stack)

## Design Patterns

### Need Status Tracking

Elements (classes, methods, fields) have a need status:
- `UNNEEDED` (0) - Not included in output
- `NEEDED` (1) - Basic inclusion
- `INSTANCE_NEEDED` (2) - Instances needed
- `EXACT_INSTANCE_NEEDED` (3) - Byte-exact layout required
- `NEEDED_VIRTUALLY` (256) - Method called virtually
- `NEEDED_INSTANCEOF` (256) - Type checked with instanceof

### Inheritance Hierarchy

### Factory Pattern

- `ClassMetadata.FromType()` - Create from reflection type
- `ClassMetadata.CreateSynthetic()` - Create synthetic metadata

## Technologies Used

- **.NET 10** - Target framework
- **System.Reflection** - Type inspection
- **System.Reflection.Metadata** - IL metadata access
- **Microsoft.Extensions.Configuration** - Configuration management
- **xUnit** - Testing framework

## Compilation Options

Command-line flags compatible with Jump Java compiler:
- `-t/-m/-h` - Memory model (Small/Large/Huge)
- `-g` - Include debug symbols
- `-v/-V` - Verbosity levels
- `-a/-n/-S` - Disable safety checks
- `-O[0-6]` - Optimization level
- `-P` - Enable/disable peephole optimization
- `-Ttarget` - Target architecture
- `-Dsymbol` - Define preprocessor symbols

## Next Development Areas

1. **MSIL Translation** - Convert IL instructions to 68000 opcodes
2. **Register Allocation** - Optimize register usage
3. **Link/Load Strategy** - Segmentation and relocation
4. **Debug Symbol Generation** - Source mapping
5. **Additional Backends** - AtariST, 6502 support
