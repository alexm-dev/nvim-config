return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        dependencies = { "copilotlsp-nvim/copilot-lsp" },
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = false,
                debounce = 600,
            },
            panel = { enabled = true },
            nes = {
                enalbed = true,
            },
        },
    },
}
