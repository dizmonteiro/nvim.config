vim.pack.add({
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "ibl" }
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupIbl", { clear = true }),
  once = true,
  callback = function()
    require("ibl").setup({
      scope = {
        enabled = true,
      },
    })
  end,
})
