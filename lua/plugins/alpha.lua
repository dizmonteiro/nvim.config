vim.pack.add({
  { src = "https://github.com/goolord/alpha-nvim",    name = "alpha" },
  { src = "https://github.com/nvim-lua/plenary.nvim", name = "plenary" },
  { src = "https://github.com/MunifTanjim/nui.nvim",  name = "nui" },
})

require("alpha").setup(require('alpha.themes.theta').config)
