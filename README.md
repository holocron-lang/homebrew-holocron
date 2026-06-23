# homebrew-holocron

[Homebrew](https://brew.sh) tap for
[Holocron](https://github.com/holocron-lang/holocron) — installs the CLI
compiler and the LSP server on macOS and Linux.

## Install

```sh
brew tap holocron-lang/holocron
brew install holocron
```

Installs both binaries:

- **`holocron`** — the CLI compiler (YAML → PostgreSQL DDL).
- **`holocron-lsp`** — the LSP server for editor integration.

The formula points at the prebuilt platform archives attached to each
[GitHub Release](https://github.com/holocron-lang/holocron/releases), so the
install is download-only (no compilation).

## Status

🚧 **Work in progress.** Formula not yet published.

## License

[MPL-2.0](LICENSE) — matches the parent project.
