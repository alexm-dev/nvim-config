vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        -- c: wrap comments using textwidth
        -- r: continue comments after hitting enter
        -- q: allow formatting with "gq"
        -- n: recognize numbered lists
        -- j: remove comment leader when joining lines
        -- 2: use indent of second line of paragraph
        vim.opt_local.formatoptions = "crqnj2"
        vim.opt_local.textwidth = 80
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
