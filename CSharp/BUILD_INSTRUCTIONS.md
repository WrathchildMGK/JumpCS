# Jump to
- [Visual Studio Build](#visual-studio-build)
- [Build Output](#build-output)
- [Running the Compiler](#running-the-compiler)

### Visual Studio Build

1. Open `JumpCS.sln` in Visual Studio 2026
2. Select "Build > Build Solution" or press `Ctrl+Shift+B`
3. Or build individual projects from Solution Explorer

## Build Output

After a successful build:
- Main executable: `CSharp/bin/Debug/net10.0/JumpCS.exe` (or `.dll`)
- Test assembly: `CSharp/JumpCS.Tests/bin/Debug/net10.0/JumpCS.Tests.dll`

## Running the Compiler

## Running Tests

## Troubleshooting

### Issue: "Assembly not found" on Linux/macOS
- **Solution**: File paths are case-sensitive. Ensure correct assembly path.

### Issue: "Type or namespace 'JumpCS' not found"
- **Solution**: Ensure you're building from the correct directory.
- Run: `dotnet build CSharp/JumpCS.csproj` from repository root

### Issue: Tests not discovered
- **Solution**: Ensure test project references xUnit:

## Clean Build

To perform a clean rebuild:

## Performance Profiling

For release builds with optimization:
