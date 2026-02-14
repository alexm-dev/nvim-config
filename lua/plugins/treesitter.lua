return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "json",
                "lua",
                "luadoc",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "rust",
                "toml",
                "yaml",
            },
        },
        config = function(_, opts)
            local ts = require("nvim-treesitter")

            ts.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            for _, lang in ipairs(opts.ensure_installed) do
                local has_parser = pcall(vim.treesitter.language.add, lang)
                if not has_parser then
                    ts.install(lang)
                end
            end

            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
                callback = function(ev)
                    local lang = vim.treesitter.language.get_lang(ev.match)
                    if not lang then
                        return
                    end

                    if vim.treesitter.query.get(lang, "highlights") then
                        vim.treesitter.start(ev.buf)
                    end

                    if vim.treesitter.query.get(lang, "indents") then
                        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
}
