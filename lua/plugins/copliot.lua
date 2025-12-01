return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = false,
                auto_trigger = false,
            },
            panel = { enabled = false },
        },
        keys = {
            { "<leader>cg", "<cmd>Copilot toggle<CR>", desc = "Toggle Copilot" },
        },
    },
}
