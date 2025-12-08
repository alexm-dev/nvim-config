return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 60,
                keymap = {
                    accept = "<M-Tab>",
                },
            },
            panel = { enabled = false },
        },
        keys = {
            { "<leader>cg", "<cmd>Copilot toggle<CR>", desc = "Toggle Copilot" },
        },
    },
}
