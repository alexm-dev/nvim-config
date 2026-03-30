return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local on_attach = function(client, bufnr)
                vim.diagnostic.config({
                    underline = true,
                    update_in_insert = false,
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

                if client.server_capabilities.documentHighlightProvider then
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = bufnr,
                        callback = vim.lsp.buf.document_highlight,
                    })
                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = bufnr,
                        callback = vim.lsp.buf.clear_references,
                    })
                end

                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set(
                    "n",
                    "gd",
                    vim.lsp.buf.definition,
                    vim.tbl_extend("force", opts, { desc = "Go to definition" })
                )
                vim.keymap.set(
                    "n",
                    "gr",
                    vim.lsp.buf.references,
                    vim.tbl_extend("force", opts, { desc = "List references" })
                )
                vim.keymap.set(
                    "n",
                    "K",
                    vim.lsp.buf.hover,
                    vim.tbl_extend("force", opts, { desc = "Hover documentation" })
                )
                vim.keymap.set(
                    "n",
                    "<leader>ca",
                    vim.lsp.buf.code_action,
                    vim.tbl_extend("force", opts, { desc = "Code action" })
                )
                vim.keymap.set(
                    "n",
                    "<leader>cr",
                    vim.lsp.buf.rename,
                    vim.tbl_extend("force", opts, { desc = "Rename symbol" })
                )
                vim.keymap.set(
                    "n",
                    "<leader>cC",
                    vim.lsp.codelens.refresh,
                    vim.tbl_extend("force", opts, { desc = "Refresh codelens" })
                )
                vim.keymap.set(
                    "n",
                    "<leader>cc",
                    vim.lsp.codelens.run,
                    vim.tbl_extend("force", opts, { desc = "Run codelens" })
                )

                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", buffer = bufnr })
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", buffer = bufnr })
                vim.keymap.set(
                    "n",
                    "<leader>ce",
                    vim.diagnostic.open_float,
                    { desc = "Show diagnostic", buffer = bufnr }
                )
                vim.keymap.set(
                    "n",
                    "<leader>cl",
                    vim.diagnostic.setloclist,
                    { desc = "Diagnostics to location list", buffer = bufnr }
                )
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
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--compile-commands-dir=" .. vim.fn.fnamemodify("build/debug", ":p"),
                    },
                    initialization_options = {
                        fallbackFlags = { "-fms-compatibility", "-fms-extensions" },
                    },
                },
            }

            for name, cfg in pairs(servers) do
                vim.lsp.config(name, vim.tbl_deep_extend("force", default_opts, cfg))
                vim.lsp.enable(name)
            end
        end,
    },
}
