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
                view = "cmdline_popup",
                format = {
                    cmdline = {
                        title = "",
                    },
                },
            },
            views = {
                cmdline_popup = {
                    relative = "editor",
                    position = {
                        row = -2,
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
