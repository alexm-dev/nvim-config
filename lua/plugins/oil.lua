return {
    {
        "stevearc/oil.nvim",
        dependencies = { { "nvim-mini/mini.icons", opts = {} } },
        lazy = false,
        opts = {
            default_file_explorer = true,
            columns = {
                "icon",
            },
            win_options = {},
            delete_to_trash = true,
            skip_confirm_for_simple_edits = false,
            view_options = {
                show_hidden = true,
            },
            float = {
                padding = { left = 0, right = 1 },
                preview_split = "right",
            },
            preview_win = {
                update_on_cursor_move = true,
                preview_method = "fast_scratch",
            },
            preview = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("oil").setup(opts)
            vim.api.nvim_create_autocmd("User", {
                pattern = "OilEnter",
                callback = function()
                    require("oil").open_preview()
                end,
            })
        end,
    },
}
