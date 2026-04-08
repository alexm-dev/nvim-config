return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        build = "cargo build --release",
        opts = {
            keymap = {
                preset = "super-tab",
                ["<Tab>"] = { "select_and_accept", "fallback" },
                ["<C-q>"] = { "show_documentation" },
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
