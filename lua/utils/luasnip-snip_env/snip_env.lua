---@meta 

s = require("luasnip.nodes.snippet").S
sn = require("luasnip.nodes.snippet").SN
isn = require("luasnip.nodes.snippet").ISN

t = require("luasnip.nodes.textNode").T
i = require("luasnip.nodes.insertNode").I
f = require("luasnip.nodes.functionNode").F
c = require("luasnip.nodes.choiceNode").C
d = require("luasnip.nodes.dynamicNode").D
r = require("luasnip.nodes.restoreNode").R

events = require("luasnip.util.events")
k = require("luasnip.nodes.key_indexer").new_key
ai = require("luasnip.nodes.absolute_indexer")

extras = require("luasnip.extras")
l = extras.lambda
rep = extras.rep
p = extras.partial
m = extras.match
n = extras.nonempty
dl = extras.dynamic_lambda

fmt = require("luasnip.extras.fmt").fmt
fmta = require("luasnip.extras.fmt").fmta

conds = require("luasnip.extras.expand_conditions")
postfix = require("luasnip.extras.postfix").postfix

types = require("luasnip.util.types")
parse = require("luasnip.util.parser").parse_snippet
ms = require("luasnip.nodes.multiSnippet").new_multisnippet