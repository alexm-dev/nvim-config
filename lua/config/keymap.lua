vim.g.mapleader = " "

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Save and Quit
map("n", "<leader>w", "<CMD>update<CR>", "Save")
map("n", "<c-s>", "<CMD>update<CR>", "Save")
map("n", "<leader>x", "<CMD>x<CR>", "Save and Quit")

map("n", "<leader>q", "<CMD>q<CR>", "Quit")
map("n", "<leader>Q", "<CMD>q!<CR>", "Quit Force")

-- File Browser
map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", "File Explorer")
map("n", "<leader>o", "<CMD>Oil<CR>", "File Browser (Oil)")
map("n", "<leader>f", "<CMD>FzfLua files<CR>", "Picker")

-- Buffers
map("n", "<leader>bf", "<CMD>FzfLua buffers<CR>", "Buffers")
map("n", "<leader>bb", "<CMD>bnext<CR>", "Next Buffer")

-- Search
map("n", "<leader>h", "<CMD>nohlsearch<CR>", "Clear search")

--- FzfLua
map("n", "<leader>g", "<CMD>FzfLua live_grep<CR>", "Grep")
map("n", "<leader>t", "<CMD>FzfLua grep_visual<CR>", "Grep Text")

-- Window Split --
map("n", "<leader>sv", "<CMD>vs<CR>", "Vertical split")
map("n", "<leader>sh", "<CMD>sp<CR>", "Horizontal split")
map("n", "<leader>sx", "<CMD>close<CR>", "Close split")
map("n", "<leader>se", "<C-w>=", "Equal splits")

map("n", "<C-h>", "<C-w>h", "Go left")
map("n", "<C-j>", "<C-w>j", "Go down")
map("n", "<C-k>", "<C-w>k", "Go up")
map("n", "<C-l>", "<C-w>l", "Go right")
map("n", "<C-Up>", "<CMD>resize +2<CR>", "Resize up")
map("n", "<C-Down>", "<CMD>resize -2<CR>", "Resize down")
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", "Resize left")
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", "Resize right")
