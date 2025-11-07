local msvc_path = "C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/**/bin/Hostx64/x64/cl.exe"
local clang_cl_path = "C:/msys64/mingw64/bin/clang-cl.exe"

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--header-insertion=never",
                        "--clang-tidy=false",
                        --"--query-driver=" .. msvc_path .. ";" .. clang_cl_path
                    },
                    init_options = {
                        -- put whichever flags you want to use by default
                        -- fallbackFlags = require("lsp.clangd_flags").flags,
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
