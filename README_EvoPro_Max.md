# M32R Mitsubishi / EvoPro Max Ghidra 11.1.2 Extension

Cleaned/repacked version of the uploaded `m32r - 2008-2017 Mitsubishi` Ghidra extension, targeted at Mitsubishi/Renesas M32R-ECU ROM work such as Evo X, Ralliart, Lancer, and Outlander M32186F8-style binaries.

## Main changes

- Added real extension metadata instead of template placeholders.
- Added dedicated language profile:
  - `m32r:2:mitsubishi-fp8000`
- Corrected the M32186F8 memory map:
  - Flash: `0x00000000 - 0x000FFFFF`
  - SFR: `0x00800000 - 0x00803FFF`
  - RAM: `0x00804000 - 0x00813FFF`
- Corrected RAM block length from `0x1C000` to `0x10000`.
- Preserved SFR block at `0x00800000`, size `0x4000`.
- Fixed obvious SFR typo:
  - `AD08DT4 0x80DDD9` -> `AD08DT4 0x8000D9`
- Fixed duplicate vector symbol name:
  - `RIE_4 @ 0x24` -> `RIE_2 @ 0x24`
- Added cleaner Mitsubishi vector labels in the new `m32r-mitsubishi.pspec` profile.
- Updated SLEIGH source p-code for common decompiler accuracy issues:
  - `LDH @(rel16,Rsrc)` now loads from `(Rsrc + rel16)` before sign-extending.
  - `LDI` / `ADDI` signed immediates explicitly sign-extend.
  - `CLRPSW` clears bits instead of ANDing directly with the immediate.
  - `SETPSW` explicitly zero-extends the immediate.
  - `BSET` byte store is explicitly 8-bit.
  - `SUBX` has a conservative borrow-aware model.
- Removed unused Ghidra template Java analyzer/loader/plugin class files so they do not clutter Ghidra.
- Added `ghidra_scripts/M32R_Mitsubishi_AutoSetup.java`.

## Important build note

The `.sinc` / `.slaspec` source is patched, but this sandbox does not have Ghidra's SLEIGH compiler installed. The included `.sla` files are preserved from the uploaded extension. That means the corrected memory map and new processor spec work immediately, but the p-code fixes become active only after you rebuild the extension with your Ghidra 11.1.2 install.

Windows:

```bat
cd "m32r - 2008-2017 Mitsubishi - EvoPro Max"
set GHIDRA_INSTALL_DIR=C:\ghidra_11.1.2_PUBLIC
build_evoProMax_Ghidra1112.bat
```

Linux/macOS:

```bash
cd "m32r - 2008-2017 Mitsubishi - EvoPro Max"
export GHIDRA_INSTALL_DIR=/path/to/ghidra_11.1.2_PUBLIC
./build_evoProMax_Ghidra1112.sh
```

The built extension zip should appear under `dist/`.

## Recommended import setup

- Language: `M32R:BE:32:mitsubishi-fp8000` / `m32r:2:mitsubishi-fp8000`
- ROM base: `0x00000000`
- Internal flash: `0x00000000 - 0x000FFFFF`
- SFR: `0x00800000 - 0x00803FFF`
- RAM: `0x00804000 - 0x00813FFF`

After importing a ROM:

1. Open Script Manager.
2. Run `M32R_Mitsubishi_AutoSetup.java`.
3. Let it create RAM/SFR blocks if missing, label core SFRs, mark ROM ID candidates, create vector labels, create ISR function entries, label flash blocks, and scan possible function-pointer tables.
4. Re-run Auto Analyze.

## What this does not do

This does not create Mitsubishi fuel/timing/MIVEC map definitions automatically. Renesas documentation defines the MCU hardware: memory, SFRs, interrupt vectors, CAN/ADC/timers, flash/RAM behavior, etc. Mitsubishi ECU strategy maps still need to be proven by code references, known XMLs, disassembly, and datalog/flash validation.
