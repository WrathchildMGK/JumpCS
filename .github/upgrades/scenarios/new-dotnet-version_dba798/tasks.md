# JumpCS .NET 10.0 Upgrade Tasks

## Overview

This document tracks the atomic upgrade of the JumpCS project from .NET Framework 4.8 (classic, non-SDK style) to .NET 10.0 (SDK-style). All changes will be applied in a single operation, followed by build and validation.

**Progress**: 0/2 tasks complete (0%) ![0%](https://progress-bar.xyz/0)

---

## Tasks

### [▶] TASK-001: Atomic SDK-style conversion and framework upgrade
**References**: Plan §4, Plan §2, Plan §1

- [✓] (1) Convert `JumpCS.csproj` to SDK-style format per Plan §4
- [▶] (2) Update `TargetFramework` to `net10.0` in `JumpCS.csproj`
- [ ] (3) Remove legacy project system elements as specified in Plan §4
- [ ] (4) Restore dependencies (if any)
- [ ] (5) Build the solution and fix any compilation errors resulting from the upgrade
- [ ] (6) Solution builds with 0 errors (**Verify**)

---

### [ ] TASK-002: Commit atomic upgrade changes
**References**: Plan §8

- [ ] (1) Commit all changes with message: "TASK-002: Atomic SDK-style conversion and .NET 10.0 upgrade for JumpCS"

---

