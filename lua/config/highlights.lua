-- Custom highlight overrides (direct, always applied)

-- C++ namespace type (example color: light gray)
vim.api.nvim_set_hl(0, "@module.cpp", { fg = "#c8c8b9" })

-- Class type
vim.api.nvim_set_hl(0, "@type.cpp", { fg = "#A6E3A1" })
-- Pink for includes
vim.api.nvim_set_hl(0, "@keyword.import.cpp", { fg = "#F5C2E7" })
-- Variable names in light pink
vim.api.nvim_set_hl(0, "@variable.cpp", { fg = "#F5C2E7" })
-- Parameters in gray
vim.api.nvim_set_hl(0, "@variable.parameter.cpp", { fg = "#9a9a9a" })
