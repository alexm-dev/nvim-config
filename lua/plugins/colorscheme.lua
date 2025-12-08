return {
    {
        "catppuccin/nvim",
        lazy = false,
        --- priority = 1000,
        name = "catppuccin",
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
        },
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        opts = {
            palette_overrides = {
                dark0 = "#1d2021",
            },
            overrides = {},
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
        end,
    },

    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            palettes = {
                carbonfox = {
                    bg1 = "#111111",
                },
            },
            groups = {
                carbonfox = {
                    FloatBorder = { fg = "#131313", bg = "#131313" },
                    FloatTitle = { fg = "fg3", bg = "#131313" },
                    SnacksPickerBorder = { fg = "#131313", bg = "#131313" },
                    SnacksPickerTitle = { fg = "fg3", bg = "#131313" },
                    NormalFloat = { bg = "#131313" },
                    LspReferenceText = { bg = "#444444" },
                    LspReferenceRead = { bg = "#444444" },
                },
            },
        },
        config = function(_, opts)
            require("nightfox").setup(opts)
        end,
    },

    -- Configure LazyVim to load colorscheme
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "gruvbox",
        },
    },
}
