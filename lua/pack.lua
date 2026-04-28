vim.pack.add({
    { src = "https://github.com/vague-theme/vague.nvim" },
    { src = "https://github.com/nvimdev/dashboard-nvim" },
    { src = "https://github.com/saghen/blink.lib" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
    { src = "https://github.com/Kicamon/markdown-table-mode.nvim" },
    { src = "https://github.com/catgoose/nvim-colorizer.lua" },
    { src = "https://github.com/saecki/crates.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/MagicDuck/grug-far.nvim" },
    { src = "https://github.com/folke/trouble.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
})

require("vague").setup({ transparent = true })
vim.cmd("colorscheme vague")

require("blink.cmp").setup({
    keymap = {
        preset = "super-tab",
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-q>"] = { "show_documentation" },
    },
    completion = {
        documentation = { auto_show = false },
        ghost_text = { enabled = false },
    },
    fuzzy = { implementation = "lua" },
})

require("tree-sitter-manager").setup({
    ensure_installed = { "rust", "json", "xml", "toml", "java", "lua", "cmake", "cpp", "c", "python" }

})

_G.Snacks = require("snacks")
Snacks.setup({
    explorer = { enabled = true },
    notifier = { enabled = true },
    picker = {
        enabled = true,
        layouts = {
            base_picker = {
                layout = {
                    box = "horizontal",
                    backdrop = 60,
                    width = 0.8,
                    height = 0.8,
                    {
                        box = "vertical",
                        border = "rounded",
                        title = "{title} {live} {flags}",
                        { win = "list",  border = "none" },
                        { win = "input", height = 1,     border = "top" },
                    },
                    {
                        win = "preview",
                        title = "{preview}",
                        border = "rounded",
                        width = 0.5,
                    },
                },
            },
            sidebar_no_input = {
                layout = {
                    position = "right",
                    width = 35,
                    box = "vertical",
                    { win = "list", border = "none" },
                },
            },
        },
        layout = { preset = "base_picker" },
        sources = {
            explorer = {
                layout = { preset = "sidebar_no_input" },
                focus = "list",
            },
        },
    },
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        python = { "black" },
    },

    format_on_save = function(bufnr)
        local name = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr))

        if name:match("keymap%.lua") or name:match("init%.lua") then
            return nil
        end
        return {
            timeout_ms = 5000,
            lsp_fallback = true,
        }
    end,

    timeout_ms = 5000,
})

require("gitsigns").setup({
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = { interval = 1000, follow_files = true },
    attach_to_untracked = true,
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 1000,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    max_file_length = 40000,
    preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
})

local custom_theme = require("lualine.themes.auto")
custom_theme.insert = custom_theme.normal
custom_theme.visual = custom_theme.normal
custom_theme.replace = custom_theme.normal
custom_theme.command = custom_theme.normal

require("lualine").setup({
    options = {
        theme = custom_theme,
        icons_enabled = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = {}, winbar = {} },
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = { statusline = 1000, tabline = 1000, winbar = 1000, refresh_time = 16 },
    },
    sections = {
        lualine_a = { { "filename", path = 1 } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
})

require("crates").setup({
    lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
    },
})

require("nvim-autopairs").setup({ disable_filetype = { "FzfLua", "vim" } })
require("colorizer").setup({ "*" })
require("render-markdown").setup({})
require("markdown-table-mode").setup()
require("grug-far").setup({})
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "jdtls",
        "lua_ls",
        "rust_analyzer",
        "pyright",
        "stylua",
    },
})
require("trouble").setup({})
require("which-key").setup({})

local logo = [[
███▄▄▄▄      ▄████████  ▄██████▄   ▄█    █▄   ▄█    ▄▄▄▄███▄▄▄▄
███▀▀▀██▄   ███    ███ ███    ███ ███    ███ ███  ▄██▀▀▀███▀▀▀██▄
███   ███   ███    █▀  ███    ███ ███    ███ ███▌ ███   ███   ███
███   ███  ▄███▄▄▄     ███    ███ ███    ███ ███▌ ███   ███   ███
███   ███ ▀▀███▀▀▀     ███    ███ ███    ███ ███▌ ███   ███   ███
███   ███   ███    █▄  ███    ███ ███    ███ ███  ███   ███   ███
███   ███   ███    ███ ███    ███ ███    ███ ███  ███   ███   ███
 ▀█   █▀    ██████████  ▀██████▀   ▀██████▀  █▀    ▀█   ███   █▀
            ]]

logo = string.rep("\n", 8) .. logo .. "\n\n"
local header_line = vim.split(logo, "\n")
local picker = Snacks.picker
local dashboard_opts = {
    theme = "doom",
    hide = { statusline = false },
    config = {
        header = header_line,
        center = {
            {
                action = function()
                    picker.files()
                end,
                desc = " Find File",
                icon = " ",
                key = "f",
            },
            {
                action = function()
                    picker.recent()
                end,
                desc = " Recent Files",
                icon = " ",
                key = "r",
            },
            {
                action = function()
                    picker.grep()
                end,
                desc = " Find Text",
                icon = " ",
                key = "g",
            },
            {
                action = function()
                    picker.files({ cwd = vim.fn.stdpath("config") })
                end,
                desc = " Config",
                icon = " ",
                key = "c",
            },
            {
                action = function()
                    vim.api.nvim_input("<cmd>qa<cr>")
                end,
                desc = " Quit",
                icon = " ",
                key = "q",
            },
        },
    },
}

for _, button in ipairs(dashboard_opts.config.center) do
    button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    button.key_format = "  %s"
end

require("dashboard").setup(dashboard_opts)
