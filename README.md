# My Neovim Configuration

## Quick install

Clone this repository to your Neovim configuration directory:
```bash
git clone https://github.com/alexm-dev/My-lazyvim-configs

```
## Setup
In the clangd.lua fiel, set either the path to the mingw64 gcc dir or remove the --query-driver flag if you don't need it.

## Clangd flags
In the clangd.lua file, you can customize the clangd flags according to your needs. The current configuration includes flags for:
- OpenTwin directies
- MINGW-w64 gcc toolchain and the stdlib headers

## Requirements
- Neovim (recommended 0.8+)
- LazyVim
- Git
- optional: node22 installed somewhere under `%LOCALAPPDATA%\node22` or a machine-local path you control (or equivalent on Unix)
- optional: luarocks (if you use LuaRocks-managed modules)

# 💤 LazyVim
Used the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
