return {
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>la", ":Laravel artisan<cr>" },
      { "<leader>lr", ":Laravel routes<cr>" },
      { "<leader>lm", ":Laravel related<cr>" },
      -- { "<leader>lt", ":Laravel tinker<cr>" },
    },
    event = { "VeryLazy" },
    config = true,
  },
  {
    "ccaglak/larago.nvim", -- laravel go to blade/view/components
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = { { "<leader>lg", ":GoBlade<cr>", desc = "Laravel go to blade" } },
  },
  -- {
  --   "jwalton512/vim-blade",
  -- },
  -- {
  -- adoolaard/nvim-cmp-laravel -- autocomplete for route(' in blade files
  -- }
}
