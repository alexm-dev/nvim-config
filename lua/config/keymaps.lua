-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Normal mode: duplicate current line below (overrides default <C-d> scrolling)

local map = vim.keymap.set
-- Normal mode: duplicate current line below
map('n', '<C-d>', 'yyp', { desc = 'Duplicate current line below' })

-- Visual mode: duplicate selected lines below
-- Uses Ex range :t' to copy the visual selection after itself
map('v', '<C-d>', "<Cmd>t'> <CR>", { desc = 'Duplicate selection below' })

-- Uncomment if you want Ctrl-d to work while inserting (it will briefly leave insert mode).
-- map('i', '<C-d>', '<Esc>yypi', { desc = 'Duplicate line below (insert mode)' })
