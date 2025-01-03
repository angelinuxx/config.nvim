return {
  {
    "github/copilot.vim",
    enabled = false,
    config = function()
      -- vim.api.nvim_set_keymap("i", "<c-space>", 'copilot#Accept("<CR>")', { noremap = true, expr = true, silent = true })
      -- vim.api.nvim_set_keymap("i", "<s-tab>", "<Plug>(copilot-next)", {})
      -- vim.api.nvim_set_keymap("n", "<leader>cp", ":Copilot<CR>", { noremap = true })

      vim.g.copilot_no_tab_map = true
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      -- vim.g.codeium_manual = true
      -- vim.g.codeium_no_map_tab = true
      vim.g.codeium_disable_bindings = 1
      -- Change '<C-g>' here to any keycode you like.
      -- vim.keymap.set('i', '<C-c>', function() return vim.fn['codeium#Complete']() end, { expr = true })
      vim.keymap.set("i", "<C-l>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<C-x>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      -- vim.keymap.set('i', '<c-x>', function( return vim.fn['codeium#Clear']() end, { expr = true })
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        openai_params = {
          max_tokens = 4095,
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
