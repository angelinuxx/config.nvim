-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Unmap <Tab>
unmap({ "i", "v" }, "<Tab>")

-- Move to window using the <ctrl> hjkl keys with tmux navigator integration
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Window", remap = true })

-- Move Lines
unmap({ "i", "v" }, "<A-j>") -- disable dft keymap, norm mode keymap is already overwritten by multiple-cursor plugin
unmap({ "i", "v" }, "<A-k>") -- disable dft keymap, norm mode keymap is already overwritten by multiple-cursor plugin
-- new keymaps
map("n", "<C-S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<C-S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<C-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<C-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<C-S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<C-S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Open current file
map({ "n", "v" }, "<leader>o", ":!xdg-open %<CR>", { desc = "Open current file" })
map(
  "n",
  "<leader>km",
  ":!xdg-open /home/angelinuxx/Dev/Keyboard/Printable_layout_angelinuxx.pdf<CR>",
  { desc = "Open crkbd mapping" }
)

-- Search
map("v", "<leader>/", [[y/\V<C-R>"<CR>]], { desc = "Search selection in cur buffer" })

-- Better viewing
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" }) -- move half page up keeping cursor in the middle
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" }) -- move half page down keeping cursor in the middle

-- Clipboard
map("x", "<leader>p", [["_dP]], { desc = "Paste over selection w/o yank" }) -- paste over selection w/o yank
map("n", "x", [["_x]]) -- single char delete to void register
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system" }) -- yanks to system clipboard
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system" }) -- yanks a line to system clipboard
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void register" }) -- delete to void register

-- Git
map("n", "<leader>gB", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Blame Line" })
map({ "n", "x" }, "<leader>gO", function()
  Snacks.gitbrowse()
end, { desc = "Git Browse (open)" })

-- Change lazy keymap
unmap("n", "<leader>l")
map("n", "<leader>z", "<cmd>Lazy<cr>", { desc = "Lazy" })
