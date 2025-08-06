---@diagnostic disable: missing-fields
return {
  -- Act as a sudo user
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local pattern = vim.fn.expand("~") .. "/notes"
          local cwd = vim.fn.getcwd()
          -- Load plugin if we're under the notes directory
          if cwd:match(pattern) then
            -- Only load once
            if not require("lazy.core.config").plugins["obsidian.nvim"]._.loaded then
              vim.schedule(function()
                require("lazy").load({ plugins = { "obsidian.nvim" } })
              end)
            end
          end
        end,
      })
    end,
    -- Load plugin if we read or create a note under the notes directory
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/notes/*.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/notes/*.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- Optional
      "saghen/blink.cmp",
      "folke/snacks.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
    },
    ---@module 'obsidian'
    ---@type obsidian.config.ClientOpts
    opts = {
      workspaces = {
        { name = "notes", path = "~/notes" },
      },
      daily_notes = {
        folder = "daily",
        template = "templates/Daily note",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {},
      },
      completion = {
        nvim_cmp = false,
        blink = true,
      },
      picker = {
        name = "snacks.pick",
      },
    },
  },
  -- Present markdown files
  {
    "tjdevries/present.nvim",
    cmd = { "PresentStart" },
  },
  {
    "ahmedkhalf/project.nvim",
    enabled = false,
  },
}
