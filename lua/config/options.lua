local o = vim.opt

o.number = true
o.relativenumber = true

o.spelllang = "en_us"
o.spell = true

o.clipboard = "unnamedplus"
o.syntax = "on"

o.autoindent = true
o.cursorline = true
o.cursorlineopt = "both"
o.encoding = "UTF-8"
o.wrap = false

o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.smartindent = true
o.expandtab = true

o.ruler = true
o.mouse = "a"
o.title = true
o.titlestring = "%t"

o.hidden = true
o.ttimeoutlen = 0

o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"

o.splitright = true
o.splitbelow = true
o.termguicolors = true

o.signcolumn = "yes"
o.statuscolumn = "%s%l "
o.fillchars = "eob: "
o.list = true
o.listchars = {
    tab = "  ",
    trail = ">",
}

o.undofile = true
o.undodir = vim.fn.stdpath("state") .. "/undo"

o.updatetime = 300
vim.lsp.set_log_level("off")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
