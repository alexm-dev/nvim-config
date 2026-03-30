vim.g.mapleader = " "

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- Save and Quit
map("n", "<leader>w", "<CMD>update<CR>", "Save")
map("n", "<c-s>", "<CMD>update<CR>", "Save")
map("n", "<leader>xw", "<CMD>x<CR>", "Save and Quit")

map("n", "<leader>q", "<CMD>q<CR>", "Quit")
map("n", "<leader>Q", "<CMD>q!<CR>", "Quit Force")

-- File Browser
map("n", "<leader>e", "<CMD>Neotree toggle<CR>", "File Explorer")
map("n", "<leader>o", "<CMD>Oil<CR>", "File Browser (Oil)")
map("n", "<leader>f", "<CMD>FzfLua files<CR>", "Picker")

-- Buffers
map("n", "<leader>bf", "<CMD>FzfLua buffers<CR>", "Buffers")
map("n", "<leader>bb", "<CMD>bnext<CR>", "Next Buffer")
map("n", "<leader>bd", "<CMD>bnext | bd#<CR>", "Close buffer")
map("n", "<leader>bD", "<CMD>bd!<CR>", "Force close buffer")

-- Search
map("n", "<leader>hs", "<CMD>nohlsearch<CR>", "Clear search")

--- FzfLua
map("n", "<leader>gg", "<CMD>FzfLua live_grep<CR>", "Grep")
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

-- LSP Diagnostics
map("n", "<leader>ld", "<CMD>FzfLua lsp_diagnostics<CR>", "LSP Diagnostics")
map("n", "<leader>lD", "<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic")
map("n", "<leader>lK", "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic")
map("n", "<leader>lq", "<CMD>lua vim.diagnostic.setloclist()<CR>", "Diagnostics to Location List")

-- LSP Symbols / Definitions / References
map("n", "<leader>ls", "<CMD>FzfLua lsp_workspace_symbols<CR>", "Workspace Symbols")
map("n", "<leader>lS", "<CMD>FzfLua lsp_document_symbols<CR>", "Document Symbols")
map("n", "<leader>ld", "<CMD>FzfLua lsp_definitions<CR>", "Go to Definition")
map("n", "<leader>lr", "<CMD>FzfLua lsp_references<CR>", "References")
map("n", "<leader>lm", "<CMD>FzfLua lsp_implementations<CR>", "Implementations")

map("n", "<leader>li", "<CMD>FzfLua lsp_incoming_calls<CR>", "Incoming Calls")
map("n", "<leader>lo", "<CMD>FzfLua lsp_outgoing_calls<CR>", "Outgoing Calls")
map("n", "<leader>lt", "<CMD>FzfLua lsp_typedefs<CR>", "Type Definitions")
map("n", "<leader>la", "<CMD>FzfLua lsp_code_actions<CR>", "Code Actions")
map("n", "<leader>lf", "<CMD>FzfLua lsp_finder<CR>", "All LSP Locations")

-- Git files / commits
map("n", "<leader>gf", "<CMD>FzfLua git_files<CR>", "Git Files")
map("n", "<leader>gc", "<CMD>FzfLua git_commits<CR>", "Git Commits")
map("n", "<leader>gb", "<CMD>FzfLua git_branches<CR>", "Git Branches")
map("n", "<leader>gs", "<CMD>FzfLua git_status<CR>", "Git Status")

-- Vim commands & keymaps
map("n", "<leader>hk", "<CMD>FzfLua keymaps<CR>", "Keymaps")
map("n", "<leader>hc", "<CMD>FzfLua commands<CR>", "Commands")
map("n", "<leader>hh", "<CMD>FzfLua help_tags<CR>", "Help Tags")

-- Everything search
map("n", "<leader>fp", "<CMD>FzfLua resume<CR>", "Fzf Resume")
map("n", "<leader>fa", "<CMD>FzfLua commands<CR>", "Command Palette")
