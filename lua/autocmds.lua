local required_parsers = {
    "rust",
    "cpp",
    "c",
    "java",
    "cmake",
    "lua",
    "python",
}

local missing = {}
for _, lang in ipairs(required_parsers) do
    if not pcall(vim.treesitter.query.get, lang, "highlights") then
        table.insert(missing, lang)
    end
end

if #missing > 0 then
    vim.notify(
        "Missing native parsers: "
            .. table.concat(missing, ", ")
            .. "\nInstall them via your OS package manager (e.g., pacman or paru).",
        vim.log.levels.WARN
    )
end

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if lang then
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
})

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
