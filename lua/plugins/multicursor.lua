return {
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {
      match_visible_only = false,
      pre_hook = function()
        vim.cmd "set nocul"
        vim.cmd "NoMatchParen"
        require("nvim-autopairs").disable()
        require("cmp").setup { enabled = false }
      end,
      post_hook = function()
        vim.cmd "set cul"
        vim.cmd "DoMatchParen"
        require("nvim-autopairs").enable()
        require("cmp").setup { enabled = true }
      end,
    }, -- This causes the plugin setup function to be called
    keys = {
      { "<A-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
      { "<A-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

      { "<A-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

      { "<A-c>", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
      { "<A-u>", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = { "n", "x" }, desc = "Add cursors to cword in previous area" },

      { "<A-m>", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Add cursor and jump to next cword" },
      { "<A-s>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },
    },
  },
}
