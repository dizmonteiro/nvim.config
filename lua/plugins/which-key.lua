vim.pack.add({
  { src = "https://github.com/folke/which-key.nvim", name = "which-key.nvim" },
})

require("which-key").setup({
  preset = "helix",
})

vim.keymap.set("n", "<leader>?", "<cmd>lua require('which-key').show( {global = true} )<CR>", { desc = "Buffer Local Keymaps (which-key)" })
