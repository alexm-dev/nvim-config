return {
    {
        "saghen/blink.cmp",
        dependencies = {
            "saghen/blink.lib",
        },
        event = "InsertEnter",
        build = function()
            require("blink.cmp").build():wait(60000)
        end,
        opts = {
            keymap = {
                preset = "super-tab",
                ["<Tab>"] = { "select_and_accept", "fallback" },
                ["<C-q>"] = { "show_documentation" },
            },
            completion = {
                documentation = {
                    auto_show = false,
                },
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
