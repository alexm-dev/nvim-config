return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--clang-tidy=false",
                        "--background-index",
                        "--query-driver=C:/msys64/mingw64/bin/g++.exe;C:/msys64/mingw64/bin/gcc.exe",
                    },
                    init_options = {
                        -- put whichever flags you want to use by default
                        fallbackFlags = require("lsp.clangd_ot").flags,
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
