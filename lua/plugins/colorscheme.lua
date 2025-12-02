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
        "nyoom-engineering/oxocarbon.nvim",
        lazy = false,
    },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            groups = {
                carbonfox = {
                    FloatBorder = { fg = "#131313", bg = "#131313" },
                    FloatTitle = { fg = "fg3", bg = "#131313" },
                    SnacksPickerBorder = { fg = "#131313", bg = "#131313" },
                    SnacksPickerTitle = { fg = "fg3", bg = "#131313" },
                    NormalFloat = { bg = "#131313" },
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
            colorscheme = "carbonfox",
        },
    },
}
