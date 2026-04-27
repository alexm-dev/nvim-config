local vague = {
    bg = "#18191a",
    float = "#1e1e21",
    fg = "#cdcdcd",
    sel = "#32323d",
    match = "#7698cd",
    border = "#444444",
}

-- Set cursor line color consistent with LineNr and SignColumn
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    pattern = "*",
    callback = function()
        local cl_hl = vim.api.nvim_get_hl(0, { name = "CursorLine" })
        local nr_hl = vim.api.nvim_get_hl(0, { name = "LineNr" })
        local cnr_hl = vim.api.nvim_get_hl(0, { name = "CursorLineNr" })

        local cl_bg = cl_hl.bg

        if cl_bg then
            vim.api.nvim_set_hl(0, "CursorLineNr", {
                fg = cnr_hl.fg,
                bg = cl_bg,
                bold = cnr_hl.bold or true,
            })
            vim.api.nvim_set_hl(0, "CursorLineSign", { bg = cl_bg })
            vim.api.nvim_set_hl(0, "CursorLineFold", { bg = cl_bg })
        end

        vim.api.nvim_set_hl(0, "LineNr", {
            fg = nr_hl.fg,
            bg = "NONE",
        })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    end,
})

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
