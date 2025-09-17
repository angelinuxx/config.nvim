return {
  {
    "Exafunction/codeium.nvim",
    opts = {
      virtual_text = {
        key_bindings = {
          accept = "<C-l>",
          accept_line = "<A-l>",
          accept_word = "<C-w>",
          next = "<C-x>",
          prev = false,
        },
      },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        openai_params = {
          max_tokens = 4095,
          model = "gpt-4o-mini",
        },
      }

      local wk = require "which-key"
      wk.add {
        { "<leader>ac", group = "ChatGPT" },
        { "<leader>acc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
        { "<leader>ace", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
        { "<leader>acg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction", mode = { "n", "v" } },
        { "<leader>act", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
        { "<leader>ack", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
        { "<leader>acd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
        { "<leader>aca", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
        { "<leader>aco", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
        { "<leader>acs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
        { "<leader>acf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
        { "<leader>acx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
        { "<leader>acr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
        {
          "<leader>acl",
          "<cmd>ChatGPTRun code_readability_analysis<CR>",
          desc = "Code Readability Analysis",
          mode = { "n", "v" },
        },
      }
    end,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    ---@class avante.Config
    opts = {
      provider = "openai",
      providers = {
        openai = {
          model = "gpt-4o-mini",
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-mini/mini.icons",
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
        ft = function(_, ft)
          vim.list_extend(ft, { "Avante" })
        end,
      },
    },
  },
}
