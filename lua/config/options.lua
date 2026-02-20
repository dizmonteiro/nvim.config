vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 6
vim.opt.foldlevel = 99

vim.o.winborder = "rounded"
-- only one statusline
vim.opt.laststatus = 3
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "auto"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"
vim.opt.timeoutlen = 300

vim.opt.expandtab = true
vim.opt.smarttab = true
-- vim.cmd("filetype plugin indent on")
