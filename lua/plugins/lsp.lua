local fn = vim.fn
local build_dir = fn.fnamemodify(fn.getcwd() .. "/build/debug", ":p")

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--compile-commands-dir=" .. build_dir,
                    },
                    on_attach = function(client, _)
                        client.server_capabilities.documentFormattingProvider = false
                        client.server_capabilities.documentRangeFormattingProvider = false
                    end,
                    capabilities = { offsetEncoding = { "utf-16" } },
                },
            },
        },
    },
}
