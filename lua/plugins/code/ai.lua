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
      "folke/which-key.nvim", -- optional (I add it to register my keymaps)
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    opts = {
      provider = "openai",
      openai = {
        model = "gpt-4o-mini",
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = false,
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
