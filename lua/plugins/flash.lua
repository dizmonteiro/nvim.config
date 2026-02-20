vim.pack.add({
  { src = "https://github.com/folke/flash.nvim", name = "flash.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupFlash", { clear = true }),
  once = true,
  callback = function()
    require("flash").setup({})
    -- vim.keymap.del("n", "s")
    vim.keymap.set({"n", "x", "o"}, "s", function()
      require("flash").jump()
    end, { desc = "Flash" })
  end,
})
