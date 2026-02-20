vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim", name = "conform" },
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupConform", { clear = true }),
  once = true,
  callback = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
})

