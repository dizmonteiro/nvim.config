vim.keymap.set("n", "<localleader>o", ":update<CR> :source<CR>")
-- vim.keymap.set("n", "<localleader>w", ":write<CR>")
vim.keymap.set(
  { "n", "x", "v" },
  "j",
  "v:count == 0 ? 'gj' : 'j'",
  { expr = true, silent = true, desc = "Move cursor down" }
)
vim.keymap.set(
  { "n", "x", "v" },
  "k",
  "v:count == 0 ? 'gk' : 'k'",
  { expr = true, silent = true, desc = "Move cursor up" }
)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>bp | bd #<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<localleader>qt", "<cmd>quit<CR>", { desc = "quit Neovim" })
vim.keymap.set("n", "<localleader>wq", "<cmd>wq<CR>", { desc = "save and quit Neovim" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "write current buffer" })
-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
-- vim.keymap.set("i", "jj", "<cmd>w<CR> <Esc>", { desc = "Save file and exit insert mode" })
