vim.pack.add({
  { src = "https://github.com/MagicDuck/grug-far.nvim", name = "grug-far.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupGrugFar", { clear = true }),
  once = true,
  callback = function()
    require("grug-far").setup({})
  end,
})

vim.keymap.set({ "n", "x" }, "<leader>sr", function()
  require("grug-far").open({})
end, { desc = "Search and Replace (grug-far)" })

vim.keymap.set("n", "<leader>sw", function()
  require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
end, { desc = "Search word under cursor (grug-far)" })

vim.keymap.set("x", "<leader>sv", function()
  require("grug-far").with_visual_selection({})
end, { desc = "Search visual selection (grug-far)" })
