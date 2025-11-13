return {
    {
        "saghen/blink.cmp",
        dependencies = { "fang2hou/blink-copilot" },
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
