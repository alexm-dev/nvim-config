local vague = {
    bg = "#18191a",
    float = "#1e1e21",
    fg = "#cdcdcd",
    sel = "#32323d",
    match = "#7698cd",
    border = "#444444",
}

vim.hl.priorities.semantic_tokens = 94

-- Inlay Hints (inline types/parameters)
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#707070", bg = vague.float, italic = true })

-- CodeLens
vim.api.nvim_set_hl(0, "LspCodeLens", { fg = vague.match, bold = true })

-- The separator between multiple lenses (if any)
vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = vague.border })

vim.api.nvim_set_hl(0, "Pmenu", { fg = vague.fg, bg = vague.float })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "NONE", bg = vague.sel })
vim.api.nvim_set_hl(0, "PmenuMatch", { fg = vague.match, bold = true })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = vague.float })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = vague.border })

vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = vague.border, bg = vague.float })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { link = "PmenuSel" })
vim.api.nvim_set_hl(0, "BlinkCmpLabel", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { link = "PmenuMatch" })

vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = vague.fg, bg = vague.float })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = vague.border, bg = vague.float })
