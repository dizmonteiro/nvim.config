vim.pack.add({
  { src = "https://github.com/gbprod/yanky.nvim", name = "yanky.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupYanky", { clear = true }),
  once = true,
  callback = function()
    require("yanky").setup({})
    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
    vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
    -- vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
    -- vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")
  end,
})
