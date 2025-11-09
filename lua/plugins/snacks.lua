return {
    {
        "folke/snacks.nvim",
        config = function()
            require("snacks").setup({
                picker = {
                    sources = {
                        explorer = {
                            layout = {
                                preview = "main",
                                position = "left",
                                width = 40,
                            },
                            win = {
                                list = {
                                    keys = {
                                        ["<BS>"] = "explorer_up", -- backspace: go up
                                        ["u"] = "explorer_up", -- add 'u' like NERDTree
                                        ["-"] = "explorer_up", -- add '-' like netrw
                                    },
                                },
                            },
                        },
                    },
                },
            })
        end,
    },
}
