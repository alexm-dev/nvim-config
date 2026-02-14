return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            contrast = "hard",
            overrides = {
                FloatBorder = { fg = "#1d2021" },
                FloatTitle = { fg = "#1d2021" },
                SnacksPickerBorder = { fg = "#1d2021" },
            },
        },
        config = function(_, opts)
            require("gruvbox").setup(opts)
            vim.cmd("colorscheme gruvbox")
        end,
    },
}
