require("config.options")
require("config.keymaps")
require("config.autocmds")

require("plugins.lsp")
require("plugins.catppuccin")
require("plugins.mini")
require("plugins.lualine")
require("plugins.alpha")
require("plugins.treesitter")
require("plugins.ibl")
require("plugins.conform")
require("plugins.luasnip")
require("plugins.cmp")
require("plugins.flash")
require("plugins.blink-pairs")
require("plugins.latex")
require("plugins.which-key")
-- require("plugins.luasnip-latex-snippets")

-- _G.ts_in_mathzone = function()
--   local node = vim.treesitter.get_node({ ignore_injections = false })
--   while node do
--     local t = node:type()
--     -- print(t)
--     if
--       t == "inline_formula"
--       or t == "displayed_equation"
--       or t == "math_environment"
--       or t == "inline_math"
--       or t == "display_math"
--     then
--       return true, t
--     end
--     node = node:parent()
--   end
--   return false, nil
-- end
