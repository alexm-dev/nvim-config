-- Node24 binaries to path
if vim.env.LOCALAPPDATA and vim.loop.fs_stat(vim.env.LOCALAPPDATA .. "\\node24") then
    local node_path = vim.env.LOCALAPPDATA .. "\\node24"
    if not vim.env.PATH:find(node_path, 1, true) then
        vim.env.PATH = node_path .. ";" .. (vim.env.PATH or "")
    end
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Clangd settings
require("config.clangd_settings")
require("lsp.hide_clangd_diagnostics")

-- Colorscheme
-- require("config.highlights")
vim.highlight.priorities.semantic_tokens = 94

-- Enable PowerShell terminal integration
require("config.pwsh")
