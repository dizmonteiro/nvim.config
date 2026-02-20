return {
  s(
    { trig = "snipt", wordTrig = true, desc = "trig text snippet" },
    fmta(
      [[
      s({ trig = "<>", wordTrig = <>, regTrig = <>, desc = "<>", snippetType = "<>", condition = <> },
        { t("<>") },
      ),<>
      ]],
      {
        i(1, "trig"),
        i(2, "true"),
        i(3, "false"),
        i(4, "snippet desc"),
        i(5, "autosnippet"),
        i(6, "in_math"),
        i(7, "snippet body"),
        i(0),
      }
    )
  ),
  s(
    { trig = "tsutil", wordTrig = true, desc = "inject tsutils for detect latex math" },
    fmta("local U = require('utils.ts_utils')\nlocal in_math = U.in_math\nlocal in_text = U.in_text<>", i(1))
  ),
  s(
    { trig = "snipf", wordTrig = true, desc = "trig fmta snippet" },
    fmta(
      [[
      s({ trig = "<>", wordTrig = <>, regTrig = <>, desc = "<>", snippetType = "<>", condition = <> },
        { fmta(
          "<>",
          {<>}
        ) },
      ),<>
      ]],
      {
        i(1, "trig words"),
        i(2, "true"),
        i(3, "false"),
        i(4, "snippet desc"),
        i(5, "autosnippet"),
        i(6, "in_math"),
        i(7, "snippet body"),
        i(8, "snippet nodes"),
        i(0),
      }
    )
  ),
}
