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
vim.api.nvim_set_hl(0, "LspInlayHint", {
    fg = "#707070",
    bg = "#121212",
    italic = true,
})

-- CodeLens
vim.api.nvim_set_hl(0, "LspCodeLens", {
    fg = "#569CD6",
    bold = true,
})

-- The separator between multiple lenses (if any)
vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#444444" })
