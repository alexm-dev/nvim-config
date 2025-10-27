local get_clients = vim.lsp.get_clients

-- Stop clangd command --

vim.api.nvim_create_user_command("StopClangd", function()
    local clients = get_clients() or {}
    local stopped = false
    for _, client in ipairs(clients) do
        if client and client.name and client.name:match("clangd") then
            vim.lsp.stop_client(client.id)
            print("Stopped LSP:", client.name, "(id:", client.id .. ")")
            stopped = true
        end
    end
    if not stopped then
        print("No active clangd LSP client found.")
    end
end, { desc = "Stop all active clangd LSP clients" })

vim.keymap.set("n", "<leader>sc", ":StopClangd<CR>", { desc = "Stop clangd LSP" })


-- Start clangd command --

vim.api.nvim_create_user_command("StartClangd", function()
    local clients = vim.lsp.get_clients() or {}
    for _, client in ipairs(clients) do
        if client.name == "clangd" then
            print("Clangd is already running (id: " .. client.id .. ")")
            return
        end
    end
    vim.cmd("LspStart clangd")
    print("Started clangd")
end, { desc = "Start clangd LSP manually" })

vim.keymap.set("n", "<leader>scs", ":StartClangd<CR>", { desc = "Start clangd LSP" })
