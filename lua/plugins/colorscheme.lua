return {
    {
        "vague-theme/vague.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme vague")
        end,
    },

    {
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPost",
        config = function()
            require("colorizer").setup({
                "*",
            })
        end,
    },
}
