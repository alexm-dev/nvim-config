return {
    {
        "kawre/leetcode.nvim",
        cmd = { "Leet" },
        dependencies = {
            "folke/snacks.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            lang = "cpp",
            ui = { picker = "snacks" },
        },
    }
}
