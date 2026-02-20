local ts = vim.treesitter
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local M = {}

-- mathzone nodes parsed by treesitter for latex and markdown files
local MATH_NODES = {
  displayed_equation = true,
  inline_formula = true,
  math_environment = true,
}

-- in order for not messy
local TEXT_NODES = {
  text_mode = true,
  label_definition = true,
  label_reference = true,
}

-- decide whether in mathzone
M.in_math = function()
  local node = ts.get_node({ ignore_injections = false })
  while node do
    if TEXT_NODES[node:type()] then
      return false
    elseif MATH_NODES[node:type()] then
      return true
    end
    node = node:parent()
  end
  return false
end

-- nodt in mathzone
M.in_text = function()
  return not M.in_math()
end

-- in text and is line begin
M.in_text_and_line_begin = function()
  return M.in_text() and line_begin()
end

return M

