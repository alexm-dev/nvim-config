return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "fang2hou/blink-copilot",
            opts = {
                max_completions = 1,
            },
        },
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
            sources = {
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
    },
}
