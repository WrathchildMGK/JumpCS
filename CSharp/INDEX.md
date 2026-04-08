# JumpCS Complete Documentation Index

**Welcome to JumpCS!** Start here to find what you need.

## 🚀 I Want To...

### Get Started (5 minutes)
→ **[QUICK_START.md](QUICK_START.md)** - Clone, build, test, compile!

### Understand What This Is
→ **[README.md](README.md)** - Overview, features, architecture, FAQ

### Build the Project
→ **[BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)** - 100+ detailed build commands
→ Or use scripts: `build.sh` / `build.cmd`

### Run Tests
→ **[BUILD_INSTRUCTIONS.md#running-tests](BUILD_INSTRUCTIONS.md#running-tests)**
→ Or use scripts: `run-tests.sh` / `RunTests.cmd`

### Find a Command
→ **[COMMANDS_REFERENCE.md](COMMANDS_REFERENCE.md)** - Searchable reference
→ Or print: **[COMMANDS_QUICK_REFERENCE.txt](COMMANDS_QUICK_REFERENCE.txt)**

### See Examples
→ **[EXAMPLE_WORKFLOWS.md](EXAMPLE_WORKFLOWS.md)** - 10 real workflows

### Understand the Architecture
→ **[PROJECT_STRUCTURE.md](PROJECT_STRUCTURE.md)** - How it all fits together

### Check What's Done/Planned
→ **[CHECKLIST.md](CHECKLIST.md)** - Development progress (20% complete)

### Get a Full Overview
→ **[SOLUTION_REVIEW_SUMMARY.md](SOLUTION_REVIEW_SUMMARY.md)** - Complete review

### Navigate All Docs
→ **[DOCUMENTATION_MAP.md](DOCUMENTATION_MAP.md)** - Navigation guide

---

## 📚 All Documentation Files

| File | Purpose | Audience |
|------|---------|----------|
| **README.md** | Main overview | Everyone |
| **QUICK_START.md** | 5-minute setup | New users |
| **BUILD_INSTRUCTIONS.md** | Complete build reference | Developers |
| **COMMANDS_REFERENCE.md** | Categorized commands | Developers |
| **COMMANDS_QUICK_REFERENCE.txt** | One-page printable | Everyone |
| **PROJECT_STRUCTURE.md** | Architecture | Developers |
| **EXAMPLE_WORKFLOWS.md** | Real examples | Developers |
| **FIXES_APPLIED.md** | Implementation notes | Contributors |
| **CHECKLIST.md** | Progress tracking | Project managers |
| **SOLUTION_REVIEW_SUMMARY.md** | Complete review | Project managers |
| **DOCUMENTATION_MAP.md** | Navigation guide | Everyone |
| **INDEX.md** | This file | Everyone |

---

## 🔨 Build Scripts

| Script | Platform | Use |
|--------|----------|-----|
| `build.sh` | Linux/macOS | Full build with options |
| `build.cmd` | Windows | Full build with options |
| `run-tests.sh` | Linux/macOS | Run all 108 tests |
| `RunTests.cmd` | Windows | Run all 108 tests |

Usage:

Linux/macOS
bash run-tests.sh                    # Run tests bash build.sh -c -t -r              # Clean, test, release
Windows
RunTests.cmd                         # Run tests build.cmd -c -t -r                  # Clean, test, release

---

## 🎯 Common Tasks & Commands

### Build for Development

dotnet build CSharp/JumpCS.csproj

### Build for Release

dotnet build CSharp/JumpCS.csproj -c Release
