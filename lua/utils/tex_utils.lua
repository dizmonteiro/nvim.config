local tex_utils = {}

-- local MATH_NODES = {
  -- displayed_equation = true,
  -- inline_formula = true,
  -- math_environment = true,
-- }

-- local TEXT_NODES = {
  -- text_mode = true,
  -- label_definition = true,
  -- label_reference = true,
-- }

tex_utils.in_math = function()
  -- This function requires the VimTeX plugin.
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

tex_utils.in_text = function()
  return not tex_utils.in_math()
end

tex_utils.in_text_and_line_begin = function()
  return tex_utils.in_text() and line_begin()
end

return tex_utils