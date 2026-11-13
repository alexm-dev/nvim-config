# My Neovim Configuration

Native vim pack and native LSP setup.

## Quick install

```bash
git clone https://github.com/alexm-dev/nvim-config ~/.config/nvim
```

## Requirements
- Neovim 0.12+
- git, curl, tar
- C compiler
- tree-sitter-cli
- ripgrep and fd
- ast-grep
- Nerd font

### Language servers
- clangd, bash-language-server, lua-language-server, rust-analyzer, pyright
- Mason: needs unzip, tar, gzip, curl or wget
- node + npm (for pyright and bash-language-server)

### Formatters
- stylua, rustfmt, black

### Rust
- rustfmt, clippy (rust-analyzer runs clippy on check)

### Debugging (nvim-dap)
- gdb for C/C++
- rust-gdb for Rust
