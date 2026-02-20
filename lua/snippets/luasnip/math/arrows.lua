local U = require("utils.ts_utils")
-- local U = require("utils.tex_utils")
local in_math = U.in_math
local in_text = U.in_text

return {
  -- arrows
  s(
    { trig = "->", desc = "right arrow", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\to") }
  ),
  s(
    { trig = "<-", desc = "left arrow", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\leftarrow") }
  ),
  -- s({ trig = "<->", desc = "left arrow", wordTrig = true, snippetType = "autosnippet", condition = in_math },
  --   { t("\\leftrightarrow") }),
  s(
    { trig = "up>", desc = "up arrow", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\uparrow") }
  ),
  s(
    { trig = "dn>", desc = "down arrow", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\downarrow") }
  ),
  s(
    { trig = "|>", desc = "mapsto", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\mapsto") }
  ),
  s({
    trig = "~>",
    desc = "squiggly arrow",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\rightsquigarrow") }),
  s({
    trig = "lrt",
    desc = "long right arrow",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\longrightarrow") }),
  s({
    trig = "lft",
    desc = "long left arrow",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, { t("\\longleftarrow") }),
  s(
    { trig = "lmap", desc = "long mapsto", wordTrig = true, snippetType = "autosnippet", condition = in_math },
    { t("\\longmapsto") }
  ),
}
