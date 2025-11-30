return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                section_separators = "",
                -- component_separators = "|",
                globalstatus = true,
                theme = {
                    normal = {
                        a = { fg = "#ffffff", bg = "NONE" },
                        b = { fg = "#ffffff", bg = "NONE" },
                        c = { fg = "#ffffff", bg = "NONE" },
                    },
                    insert = {
                        a = { fg = "#51afef", bg = "NONE" },
                        b = { fg = "#ffffff", bg = "NONE" },
                        c = { fg = "#ffffff", bg = "NONE" },
                    },
                    visual = {
                        a = { fg = "#ecbe7b", bg = "NONE" },
                        b = { fg = "#ffffff", bg = "NONE" },
                        c = { fg = "#ffffff", bg = "NONE" },
                    },
                    replace = {
                        a = { fg = "#ff6c6b", bg = "NONE" },
                        b = { fg = "#ffffff", bg = "NONE" },
                        c = { fg = "#ffffff", bg = "NONE" },
                    },
                    inactive = {
                        a = { fg = "#ffffff", bg = "NONE" },
                        b = { fg = "#ffffff", bg = "NONE" },
                        c = { fg = "#ffffff", bg = "NONE" },
                    },
                },
            },
            sections = {
                lualine_x = {},
                lualine_z = {},
            },
        },
    },
}
