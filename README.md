# My Neovim Configuration

## Quick install

Clone this repository to your Neovim configuration directory:

```bash
git clone https://github.com/alexm-dev/My-lazyvim-configs
```

## Setup

### Node.js configuration

Node.js 24+ (LTS) is recommended.

Node.js 22+ is needed for some plugins to work.
Node.js can be installed via Scoop, nvm, or any other method you prefer.

The **`node_path.lua`** file contains logic to set the node path for Neovim.
Make sure to adjust it according to your installation.

- If you have Node.js 22+ installed via Scoop, no changes are needed.
- However, if you have Node.js installed via nvm or another method, you may need to modify the node_path.lua file to point to the correct Node.js binary.
- Also, when Node.js 22+ is installed via msi installer, then you can remove the node_path.lua file and remove the require line from lua/config/init.lua.

Make sure to adjust the following lines in lua/config/node_path.lua if needed:

```lua
local scoop = vim.env.SCOOP or (home .. "\\scoop")
local node_dir = scoop .. "\\apps\\nodejs-lts\\current"
```

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
