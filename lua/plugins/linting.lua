return {
  {
    "mfussenegger/nvim-lint",
    init = function()
      require("snacks")
        .toggle({
          name = "PHP CS",
          get = function()
            local linters = require("lint").linters_by_ft.php or {}
            for _, l in ipairs(linters) do
              if l == "phpcs" then
                return true -- enabled
              end
            end
            return false -- disabled
          end,
          set = function(enabled)
            local lint = require("lint")
            lint.linters_by_ft.php = lint.linters_by_ft.php or {}
            local had_phpcs = vim.tbl_contains(lint.linters_by_ft.php, "phpcs")

            if enabled then
              if not had_phpcs then
                table.insert(lint.linters_by_ft.php, "phpcs")
              end
            else
              -- remove phpcs
              lint.linters_by_ft.php = vim.tbl_filter(function(l)
                return l ~= "phpcs"
              end, lint.linters_by_ft.php)
            end

            -- refresh all open PHP buffers
            vim.schedule(function()
              local ns = lint.get_namespace("phpcs")
              for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "php" then
                  if not enabled then
                    -- ✅ clear stale diagnostics when disabling
                    vim.diagnostic.reset(ns, buf)
                  end
                  -- Re-run linting so remaining linters (if any) republish
                  vim.api.nvim_buf_call(buf, function()
                    lint.try_lint()
                  end)
                end
              end
            end)
          end,
        })
        :map("<leader>uP")
    end,
  },
}
