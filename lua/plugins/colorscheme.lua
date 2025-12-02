return {
    -- add colorscheme
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
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            palettes = {
                carbonfox = {
                    bg1 = "#111111",
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
