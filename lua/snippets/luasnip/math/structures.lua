if true then
  return {}
end

local U = require("utils.ts_utils")
local in_math = U.in_math
local in_text = U.in_text

local function cases_rows(args)
  local n = tonumber(args[1][1]) or 1
  local nodes = {}

  for k = 1, n do
    table.insert(
      nodes,
      fmta("<> & <> \\\\", {
        i(2 * k - 1, "expr"),
        i(2 * k, "cond"),
      })
    )
  end

  return sn(nil, nodes)
end

local function matrix_cells(args)
  local rows = tonumber(args[1][1]) or 1
  local cols = tonumber(args[2][1]) or 1

  local nodes = {}
  local idx = 1

  for r = 1, rows do
    local row_nodes = {}

    for c = 1, cols do
      table.insert(row_nodes, i(idx, "0"))
      idx = idx + 1

      if c < cols then
        table.insert(row_nodes, t(" & "))
      end
    end

    if r < rows then
      table.insert(row_nodes, t(" \\\\"))
      table.insert(row_nodes, t("\n"))
    end

    table.insert(nodes, sn(nil, row_nodes))
  end

  return sn(nil, nodes)
end

return {

  -- begin ... end structures
  s(
    {
      trig = "beg",
      desc = "begin ... end environment",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_text,
    },
    fmta("\\begin{<>}\n<>\n\\end{<>}<>", {
      i(1, "environment"),
      i(2),
      rep(1),
      i(0),
    })
  ),
  s({
    trig = "bals",
    desc = "begin ... end align*",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_text,
  }, fmta("\\begin{align*}\n<>\n\\end{align*}<>", { i(1), i(0) })),
  s({
    trig = "bald",
    desc = "begin ... end aligned",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_math,
  }, fmta("\\begin{aligned}\n<>\n\\end{aligned}<>", { i(1), i(0) })),
  s({
    trig = "baln",
    desc = "begin ... end align",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_text,
  }, fmta("\\begin{align}\n<>\n\\end{align}<>", { i(1), i(0) })),
  s({
    trig = "beqn",
    desc = "begin ... end equation",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_text,
  }, fmta("\\begin{equation}\n<>\n\\end{equation}<>", { i(1), i(0) })),
  s({
    trig = "beqs",
    desc = "begin ... end equation*",
    wordTrig = true,
    snippetType = "autosnippet",
    condition = in_text,
  }, fmta("\\begin{equation*}\n<>\n\\end{equation*}<>", { i(1), i(0) })),
  s(
    {
      trig = "cases",
      desc = "cases with predefined rows",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\begin{cases}\n<>\n\\end{cases}<>", {
      d(1, function()
        return sn(nil, {
          i(1, "2"), -- number of cases
          d(2, cases_rows, { 1 }), -- generate rows
        })
      end),
      i(0),
    })
  ),
  s(
    {
      trig = "mat",
      desc = "General matrix with size",
      wordTrig = true,
      snippetType = "autosnippet",
      condition = in_math,
    },
    fmta("\\begin{<>matrix}\n<>\n\\end{<>matrix}<>", {
      i(1, "p"), -- p b B v V
      i(2, "2"), -- rows
      i(3, "2"), -- cols
      d(4, matrix_cells, { 2, 3 }),
      rep(1),
      i(0),
    })
  ),
}
