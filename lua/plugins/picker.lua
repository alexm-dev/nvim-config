return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            explorer = { enabled = true },
            notifier = { enabled = true },
            picker = {
                enabled = true,
                layouts = {
                    base_picker = {
                        layout = {
                            box = "horizontal",
                            backdrop = 60,
                            width = 0.8,
                            height = 0.8,
                            {
                                box = "vertical",
                                border = "rounded",
                                title = "{title} {live} {flags}",
                                { win = "list", border = "none" },
                                { win = "input", height = 1, border = "top" },
                            },
                            {
                                win = "preview",
                                title = "{preview}",
                                border = "rounded",
                                width = 0.5,
                            },
                        },
                    },
                    sidebar_no_input = {
                        layout = {
                            position = "right",
                            width = 35,
                            box = "vertical",
                            { win = "list", border = "none" },
                        },
                    },
                },
                layout = { preset = "base_picker" },

                sources = {
                    explorer = {
                        layout = { preset = "sidebar_no_input" },
                        focus = "list",
                    },
                },
            },
        },
    },
}
