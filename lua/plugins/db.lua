return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  keys = {
    { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_execute_on_save = 0
  end,
}
