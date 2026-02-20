local U = require("utils.ts_utils")
-- local U = require("utils.tex_utils")
local in_math = U.in_math
local in_text = U.in_text

local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {

  -- upper and lower structures, like underline, overline, (wide)hat, (wide)tilde, vec, etc.
  s({
    trig = "und",
    desc = "underline",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\underline{<>}<>", { i(1), i(0) })),
  s({
    trig = "bar",
    desc = "overline",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\overline{<>}<>", { i(1), i(0) })),
  s({
    trig = "hat",
    desc = "hat",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\hat{<>}<>", { i(1), i(0) })),
  s({
    trig = "what",
    desc = "widehat",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\widehat{<>}<>", { i(1), i(0) })),
  s({
    trig = "tld",
    desc = "tilde",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\tilde{<>}<>", { i(1), i(0) })),
  s({
    trig = "wtd",
    desc = "widetilde",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\widetilde{<>}<>", { i(1), i(0) })),
  s({
    trig = "vec",
    desc = "vector",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\vec{<>}<>", { i(1), i(0) })),
  s({
    trig = "dot",
    desc = "dot",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\dot{<>}<>", { i(1), i(0) })),
  s({
    trig = "ddot",
    desc = "double dot",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\ddot{<>}<>", { i(1), i(0) })),

  -- snippets with visual selection
  -- s(
  --   {
  --     trig = "tit",
  --     desc = "selection -> textit",
  --     wordTrig = true,
  --     snippetType = "autosnippet",
  --     condition = in_text,
  --   },
  --   fmta("\\textit{<>}<>", {
  --     d(1, get_visual),
  --     i(0),
  --   })
  -- ),
  -- s(
  --   {
  --     trig = "tbf",
  --     desc = "selection -> textbf",
  --     wordTrig = true,
  --     snippetType = "autosnippet",
  --     condition = in_text,
  --   },
  --   fmta("\\textbf{<>}<>", {
  --     d(1, get_visual),
  --     i(0),
  --   })
  -- ),
  s(
    {
      trig = "clr",
      desc = "selection -> textcolor",
      wordTrig = true,
      snippetType = "autosnippet",
      -- condition = in_text
    },
    fmta("\\textcolor{<>}{<>}<>", {
      i(1, "color"),
      d(2, get_visual),
      i(0),
    })
  ),
  s(
    {
      trig = "ubc",
      desc = "selection -> underbrace",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\underbrace{<>}_{<>}<>", {
      d(1, get_visual),
      i(2, "comment"),
      i(0),
    })
  ),
  s(
    {
      trig = "obc",
      desc = "selection -> overbrace",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\overbrace{<>}^{<>}<>", {
      d(1, get_visual),
      i(2, "comment"),
      i(0),
    })
  ),
  s(
    {
      trig = "))",
      desc = "visual -> ( )",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\left( <> \\right)<>", {
      d(1, get_visual),
      i(0),
    })
  ),
  s(
    {
      trig = "]]",
      desc = "visual -> [ ]",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\left[ <> \\right]<>", {
      d(1, get_visual),
      i(0),
    })
  ),
  s(
    {
      trig = "}}",
      desc = "visual -> { }",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\left\\{ <> \\right\\}<>", {
      d(1, get_visual),
      i(0),
    })
  ),
}
