return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            presets = {
                bottom_search = true,
                command_palette = false,
                long_message_to_split = true,
            },
            cmdline = {
                view = "cmdline",
                format = {
                    cmdline = {
                        title = "",
                    },
                },
                inline = true,
            },
            views = {
                cmdline_popup = {
                    relative = "editor",
                    position = {
                        row = -1,
                        col = 0,
                    },
                    size = {
                        width = "100%",
                        height = 1,
                    },
                    border = {
                        style = "none",
                    },
                    win_options = {
                        winhighlight = {
                            Normal = "NoiceCmdlinePopup",
                            FloatBorder = "NoiceCmdlineBorder",
                        },
                    },
                },
            },
        },
    },
}
