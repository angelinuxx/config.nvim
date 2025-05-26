-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys with tmux navigator integration
map("n", "<C-h>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Window", remap = true })
