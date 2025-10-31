-- Node22 binaries to path
if vim.env.LOCALAPPDATA and vim.loop.fs_stat(vim.env.LOCALAPPDATA .. "\\node22") then
    vim.env.PATH = vim.env.LOCALAPPDATA .. "\\node22;" .. (vim.env.PATH or "")
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Add LuaRocks paths to package.path and package.cpath
local lr_path = vim.fn.system("luarocks path --lr-path"):gsub("\n", "")
local lr_cpath = vim.fn.system("luarocks path --lr-cpath"):gsub("\n", "")
package.path = package.path .. ";" .. lr_path
package.cpath = package.cpath .. ";" .. lr_cpath

-- Clangd settings
require("config.clangd_settings")
require("lsp.hide_clangd_diagnostics")

-- Colorscheme
-- require("config.highlights")
vim.highlight.priorities.semantic_tokens = 94

-- Enable PowerShell terminal integration
require("config.pwsh")
