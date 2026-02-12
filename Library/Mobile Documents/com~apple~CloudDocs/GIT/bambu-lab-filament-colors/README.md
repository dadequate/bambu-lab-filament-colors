# Bambu Lab Filament Colors for macOS 🎨

A macOS `.clr` color palette generated from **Bambu Lab’s published filament hex-code tables** (where available), plus the **PLA Wood series**.

This is meant to be practical: drop the palette into `~/Library/Colors/` and it shows up anywhere macOS uses the system color picker (Xcode, Sketch, Affinity, etc.).

## What’s in this repo

- `bambu_filament_colors.m` — Objective‑C generator that writes the `.clr` file into your user Colors folder.
- `Bambu Lab Filament Colors.clr` — (Optional) prebuilt palette file, if you include it in releases.
- `colors.json` — the raw name/hex list used by the generator.

## Current coverage

Included (from Bambu Lab hex-code tables + prior PLA set):

- **PLA Basic**
- **PLA Matte**
- **PLA Tough+**
- **PLA Translucent**
- **PLA‑CF**
- **PETG‑CF**
- **ABS**
- **TPU 90A**
- **PLA Silk Multi‑Color** (partial sample in `colors.json` — add more if you want every variant)
- **PLA Wood** (manual / based on Bambu’s wood series colors used earlier)

> Note: Not every filament family on the store has a published “Hex Code Table” PDF. If Bambu publishes more, add them to `colors.json` and regenerate.

## Install (prebuilt `.clr`)

1. Copy `Bambu Lab Filament Colors.clr` into:
   ```bash
   ~/Library/Colors/
   ```
2. Open any app’s color picker → **Color Palettes** → select **Bambu Lab Filament Colors**.

## Build it yourself

```bash
clang -framework Foundation -framework AppKit -o bambu_colors bambu_filament_colors.m
./bambu_colors
```

Output:
```bash
~/Library/Colors/Bambu Lab Filament Colors.clr
```

## Personal use

This is intended for personal use. Filament names and branding belong to their respective owners.

## Links

- Repo: https://github.com/dadequate/bambu-lab-filament-colors
- Maine Pottery Co.: https://mainepottery.com
