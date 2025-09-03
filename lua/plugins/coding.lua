-- Faster coding with features such as snippets, autocompletion, and more.
return {
  -- Completion
  {
    "saghen/blink.cmp",
    dependencies = {
      "moyiz/blink-emoji.nvim",
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = {
          "emoji",
        },
        providers = {
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15, -- Tune by preference
            opts = {
              insert = true, -- Insert emoji (default) or complete its name
              -- stylua: ignore
              ---@type string|table|fun():table
              trigger = function()
                return { ":" }
              end,
            },
            -- should_show_items = function()
            --   return vim.tbl_contains(
            --     -- Enable emoji completion only for git commits and markdown.
            --     -- By default, enabled for all file-types.
            --     { "gitcommit", "markdown" },
            --     vim.o.filetype
            --   )
            -- end,
          },
          laravel = {
            name = "laravel",
            module = "blink.compat.source",
            score_offset = 95, -- show at a higher priority than lsp
          },
        },
      },
      completion = {
        list = {
          selection = {
            preselect = false,
          },
        },
      },
      keymap = {
        preset = "none",
        -- Disable default keymaps defined in config function from LazyVim
        ["<Tab>"] = {},

        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<C-n>"] = { "snippet_forward", "fallback" },
        ["<C-p>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-j>"] = { "select_next", "fallback_to_mappings" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
      },
      fuzzy = {
        sorts = {
          "exact", -- Always prioritize exact matches
          "score",
          "sort_text",
        },
      },
    },
  },
  {
    "adalessa/laravel.nvim",
    dependencies = {
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-neotest/nvim-nio",
      "kevinhwang91/promise-async",
    },
    cmd = { "Laravel" },
    -- stylua: ignore
    keys = {
        { "<leader>ll", function() Laravel.pickers.laravel() end,              desc = "Laravel: Open Laravel Picker" },
        { "<c-g>",      function() Laravel.commands.run("view:finder") end,    desc = "Laravel: Open View Finder" },
        { "<leader>la", function() Laravel.pickers.artisan() end,              desc = "Laravel: Open Artisan Picker" },
        { "<leader>lt", function() Laravel.commands.run("actions") end,        desc = "Laravel: Open Actions Picker" },
        { "<leader>lr", function() Laravel.pickers.routes() end,               desc = "Laravel: Open Routes Picker" },
        { "<leader>lh", function() Laravel.run("artisan docs") end,            desc = "Laravel: Open Documentation" },
        { "<leader>lm", function() Laravel.pickers.make() end,                 desc = "Laravel: Open Make Picker" },
        { "<leader>lc", function() Laravel.pickers.commands() end,             desc = "Laravel: Open Commands Picker" },
        { "<leader>lo", function() Laravel.pickers.resources() end,            desc = "Laravel: Open Resources Picker" },
        { "<leader>lp", function() Laravel.commands.run("command_center") end, desc = "Laravel: Open Command Center" },
        {
        "gf",
        function()
            local ok, res = pcall(function()
            if Laravel.app("gf").cursorOnResource() then
                return "<cmd>lua Laravel.commands.run('gf')<cr>"
            end
            end)
            if not ok or not res then
            return "gf"
            end
            return res
        end,
        expr = true,
        noremap = true,
        },
    },
    event = { "VeryLazy" },
    opts = {
      lsp_server = "phpactor",
      features = {
        pickers = {
          provider = "snacks",
        },
      },
    },
  },
  {
    "angelinuxx/npm-lens.nvim",
    keys = {
      { "<leader>Nt", "<cmd>NpmLensToggle<cr>", desc = "Toggle NpmLens" },
      { "<leader>Nr", "<cmd>NpmLensRefresh<cr>", desc = "Refresh NpmLens" },
    },
  },
}
