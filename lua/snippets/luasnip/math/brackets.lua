local U = require("utils.ts_utils")
-- local U = require("utils.tex_utils")
local in_math = U.in_math
local in_text = U.in_text

return {

  -- brackets, like (, [, \{, \langle, \lvert, \lVert, should be wrapped with \left ... \right
  s({
    trig = "lr)",
    desc = "adjusted ( )",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\left( <> \\right)<>", { i(1), i(0) })),
  s({
    trig = "lr]",
    desc = "adjusted [ ]",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\left[ <> \\right]<>", { i(1), i(0) })),
  s({
    trig = "lr}",
    desc = "adjusted \\{ \\}",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\left\\{ <> \\right\\}<>", { i(1), i(0) })),
  s({
    trig = "inp",
    desc = "inner product",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\left\\langle <> \\right\\rangle<>", { i(1), i(0) })),
  s({
    trig = "norm",
    desc = "norm",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\left\\lvert <> \\right\\rvert<>", { i(1), i(0) })),
  s({
    trig = "Norm",
    desc = "Norm",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\left\\lVert <> \\right\\rVert<>", { i(1), i(0) })),
}
