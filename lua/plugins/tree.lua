return {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeOpen" },
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
                diagnostics = {
                    enable = true,
                    show_on_dirs = true,
                },
                renderer = {
                    icons = {
                        diagnostics_placement = "after",
                    },
                },
            })
        end,
    },
}
