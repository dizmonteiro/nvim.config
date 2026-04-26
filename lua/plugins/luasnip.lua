vim.pack.add({
  {
    src = "https://github.com/L3MON4D3/LuaSnip",
    name = "LuaSnip",
    version = "v2.4.1",
  },
})

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
  history = true,
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {
          { "●", "LuasnipChoiceNodeActive" },
          { "<-", "Error" },
        },
      },
    },
  },
  store_selection_keys = "<Tab>",
})

-- Make TeX snippets available in markdown
ls.filetype_extend("markdown", { "math" })
ls.filetype_extend("tex", { "math" })
-- ls.filetype_extend("vimwiki", { "tex" })

vim.keymap.set("n", "<leader>fs", function()
  require("luasnip.loaders").edit_snippet_files()
end, { desc = "Edit LuaSnip Snippets" })
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true, desc = "Expand or jump for luasnip node" })
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, desc = "Jump backwards for luasnip node" })
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true, desc = "Change to next choice for luasnip node" })
require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/snippets/luasnip" })
