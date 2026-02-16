return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "stylua",
            },
        },

        config = function()
            require("mason").setup()

            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {
                    "rust_analyzer",
                    "lua_ls",
                    "pyright",
                },
            })
        end,
    },
}
