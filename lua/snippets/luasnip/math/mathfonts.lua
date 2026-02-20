local U = require("utils.ts_utils")
-- local U = require("utils.tex_utils")
local in_math = U.in_math
local in_text = U.in_text

return {

  -- mathematical fonts
  s({
    trig = "bb",
    desc = "blackboard bold",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\mathbb{<>}<>", { i(1), i(0) })),
  s({
    trig = "bf",
    desc = "bold font",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\mathbf{<>}<>", { i(1), i(0) })),
  s({
    trig = "bit",
    desc = "bold italic font",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\mathbfit{<>}<>", { i(1), i(0) })),
  s({
    trig = "bsb",
    desc = "bold symbol",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\boldsymbol{<>}<>", { i(1), i(0) })),
  s({
    trig = "cal",
    desc = "calligraphic font",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\mathcal{<>}<>", { i(1), i(0) })),
  s({
    trig = "fak",
    desc = "Fraktur font",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\mathfrak{<>}<>", { i(1), i(0) })),

  -- special characters and operator names
  s({
    trig = "opn",
    desc = "operator name",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\operatorname{<>}<>", { i(1), i(0) })),
  s(
    { trig = "LL", desc = "Lcal", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\mathcal{L}") }
  ),
  s(
    { trig = "HH", desc = "Hcal", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\mathcal{H}") }
  ),
  s({
    trig = "CC",
    desc = "Complex number set",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\mathbb{C}") }),
  s({
    trig = "RR",
    desc = "Real number set",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\mathbb{R}") }),
  s({
    trig = "NN",
    desc = "Natural number set",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\mathbb{N}") }),
  s({
    trig = "ZZ",
    desc = "Integer number set",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\mathbb{Z}") }),
  s(
    { trig = "PP", desc = "probability", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\mathbb{P}") }
  ),
  s(
    { trig = "Pr", desc = "probability", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\operatorname{Pr}") }
  ),
  s(
    { trig = "EE", desc = "expectation", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\mathbb{E}") }
  ),
  s(
    { trig = "Var", desc = "variance", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\operatorname{Var}") }
  ),
  s(
    { trig = "Cov", desc = "covariance", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\operatorname{Cov}") }
  ),
  s(
    { trig = "Tr", desc = "trace", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\operatorname{tr}") }
  ),
  s(
    { trig = "det", desc = "determinant", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\operatorname{det}") }
  ),

  -- auto-expand math fonts, e.g. Fcal -> \mathcal{F}
  -- note: bb, cal are only for A-Z; bf is for a-z and A-Z; ,. -> boldsymbol for greek and mathbfit for roman
  s(
    {
      trig = "([A-Z0-9])bb",
      desc = "blackboard bold capital letter",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\mathbb{<>}<>", { f(function(_, snip)
      return snip.captures[1]
    end), i(0) })
  ),
  s(
    {
      trig = "([A-Z])cal",
      desc = "calligraphic capital letter",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\mathcal{<>}<>", { f(function(_, snip)
      return snip.captures[1]
    end), i(0) })
  ),
  s(
    {
      trig = "([a-zA-Z0-9])bf",
      desc = "bold font letter",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\mathbf{<>}<>", { f(function(_, snip)
      return snip.captures[1]
    end), i(0) })
  ),
  s(
    {
      trig = "([%\\%a]+),%.",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      desc = "Bold italic symbol",
      condition = in_math,
    },
    fmta("<>{<>}", {
      f(function(_, snip)
        local sym = snip.captures[1]

        if sym:sub(1, 1) == "\\" then
          return "\\boldsymbol"
        else
          return "\\mathbfit"
        end
      end),
      f(function(_, snip)
        return snip.captures[1]
      end),
    })
  ),
}
