# Light-House-Group Homebrew tap

Homebrew tap for [Light-House-Group](https://github.com/Light-House-Group) apps.

## Available casks

| Cask | Description |
| :--- | :--- |
| [`network-monitor`](Casks/network-monitor.rb) | Menu-bar utility for live per-app network monitoring (macOS 13+) |
| [`clip-board`](Casks/clip-board.rb) | Privacy-first clipboard history manager for macOS — AES-GCM at rest, no network code (macOS 14+) |

## Install

```bash
# Network Monitor
brew install --cask light-house-group/taps/network-monitor

# Clip-Board
brew install --cask light-house-group/taps/clip-board
```

Homebrew will auto-add this tap the first time you reference it. To add it explicitly:

```bash
brew tap light-house-group/taps
```

## Update

```bash
brew update
brew upgrade --cask network-monitor
brew upgrade --cask clip-board
```

## Uninstall

```bash
brew uninstall --cask network-monitor
brew uninstall --cask clip-board
```

Add `--zap` to also remove app data and preferences:

```bash
brew uninstall --zap --cask network-monitor
```

## Gatekeeper

Both apps are signed ad-hoc, not notarized with a paid Developer ID, so by default macOS will refuse to launch them with the "Apple could not verify…" message. Each cask runs a `postflight` block that strips the download-quarantine attribute (`com.apple.quarantine`) on install so the app launches normally — the bytes are pinned by the cask's `sha256`, so this is safe.

If you'd rather not have the quarantine stripped automatically, install with `--no-quarantine` is **not** supported by cask, but you can edit the formula to remove the `postflight` block.

## Auto-bump

This tap runs [`.github/workflows/autobump.yml`](.github/workflows/autobump.yml) on a schedule. It uses `brew livecheck --cask --newer-only` to detect each upstream release, computes the new `sha256` from the new release zip, and opens a PR per cask. The bot tracks bumps by branch name (`autobump/<cask>-<version>`) so repeated runs are idempotent.

You can trigger it manually from the Actions tab.

## License

The cask formulae in this repository are released under the [MIT License](LICENSE). The apps they install have their own licenses linked from each formula.
