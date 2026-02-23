vim.pack.add({
  { src = "https://github.com/folke/trouble.nvim", name = "trouble.nvim" },
})

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  virtual_lines = false,
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupTrouble", { clear = true }),
  once = true,
  callback = function()
    require("trouble").setup({
      focus = true,
    })
    vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
    vim.keymap.set(
      "n",
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      { desc = "Buffer Diagnostics (Trouble)" }
    )
    vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
    vim.keymap.set(
      "n",
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      { desc = "LSP Definitions / references / ... (Trouble)" }
    )
    vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
    vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
  end,
})
