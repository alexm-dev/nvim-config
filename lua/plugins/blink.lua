return {
    {
        "saghen/blink.cmp",
        build = "cargo build --release",
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
            fuzzy = {
                implementation = "lua",
            },
        },
    },
}
