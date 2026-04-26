vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    name = "blink.cmp",
    version = vim.version.range("*"),
  },
  { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function()
    require("lazydev").setup({})

    require("blink.cmp").setup({
      snippets = {
        preset = "luasnip",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 120,
          },
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = false,
        },
      },
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },
    })
  end,
})
