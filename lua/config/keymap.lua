vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<leader>w", "<CMD>update<CR>")

map("n", "<leader>q", "<CMD>q<CR>")
map("n", "<leaer>w", "<CMD>qw<CR>")

map("n", "<leader>o", "<CMD>Oil<CR>")
map("n", "<leader>f", "<CMD>FzfLua files<CR>")
map("n", "<leader>b", "<CMD>FzfLua buffers<CR>")

map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
