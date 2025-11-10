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

                is_always_hidden = function(name, bufnr)
                    local hidden_names = {
                        ".DS_Store",
                        "thumbs.db",
                        "All Users",
                        "Default User",
                        "desktop.ini",
                        "$Recycle.Bin",
                        "Documents and Settings",
                        "Recovery",
                        "History",
                        "Temporary Internet Files",
                    }
                    for _, hidden_name in ipairs(hidden_names) do
                        if name == hidden_name then
                            return true
                        end
                    end

                    if name:match("%.sys$") then
                        return true
                    end

                    if name:match("%.lnk$") then
                        return true
                    end

                    if name:match("%.db$") then
                        return true
                    end

                    if name:lower():match("^ntuser%..*$") then
                        return true
                    end

                    local ok, stat = pcall(vim.loop.fs_lstat, vim.fn.expand(vim.fn.getcwd() .. "/" .. name))
                    if ok and stat and stat.type == "link" then
                        return true
                    end
                end,
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
