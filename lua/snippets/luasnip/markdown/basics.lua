return {
  s({ trig = "tit", desc = "markdown italic" }, fmta("*<>*<>", { i(1), i(0) })),
  s({ trig = "tbf", desc = "markdown bold" }, fmta("**<>**<>", { i(1), i(0) })),
  s(
    { trig = "callout", desc = "markdown callout" },
    fmt("> [!{}]{}\n> {}", {
      i(1),
      i(2),
      i(0),
    })
  ),
  s(
    { trig = "preamble", desc = "markdown yaml preamble" },
    fmt(
      "---\nauthor: {}\ndate: {}\ntitle: {}\n---\n{}",
      { i(1, "Jincheng Jiang"), i(2, os.date("%Y-%m-%d")), i(3), i(0) }
    )
  ),
}
