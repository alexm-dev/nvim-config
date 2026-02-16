return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            local custom_theme = require("lualine.themes.auto")

            custom_theme.insert = custom_theme.normal
            custom_theme.visual = custom_theme.normal
            custom_theme.replace = custom_theme.normal
            custom_theme.command = custom_theme.normal

            return {
                options = {
                    theme = custom_theme,
                    icons_enabled = true,
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    always_show_tabline = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                        refresh_time = 16,
                    },
                },
                sections = {
                    lualine_a = { "filename" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {},
                    lualine_x = { "encoding", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            }
        end,
    },
}
