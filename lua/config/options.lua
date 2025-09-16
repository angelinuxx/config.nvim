-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Do not sync with system clipboard
vim.opt.clipboard = ""

-- do not use the completion engine for AI suggestions
vim.g.ai_cmp = false

-- disable animations
vim.g.snacks_animate = false

-- disable autopairs
vim.g.minipairs_disable = true

-- keep at least 8 lines from the edges
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

-- print limit at 120
vim.opt.colorcolumn = "120"

-- Change php lsp to intellephense
-- vim.g.lazyvim_php_lsp = "intelephense"

-- disable spell
vim.opt.spell = false
