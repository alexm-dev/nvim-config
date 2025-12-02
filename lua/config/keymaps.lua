-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Normal mode: duplicate current line below (overrides default <C-d> scrolling)

local map = vim.keymap.set
-- Normal mode: duplicate current line below
map("n", "<C-d>", "yyp", { desc = "Duplicate current line below" })

-- Visual mode: duplicate selected lines below
-- Uses Ex range :t' to copy the visual selection after itself
map("v", "<C-d>", "<Cmd>t'> <CR>", { desc = "Duplicate selection below" })

-- Snacks explorer floating layout
map("n", "<leader>E", function()
    Snacks.picker("explorer", { layout = "floating", auto_close = true })
end, { desc = "Explorer Snacks (Floating)" })

-- Oil explorer keymaps
map("n", "<leader>o", "<Cmd>Oil<CR>", { desc = "Open Oil Explorer" })

-- Inlay hints toggle
map("n", "<leader>ih", function()
    local bufnr = 0 -- current buffer
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
    vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
end, { desc = "Toggle LSP inlay hints" })
