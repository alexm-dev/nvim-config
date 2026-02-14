return {
    {
        "saecki/crates.nvim",
        tag = "stable",
        ft = { "toml" },
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup({
                lsp = {
                    enabled = true,
                    actions = true,
                    completion = true,
                    hover = true,
                },
            })
        end,
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^7", -- Recommended
        lazy = false, -- This plugin is already lazy
    },
}
