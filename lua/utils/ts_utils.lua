local ts = vim.treesitter
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local M = {}

local MATH_NODES = {
  displayed_equation = true,
  inline_formula = true,
  math_environment = true,
}

local TEXT_NODES = {
  text_mode = true,
  label_definition = true,
  label_reference = true,
}

local function current_node()
  local lang = ts.language.get_lang(vim.bo.filetype)
  if not lang or not ts.language.add(lang) then
    return nil
  end

  local ok, node = pcall(ts.get_node, { ignore_injections = false })
  if ok then
    return node
  end

  return nil
end

local function vimtex_in_math()
  if vim.bo.filetype ~= "tex" or vim.fn.exists("*vimtex#syntax#in_mathzone") ~= 1 then
    return nil
  end

  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

M.in_math = function()
  local node = current_node()
  while node do
    if TEXT_NODES[node:type()] then
      return false
    elseif MATH_NODES[node:type()] then
      return true
    end

    node = node:parent()
  end

  local in_tex_math = vimtex_in_math()
  if in_tex_math ~= nil then
    return in_tex_math
  end

  return false
end

M.in_text = function()
  return not M.in_math()
end

M.in_text_and_line_begin = function()
  return M.in_text() and line_begin()
end

return M
