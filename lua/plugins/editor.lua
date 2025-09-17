-- Provides functionality like a file explorer, search and replace, fuzzy finding, git integration
return {
  { "christoomey/vim-tmux-navigator" }, -- tmux & split window navigation
  {
    "stevearc/oil.nvim",
    -- @module 'oil'
    -- @type oil.SetupOpts
    opts = {
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-s>"] = false,
        ["<C-r>"] = "actions.refresh",
      },
    },
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open File Explorer" },
    },
  },
  -- Certer buffer
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      width = 130,
    },
    keys = {
      { "<leader>uN", "<cmd>NoNeckPain<CR>", desc = "Center buffer" },
    },
  },
  -- Modify buffer using multiple-cursors
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {
      match_visible_only = false,
      custom_key_maps = {
        { -- WARN: not working properly
          "n",
          "gsr",
          function(_, count, motion_cmd, char)
            vim.cmd("normal " .. count .. "gsr" .. motion_cmd .. char)
          end,
          "mc",
        },
      },
      pre_hook = function()
        vim.cmd "set nocul"
        vim.cmd "NoMatchParen"
        -- TODO: disable blink
        -- require("cmp").setup({ enabled = false })
      end,
      post_hook = function()
        vim.cmd "set cul"
        vim.cmd "DoMatchParen"
        -- TODO: enable blink
        -- require("cmp").setup({ enabled = true })
      end,
    }, -- This causes the plugin setup function to be called
    keys = {
      { "<A-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
      { "<A-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

      { "<A-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

      { "<A-c>", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
      {
        "<A-u>",
        "<Cmd>MultipleCursorsAddMatchesV<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to cword in previous area",
      },

      {
        "<A-m>",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor and jump to next cword",
      },
      { "<A-s>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },
    },
  },
  {
    "f-person/git-blame.nvim",
    opts = {
      enabled = false, -- disable by default
    },
    keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Git Blame Virtual Text" } },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>k", group = "Keyboard", icon = "" },
        { "<leader>r", group = "Requests", icon = "󱂛" },
        { "<leader>N", group = "NpmLens", icon = "󰛷" },
        { "<leader>l", group = "Laravel", icon = "󰫐" },
        { "<leader>j", group = "JSON sort", icon = "" },
        { "<leader>a", group = "AI Tools", icon = "󱚣" },
      },
    },
  },
}
