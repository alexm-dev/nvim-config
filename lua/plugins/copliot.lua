return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        -- dependencies = { "copilotlsp-nvim/copilot-lsp" },
        opts = {
            suggestion = {
                enabled = false,
                auto_trigger = false,
                debounce = 600,
            },
            panel = { enabled = false },
            nes = {
                enalbed = false,
            },
        },
        keys = {
            { "<leader>ce", "<cmd>Copilot enable<CR>", desc = "Enable Copilot" },
            { "<leader>cw", "<cmd>Copilot disable<CR>", desc = "Disable Copilot" },
        },
    },
}
