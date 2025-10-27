-- Plugin: kdheepak/lazygit.nvim (adds :LazyGit)
return {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        -- simple check to warn if lazygit binary isn't found
        if vim.fn.executable("lazygit") == 0 then
            vim.notify("lazygit binary not found in PATH. Install it (brew/apt/download release).", vim.log.levels.WARN)
            return
        end

        -- map <leader>gg to open lazygit
        vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
    end,
}
