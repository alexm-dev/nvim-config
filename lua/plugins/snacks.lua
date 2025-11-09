return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                sources = {
                    explorer = {
                        layout = {
                            preview = "main",
                            pos = "left",
                            width = 40,
                        },
                        win = {
                            list = {
                                keys = {
                                    ["u"] = "explorer_up",
                                },
                            },
                        },
                    },
                },
                layouts = {
                    floating = {
                        layout = {
                            preview = true,
                            box = "horizontal",
                            width = 0.8,
                            height = 0.8,
                            {
                                box = "vertical",
                                border = "rounded",
                                title = "{source} {flags}",
                                title_pos = "center",
                                { win = "input", height = 1, border = "bottom" },
                                { win = "list", border = "none" },
                            },
                            { win = "preview", border = "rounded", width = 0.7, title = "{preview}" },
                        },
                    },
                },
            },
        },
    },
}
