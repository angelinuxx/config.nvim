return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdr", "<cmd>DiffviewFileHistory<cr>", desc = "Git diff history" },
      { "<leader>gdb", "<cmd>DiffviewFileHistory %<cr>", desc = "Git diff history for current buffer" },
      { "<leader>gdq", "<cmd>DiffviewClose<cr>", desc = "Git diff close" },
    },
    config = function()
      vim.opt.fillchars:append "diff:╱"
      require("diffview").setup {}
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "f-person/git-blame.nvim",
    keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Git Blame" } },
    config = function()
      require("gitblame").setup { enabled = false }

      -- ({
      --   enable = true,
      --   prefix = " ",
      --   formatter = function (name, blame_info)
      --     if blame_info.author == name then
      --       blame_info.author = "You"
      --     end
      --     local text = string.format(" %s, %s - %s", blame_info.author, blame_info.summary, blame_info.date)
      --     return { text, "GitBlame" }
      --   end,
      --   use_internal_diff = true,
      -- })
    end,
  },
}
