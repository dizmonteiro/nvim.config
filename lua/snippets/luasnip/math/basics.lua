local U = require("utils.ts_utils")
-- local U = require("utils.tex_utils")
local in_text = U.in_text
local in_math = U.in_math
-- local in_text_and_line_begin = U.in_text_and_line_begin

return {
  -- general math environments
  s(
    { trig = "mk", desc = "Inline Math", wordTrig = true, snippetType = "autosnippet", condition = in_text },
    fmta("$<>$<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "dm",
      desc = "Display Math",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_text,
    },
    fmta("$$\n<>\n$$<>", {
      i(1),
      i(0),
    })
  ),
  s(
    {
      trig = "lm",
      desc = "Display Math One line",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_text,
    },
    fmta("$$ <> $$<>", {
      i(1),
      i(0),
    })
  ),
  -- Greek letters
  s({ trig = "alpha", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\alpha") }),
  s({ trig = "beta", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\beta") }),
  s({ trig = "gamma", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\gamma") }),
  s({ trig = "delta", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\delta") }),
  s({ trig = "epsilon", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\epsilon") }),
  s({ trig = "zeta", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\zeta") }),
  s({ trig = "eta", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\eta") }),
  s({ trig = "ell", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\ell") }),
  s({ trig = "theta", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\theta") }),
  s({ trig = "iota", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\iota") }),
  s({ trig = "kappa", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\kappa") }),
  s({ trig = "lambda", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\lambda") }),
  s({ trig = "mu", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\mu") }),
  s({ trig = "nu", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\nu") }),
  s({ trig = "xi", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\xi") }),
  s({ trig = "omicron", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\omicron") }),
  s({ trig = "pi", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\pi") }),
  s({ trig = "rho", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\rho") }),
  s({ trig = "sigma", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\sigma") }),
  s({ trig = "tau", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\tau") }),
  s({ trig = "upsilon", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\upsilon") }),
  s({ trig = "phi", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\phi") }),
  s({ trig = "chi", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\chi") }),
  s({ trig = "psi", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\psi") }),
  s({ trig = "omega", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\omega") }),
  s({ trig = "@a", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\alpha") }),
  s({ trig = "@b", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\beta") }),
  s({ trig = "@g", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\gamma") }),
  s({ trig = "@G", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\Gamma") }),
  s({ trig = "@d", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\delta") }),
  s({ trig = "@D", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\Delta") }),
  s({ trig = "@e", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\epsilon") }),
  s({ trig = "@ve", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\varepsilon") }),
  s({ trig = "@z", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\zeta") }),
  s({ trig = "@t", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\theta") }),
  s({ trig = "@T", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\Theta") }),
  s({ trig = "@vt", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\vartheta") }),
  s({ trig = "@s", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\sigma") }),
  s({ trig = "@S", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\Sigma") }),
  s({ trig = "@vs", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\varsigma") }),
  s({ trig = "@i", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\iota") }),
  s({ trig = "@k", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\kappa") }),
  s({ trig = "@l", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\lambda") }),
  s({ trig = "@L", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\Lambda") }),
  s({ trig = "@u", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\upsilon") }),
  s({ trig = "@U", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\Upsilon") }),
  s({ trig = "@o", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\omega") }),
  s({ trig = "@O", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\Omega") }),
  s({ trig = "@vp", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\varphi") }),

  -- text environments
  s(
    { trig = "txt", desc = "\\text{}", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    fmta("\\text{<>}<>", { i(1), i(0) })
  ),
  s({
    trig = "tcl",
    desc = "\\textcolor{}{}",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\textcolor{<>}{<>}<>", { i(1), i(2), i(0) })),

  -- super- and subscripts
  s(
    {
      trig = "__",
      desc = "Subscript",
      wordTrig = false,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("_{<>}<>", {
      i(1),
      i(0),
    })
  ),
  s({
    trig = "^^",
    desc = "Superscript",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("^{<>}<>", { i(1), i(0) })),
  s({
    trig = "rd",
    desc = "Superscript",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("^{<>}<>", { i(1), i(0) })),

  -- elementary math operations
  s(
    { trig = "sq", desc = "square", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    fmta("^{2}<>", { i(0) })
  ),
  s(
    { trig = "cb", desc = "cube", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    fmta("^{3}<>", { i(0) })
  ),
  s(
    { trig = "coj", desc = "star", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    fmta("^{\\star}<>", { i(0) })
  ),
  s(
    { trig = "sr", desc = "square root", snippetType = "autosnippet", condition = in_math },
    fmta("\\sqrt{<>}<>", { i(1), i(0) })
  ),
  s({ trig = "invs", desc = "inversion", snippetType = "autosnippet", condition = in_math }, fmta("^{-1}<>", { i(0) })),
  s(
    { trig = "exp", desc = "exponential", snippetType = "autosnippet", condition = in_math },
    fmta("\\exp(<>)<>", { i(1), i(0) })
  ),
  s(
    { trig = "lnn", desc = "natural logarithm", snippetType = "autosnippet", condition = in_math },
    fmta("\\ln <>", { i(0) })
  ),
  s({ trig = "log", desc = "logarithm", snippetType = "autosnippet", condition = in_math }, fmta("\\log <>", { i(0) })),
  s(
    { trig = "ff", desc = "fraction", snippetType = "autosnippet", condition = in_math },
    fmta("\\frac{<>}{<>}<>", { i(1), i(2), i(0) })
  ),
  s(
    { trig = "sum", desc = "summation", snippetType = "autosnippet", condition = in_math },
    fmta("\\sum_{<>}^{<>}<>", { i(1), i(2), i(0) })
  ),
  s(
    { trig = "suminline", desc = "summation Inline", snippetType = "snippet", condition = in_math },
    fmta("\\suminline_{<>}^{<>}<>", { i(1), i(2), i(0) })
  ),
  s(
    { trig = "prod", desc = "production", snippetType = "autosnippet", condition = in_math },
    fmta("\\prod_{<>}^{<>}<>", { i(1), i(2), i(0) })
  ),
  s(
    { trig = "+-", desc = "plus minus", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\pm") }
  ),
  s(
    { trig = "-+", desc = "minus plus", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\mp") }
  ),
  s(
    { trig = "nab", desc = "\\nabla", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\nabla") }
  ),
  s(
    { trig = "xx", desc = "\\times", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\times") }
  ),
  s(
    { trig = "ox", desc = "\\otimes", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\otimes") }
  ),
  s(
    { trig = "**", desc = "\\cdot", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\cdot") }
  ),
  s(
    { trig = "===", desc = "\\equiv", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\equiv") }
  ),
  s(
    { trig = ";=", desc = "align equal", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("&=") }
  ),
}
