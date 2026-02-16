return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = { "stylua" },
        })

        local on_attach = function(client, bufnr)
            vim.diagnostic.config({
                underline = true,
                update_in_insert = true,
                virtual_text = { spacing = 2, source = "if_many", prefix = "●" },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "",
                        [vim.diagnostic.severity.INFO] = "",
                    },
                },
            })

            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, opts)
            vim.keymap.set("n", "<leader>cc", vim.lsp.codelens.run, opts)
        end

        local default_opts = {
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            on_attach = on_attach,
        }

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                        codeLens = { enable = true },
                        completion = { callSnippet = "Replace" },
                        doc = { privateName = { "^_" } },
                        hint = {
                            enable = true,
                            setType = false,
                            paramType = true,
                            paramName = "Disable",
                            semicolon = "Disable",
                            arrayIndex = "Disable",
                        },
                    },
                },
            },

            rust_analyzer = {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            allFeatures = false,
                            loadOutDirsFromCheck = true,
                        },
                        check = {
                            command = "clippy",
                            extraArgs = { "--no-deps" },
                        },
                        files = {
                            excludeDirs = { "target", ".git" },
                        },
                        lens = { enable = true },
                        inlayHints = {
                            typeHints = true,
                            parameterHints = false,
                            chainingHints = false,
                        },
                    },
                },
            },
            pyright = {},
        }

        for name, cfg in pairs(servers) do
            vim.lsp.config(name, vim.tbl_deep_extend("force", default_opts, cfg))
            vim.lsp.enable(name)
        end
    end,
}
