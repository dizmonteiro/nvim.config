return {}
-- vim.pack.add(
--   { {
--     src = "https://github.com/iurimateus/luasnip-latex-snippets.nvim/",
--     name = "luasnip-latex-snippets",
--   } }
-- )

-- vim.api.nvim_create_autocmd('BufReadPre', {
--   group = vim.api.nvim_create_augroup("SetupLuasnipLatexSnippets", { clear = true }),
--   pattern = { "*.tex", "*.md" },
--   once = true,
--   callback = function()
--     require("luasnip-latex-snippets").setup({
--       use_treesitter = false,
--       allow_on_markdown = true,
--     })
--   end,
-- })
