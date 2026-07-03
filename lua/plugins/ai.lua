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
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = function()
      return {
        terminal_cmd = vim.env.CLAUDE_CMD or "claude-personal",
      }
    end,
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
      },
      -- Diff handling
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
