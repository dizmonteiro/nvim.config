local function mini_pick_builtin(name)
  return function()
    require("mini.pick").builtin[name]()
  end
end

local function live_grep()
  if vim.fn.executable("rg") == 0 then
    vim.notify("ripgrep (rg) is required for live grep", vim.log.levels.WARN)
    return
  end

  require("mini.pick").builtin.grep_live()
end

vim.keymap.set("n", "<localleader>o", "<cmd>update | source<CR>", { desc = "Reload current config file" })
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
vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open()
end, { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ff", mini_pick_builtin("files"), { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fr", mini_pick_builtin("oldfiles"), { desc = "Recent files" })
vim.keymap.set("n", "<leader>fb", mini_pick_builtin("buffers"), { desc = "Buffers" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>q", function()
  vim.diagnostic.setloclist({ open = true })
end, { desc = "Diagnostics list" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<localleader>ec", function()
  require("mini.files").open(vim.fn.stdpath("config"))
end, { desc = "Open config directory" })
vim.keymap.set("n", "<localleader>es", function()
  require("mini.files").open(vim.fn.stdpath("config") .. "/lua/snippets")
end, { desc = "Open snippets directory" })
vim.keymap.set("n", "<localleader>qt", "<cmd>quit<CR>", { desc = "quit Neovim" })
vim.keymap.set("n", "<localleader>wq", "<cmd>wq<CR>", { desc = "save and quit Neovim" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "write current buffer" })
