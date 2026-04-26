local function toggle_codelens(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    local enabled = not vim.b[bufnr].codelens_enabled
    vim.b[bufnr].codelens_enabled = enabled

    vim.lsp.codelens.enable(enabled, { bufnr = bufnr })

    vim.notify("CodeLens " .. (enabled and "enabled" or "disabled"))
end

local function toggle_inlay_hints(bufnr)
    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })

    vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })

    vim.notify("Inlay hints " .. (not enabled and "enabled" or "disabled"))
end

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

    vim.g.codelens_enabled = false

    if client.server_capabilities.codeLensProvider then
        vim.b[bufnr].codelens_enabled = vim.g.codelens_enabled
        vim.lsp.codelens.enable(vim.g.codelens_enabled, { bufnr = bufnr })
    end

    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "List references" }))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic", buffer = bufnr })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic", buffer = bufnr })
    vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Show diagnostic", buffer = bufnr })
    vim.keymap.set(
        "n",
        "<leader>cl",
        vim.diagnostic.setloclist,
        { desc = "Diagnostics to location list", buffer = bufnr }
    )
    vim.keymap.set("n", "<leader>lc", function()
        toggle_codelens(bufnr)
    end, { desc = "Toggle CodeLens", buffer = bufnr })

    vim.keymap.set("n", "<leader>lh", function()
        toggle_inlay_hints(bufnr)
    end, { desc = "Toggle Inlay Hints", buffer = bufnr })
end

local default_opts = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    on_attach = on_attach,
}

local servers = {
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
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
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", "rust-project.json" },
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
                    parameterHints = true,
                    chainingHints = true,
                },
            },
        },
    },

    clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_markers = { "compile_commands.json", "CMakeLists.txt", ".git" },
    },

    jdtls = {
        cmd = { "jdtls" },
        filetypes = { "java" },
        root_markers = { "pom.xml", "build.gradle", ".git" },
    },
}

for name, cfg in pairs(servers) do
    vim.lsp.config(name, vim.tbl_deep_extend("force", default_opts, cfg))
    vim.lsp.enable(name)
end
