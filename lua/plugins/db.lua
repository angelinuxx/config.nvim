return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      -- Enable connection via ssh tunnel
      "pbogut/vim-dadbod-ssh",
    },
    init = function()
      local data_path = vim.fn.stdpath "data"

      -- Custom save location
      vim.g.db_ui_save_location = vim.fn.stdpath "config" .. "/dadbod_connections"

      -- ==========================================
      -- LazyVim defaults
      -- ==========================================
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_use_nvim_notify = true

      vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
    end,
  },
}
