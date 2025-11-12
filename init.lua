-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Colorscheme
-- require("config.highlights")
vim.highlight.priorities.semantic_tokens = 94

-- Enable PowerShell terminal integration
require("config.pwsh")
