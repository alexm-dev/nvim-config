return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            indent = { char = "│" },
            scope = { enabled = false },
            exclude = {
                filetypes = { "dashboard", "alpha", "starter" },
            },
        },
    },

    {
        "nvim-mini/mini.indentscope",
        version = false,
        event = { "BufReadPost", "BufNewFile" },
        opts = function()
            return {
                symbol = "│",
                draw = {
                    delay = 0,
                    animation = require("mini.indentscope").gen_animation.none(),
                },
                options = { try_as_border = false },
            }
        end,
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "alpha",
                    "dashboard",
                    "fzf",
                    "help",
                    "lazy",
                    "mason",
                    "neo-tree",
                    "notify",
                    "toggleterm",
                    "trouble",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}
