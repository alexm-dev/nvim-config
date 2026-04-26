vim.g.mapleader = " "
vim.g.maplocalleader = ","

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
map("n", "<leader>e", function()
    Snacks.picker.explorer()
end, "File Explorer")
map("n", "<leader>o", "<CMD>Oil<CR>", "File Browser (Oil)")
map("n", "<leader>f", function()
    Snacks.picker.files()
end, "Picker")

-- Buffers
map("n", "<leader>bf", function()
    Snacks.picker.buffers()
end, "Buffers")
map("n", "<leader>bb", "<CMD>bnext<CR>", "Next Buffer")
map("n", "<leader>bd", "<CMD>bnext | bd#<CR>", "Close buffer")
map("n", "<leader>bD", "<CMD>bd!<CR>", "Force close buffer")

-- Search
map("n", "<leader>hs", "<CMD>nohlsearch<CR>", "Clear search")

--- FzfLua
map("n", "<leader>gg", function()
    Snacks.picker.grep()
end, "Grep")
map({ "n", "x" }, "<leader>t", function()
    Snacks.picker.grep_word()
end, "Grep Text")

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
map("n", "<leader>ld", function()
    Snacks.picker.diagnostics()
end, "LSP Diagnostics")
map("n", "<leader>lD", "<CMD>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic")
map("n", "<leader>lK", "<CMD>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic")
map("n", "<leader>lq", "<CMD>lua vim.diagnostic.setloclist()<CR>", "Diagnostics to Location List")

map("n", "<leader>ls", function()
    Snacks.picker.lsp_symbols()
end, "Workspace Symbols")
map("n", "<leader>lS", function()
    Snacks.picker.lsp_symbols({ tree = true })
end, "Document Symbols")
map("n", "<leader>ld", function()
    Snacks.picker.lsp_definitions()
end, "Go to Definition")
map("n", "<leader>lr", function()
    Snacks.picker.lsp_references()
end, "References")
map("n", "<leader>lm", function()
    Snacks.picker.lsp_implementations()
end, "Implementations")

map("n", "<leader>li", function()
    Snacks.picker.lsp_incoming_calls()
end, "Incoming Calls")
map("n", "<leader>lo", function()
    Snacks.picker.lsp_outgoing_calls()
end, "Outgoing Calls")
map("n", "<leader>lt", function()
    Snacks.picker.lsp_type_definitions()
end, "Type Definitions")
map("n", "<leader>la", function()
    Snacks.picker.lsp_code_actions()
end, "Code Actions")

map("n", "<leader>lf", function()
    Snacks.picker.lsp_definitions()
end, "LSP Locations")

map("n", "<leader>lh", function()
    local is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
    vim.lsp.inlay_hint.enable(not is_enabled, { bufnr = 0 })
    local status = not is_enabled and "enabled" or "disabled"
    print("Inlay hints " .. status)
end, "Toggle LSP Inlay Hints")

map("n", "<leader>rn", function()
    local is_rel = vim.wo.relativenumber
    if is_rel then
        vim.wo.relativenumber = false
        vim.wo.number = true
        print("Line Numbers: Absolute")
    else
        vim.wo.relativenumber = true
        vim.wo.number = true
        print("Line Numbers: Hybrid")
    end
end, "Toggle Relative Lines")
