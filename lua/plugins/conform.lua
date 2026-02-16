return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        config = function()
            local conform = require("conform")
            conform.setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    rust = { "rustfmt" },
                    python = { "black" },
                },
                format_on_save = true,
                timeout_ms = 5000,
            })

            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function()
                    conform.format()
                end,
            })
        end,
    },
}
