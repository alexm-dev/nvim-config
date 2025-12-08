return {
    {
        "saghen/blink.cmp",
        opts = {
            keymap = {
                preset = "super-tab",
                ["<Tab>"] = { "select_and_accept", "fallback" },
            },
            completion = {
                ghost_text = {
                    enabled = false,
                },
            },
        },
    },
}
