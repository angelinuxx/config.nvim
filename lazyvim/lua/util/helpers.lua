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

return M
