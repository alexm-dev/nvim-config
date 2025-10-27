return {
    {
        "zbirenbaum/copilotot.lua",
        dependencies = {
            "copliotlsp-nvim/copilot-lsp",
        },
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true
                },
                panel = {
                    enabled = true,
                }
            })
        end,
    },
}
