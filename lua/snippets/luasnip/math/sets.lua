local U = require("utils.ts_utils")
-- local U = require("utils.tex_utils")
local in_math = U.in_math
local in_text = U.in_text

return {

  -- common logical and set operations
  s(
    { trig = "!=", desc = "not equal", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\neq") }
  ),
  s(
    { trig = "simm", desc = "similar to", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\sim") }
  ),
  s({
    trig = "prop",
    desc = "proportional to",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\propto") }),
  s({
    trig = "sim=",
    desc = "similarly equal",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\simeq") }),
  s({
    trig = "<=",
    desc = "less than or equal",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\leq") }),
  s({
    trig = ">=",
    desc = "greater than or equal",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\geq") }),
  s({
    trig = "<<",
    desc = "much less than",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\ll") }),
  s({
    trig = ">>",
    desc = "much greater than",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\gg") }),
  s({ trig = "inn", desc = "in", wordTrig = false, snippetType = "autosnippet", condition = in_math }, { t("\\in") }),
  s(
    { trig = "notin", desc = "not in", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\notin") }
  ),
  s(
    { trig = "sst", desc = "subset", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\subset") }
  ),
  s(
    { trig = "uni", desc = "union", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\cup") }
  ),
  s(
    {
      trig = "buni",
      desc = "big union",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\bigcup_{<>}^{<>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s(
    { trig = "its", desc = "intersection", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\cap") }
  ),
  s(
    {
      trig = "bits",
      desc = "big intersection",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\bigcap_{<>}^{<>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s({
    trig = "andd",
    desc = "logical and",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\land") }),
  s(
    { trig = "orr", desc = "logical or", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\lor") }
  ),
  s(
    { trig = "ntt", desc = "logical not", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\neg") }
  ),
  s({
    trig = "\\\\\\",
    desc = "\\setminus",
    wordTrig = false,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\setminus") }),
  s(
    { trig = "sub=", desc = "\\subseteq", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\subseteq") }
  ),
  s(
    { trig = "sup=", desc = "\\supseteq", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\supseteq") }
  ),
  s(
    { trig = "ets", desc = "\\emptyset", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\emptyset") }
  ),
  s(
    { trig = "...", desc = "dots", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\dots") }
  ),
  s(
    { trig = "ooo", desc = "\\infty", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\infty") }
  ),
  s(
    { trig = "mid", desc = "\\mid", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\mid") }
  ),
  s(
    {
      trig = "set",
      desc = "set builder",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\{ <> \\}<>", {
      i(1, "elements"),
      i(0),
    })
  ),
  s(
    { trig = "=>", desc = "implies", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\implies") }
  ),
  s(
    { trig = "<<=", desc = "impliedby", wordTrig = false, snippetType = "autosnippet", condition = in_math },
    { t("\\impliedby") }
  ),
  s({
    trig = "iff",
    desc = "if and only if",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\iff") }),
  s(
    { trig = "fll", desc = "for all", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\forall") }
  ),
  s(
    { trig = "ee", desc = "exists", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\exists") }
  ),
  s(
    { trig = "max", desc = "maximum", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\max") }
  ),
  s(
    { trig = "min", desc = "minimum", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\min") }
  ),
  s(
    { trig = "arg", desc = "\\arg", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\arg") }
  ),
  s(
    { trig = "uds", desc = "\\underset", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    fmta("\\underset{<>}{<>}<>", {
      i(1),
      i(2),
      i(0),
    })
  ),
}
