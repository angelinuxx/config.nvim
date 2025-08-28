M = {}

--- Checks if a table of strings contains a value
---@param tab string[]
---@param val string
M.has_value = function(tab, val)
  for _, value in pairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

--- Checks if project has phpcs.xml(.dist)
M.has_phpcs_ruleset = function()
  local cwd = vim.fn.getcwd()
  return vim.fn.filereadable(cwd .. "/phpcs.xml") == 1 or vim.fn.filereadable(cwd .. "/phpcs.xml.dist") == 1
end

return M
