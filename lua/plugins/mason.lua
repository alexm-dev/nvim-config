return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "rust-analyzer",
                "stylua",
            },
        },

        config = function()
            require("mason").setup()
        end,
    },
}
