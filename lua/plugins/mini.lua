vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pairs", name = "mini.pairs" },
  { src = "https://github.com/nvim-mini/mini.surround", name = "mini.surround" },
  { src = "https://github.com/nvim-mini/mini.files", name = "mini.files" },
  { src = "https://github.com/nvim-mini/mini.pick", name = "mini.pick" },
})

require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = false },
})

require("mini.files").setup()
require("mini.pick").setup()
require("mini.surround").setup({
  mappings = {
    add = "gsa",
    delete = "gsd",
    find = "gsf",
    find_left = "gsF",
    highlight = "gsh",
    replace = "gsr",
    update_n_lines = "gsn",
    suffix_last = "l",
    suffix_next = "n",
  },
})
