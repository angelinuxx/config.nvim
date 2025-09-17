-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_del_augroup_by_name "lazyvim_wrap_spell"

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("angelinuxx_wrap_spell", { clear = true }),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    local has_value = require("util.helpers").has_value
    local no_dft_spell = { "text", "plaintex", "markdown" }
    if not has_value(no_dft_spell, vim.bo.filetype) then
      vim.opt_local.spell = true
    end
  end,
})

-- Autorefresh plantuml preview buffer
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.puml", "*.uml", "*.plantuml" },
  callback = function()
    local file = vim.fn.expand "%:p"
    local output = file:gsub("%.%w+$", ".png")
    -- vim.notify("PlantUML autocmd, src " .. file .. ", out " .. output, "info")

    local cmd = string.format("plantuml.jar %s", vim.fn.shellescape(file))
    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- vim.notify("PlantUML autocmd done, src " .. file .. ", out " .. output, "info")
        vim.schedule(function()
          -- reload buffer if it's already open
          if vim.fn.bufexists(output) == 1 then
            vim.cmd("checktime " .. output)
          end
        end)
      end,
    })
  end,
})
