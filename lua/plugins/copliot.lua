return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = false,
                debounce = 300,
            },
            panel = { enabled = true },
        },
    },
}
