return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "rust-analyzer",
            },
        },

        config = function()
            require("mason").setup()
        end,
    },
}
