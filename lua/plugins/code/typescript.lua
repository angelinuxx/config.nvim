return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = "VeryLazy",
  keys = {
    { "<leader>TR", vim.cmd.TSToolsRenameFile, desc = "[TSTools] Rename file" },
    { "<leader>Ti", vim.cmd.TSToolsAddMissingImports, desc = "[TSTools] Add missing imports" },
    { "<leader>Tr", vim.cmd.TSToolsRemoveUnusedImports, desc = "[TSTools] Remove unused imports" },
  },
  opts = {
    settings = {
      tsserver_plugins = {
        -- for TypeScript v4.9+
        "@styled/typescript-styled-plugin",
        -- or for older TypeScript versions
        -- "typescript-styled-plugin",,
      },
    },
  },
}
