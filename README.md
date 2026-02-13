# My Neovim Configuration

## Quick install

Clone this repository to your Neovim configuration directory:

```bash
git clone https://github.com/alexm-dev/nvim-config
```

## Setup

### Node.js configuration

Node.js 24+ (LTS) is recommended.

Node.js 22+ is needed for some plugins to work.
Node.js can be installed via Scoop, nvm, or any other method you prefer.

### Clangd flags

In the clangd.lua file, set either the path to the mingw64 gcc dir or remove the --query-driver flag if you don't need it.

In the lua/lsp/clangd_flags.lua file, you can customize the clangd flags according to your needs.
The current configuration includes flags for:

- OpenTwin directies
- MINGW-w64 gcc toolchain and the stdlib headers

## Requirements

- Neovim (recommended 0.8+) with:
  - bat
  - fd
  - RipGrep
  - fzf
  - GCC compiler for treesitter
  - tree-sitter-cli (can be installed via npm or cargo)
  - ast-grep
- Node.js version 22+ (for some plugins)
- LazyVim
- Git
- LazyGit
- optional: luarocks (if you use LuaRocks-managed modules)

## 💤 LazyVim

Used the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

