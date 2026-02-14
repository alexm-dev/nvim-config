return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                section_separators = { left = "|", Right = "|" },
                component_separators = { left = "|", Right = "|" },
                globalstatus = true,
                theme = {
                    normal = {
                        a = { fg = "#DDDDDD", bg = "NONE" },
                        b = { fg = "#DDDDDD", bg = "NONE" },
                        c = { fg = "#DDDDDD", bg = "NONE" },
                    },
                    insert = {
                        a = { fg = "#51afef", bg = "NONE" },
                        b = { fg = "#DDDDDD", bg = "NONE" },
                        c = { fg = "#DDDDDD", bg = "NONE" },
                    },
                    visual = {
                        a = { fg = "#ecbe7b", bg = "NONE" },
                        b = { fg = "#DDDDDD", bg = "NONE" },
                        c = { fg = "#DDDDDD", bg = "NONE" },
                    },
                    replace = {
                        a = { fg = "#ff6c6b", bg = "NONE" },
                        b = { fg = "#DDDDDD", bg = "NONE" },
                        c = { fg = "#DDDDDD", bg = "NONE" },
                    },
                    inactive = {
                        a = { fg = "#DDDDDD", bg = "NONE" },
                        b = { fg = "#DDDDDD", bg = "NONE" },
                        c = { fg = "#DDDDDD", bg = "NONE" },
                    },
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = { "filename", "diff" },
                lualine_c = { "diagnostics" },
                lualine_x = { "branch", "filetype" },
                lualine_y = {},
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            extensions = {},
        },
    },
}
