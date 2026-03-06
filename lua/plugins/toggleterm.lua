vim.pack.add({
  { src = "https://github.com/akinsho/toggleterm.nvim", name = "toggleterm.nvim" },
})

require("toggleterm").setup({
  open_mapping = [[<c-\>]],
  autochdir = false,
  direction = "float",
  shell = "pwsh",
})
