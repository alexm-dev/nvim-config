vim.g.mapleader = " "

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

map("n", "<leader>w", "<CMD>update<CR>", "Save")
map("n", "<leader>q", "<CMD>q<CR>", "Quit")

map("n", "<leader>o", "<CMD>Oil<CR>", "File Browser (Oil)")
map("n", "<leader>f", "<CMD>FzfLua files<CR>", "Picker")
map("n", "<leader>b", "<CMD>FzfLua buffers<CR>", "Buffers")
map("n", "<leader>g", "<CMD>FzfLua live_grep<CR>", "Grep")
map("n", "<leader>t", "<CMD>FzfLua grep_visual<CR>", "Grep Text")

map("n", "<leader>e", "<CMD>Neotree toggle<CR>", "File Explorer")
