-- Custom highlight overrides (direct, always applied)

local function set_highlight()
    -- C++ namespace type
    vim.api.nvim_set_hl(0, "@module.cpp", { fg = "#c8c8b9" })

    -- Class type
    --vim.api.nvim_set_hl(0, "@type.cpp", { fg = "#A6E3A1" })

    -- Constructor names in light blue (default method color)
    vim.api.nvim_set_hl(0, "@constructor.cpp", { fg = "#89b4fa" })

    -- Variable names in light pink
    vim.api.nvim_set_hl(0, "@variable.cpp", { fg = "#F5C2E7" })

    -- Parameters in gray
    vim.api.nvim_set_hl(0, "@variable.parameter.cpp", { fg = "#9a9a9a" })
end

local function set_includes()
    vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#9a9a9a" })
    vim.api.nvim_set_hl(0, "@keyword.import.cpp", { fg = "#9a9a9a" })
end

local function apply_highlights()
    set_highlight()
    set_includes()
end

-- apply immediately
apply_highlights()

-- re-apply after colorscheme changes so the color sticks
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = apply_highlights,
})
