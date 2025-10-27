local clangd_flags = require("lsp.clangd_flags").flags

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = { "clangd",
                        "--clang-tidy=false",
                        "--background-index",
                        "--query-driver=C:/msys64/mingw64/bin/g++.exe;C:/msys64/mingw64/bin/gcc.exe"
                    },
                    init_options = {
                        fallbackFlags = clangd_flags
                    },
                },
            },
        },
    },
}
