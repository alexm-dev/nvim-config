return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ft = { "markdown", "md" },
        opts = {},
    },
    {
        "Kicamon/markdown-table-mode.nvim",
        ft = { "markdown", "md" },
        config = function()
            require("markdown-table-mode").setup()
        end,
    },
}
