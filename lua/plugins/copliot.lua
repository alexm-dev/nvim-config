return {
    {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = false,
                debounce = 200,
            },
            panel = { enabled = true },
        },
    },
}
