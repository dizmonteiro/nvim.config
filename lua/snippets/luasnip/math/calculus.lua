local U = require("utils.ts_utils")
-- local U = require("utils.tex_utils")
local in_math = U.in_math
local in_text = U.in_text

return {

  -- calculus
  s(
    {
      trig = "int",
      desc = "integral",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\int_{<>}^{<>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s(
    { trig = "dd", desc = "long mapsto", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\operatorname{d}") }
  ),
  s(
    {
      trig = "limto",
      desc = "limit symbol",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\lim_{<> \\to <>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s(
    {
      trig = "limup",
      desc = "up limit symbol",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\lim_{<> \\uparrow <>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s(
    {
      trig = "limdn",
      desc = "down limit symbol",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\lim_{<> \\downarrow <>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s(
    {
      trig = "plim",
      desc = "probability limit symbol",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("p\\lim_{<> \\to <>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s({
    trig = "part",
    desc = "partial derivative",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\partial") }),
}
