vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.opt_local.formatoptions = "crqnj2"
        vim.opt_local.textwidth = 100
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_user_command("S", function(opts)
    if opts.args == "" then
        Snacks.picker()
    else
        Snacks.picker.pick(opts.args)
    end
end, {
    nargs = "?",
    complete = function()
        return vim.tbl_keys(require("snacks.picker.config.sources"))
    end,
})
