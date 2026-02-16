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
}
