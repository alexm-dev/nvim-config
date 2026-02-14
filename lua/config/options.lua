local global = vim.g
local o = vim.opt

o.number = true
o.relativenumber = false

o.clipboard = "unnamedplus"
o.syntax = "on"

o.autoindent = true
o.cursorline = true
o.cursorlineopt = "both"
o.encoding = "UTF-8"

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
o.ttimeoutlen = 50

o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"

o.splitright = true
o.splitbelow = true
o.termguicolors = true

o.signcolumn = "yes"
o.statuscolumn = "%s%l  "
o.fillchars = "eob: "

o.undofile = true
o.undodir = vim.fn.stdpath("state") .. "/undo"
