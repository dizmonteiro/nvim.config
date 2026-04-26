vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 6
vim.opt.foldlevel = 99

vim.o.winborder = "rounded"
vim.opt.laststatus = 3
vim.opt.showmode = false
vim.opt.statusline = " %f %m%r %= %y %l:%c "
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", space = "·", multispace = "·" }

vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.timeoutlen = 300
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.o.fileformats = "unix,dos"
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true
vim.opt.background = "dark"

vim.cmd.colorscheme("habamax")
vim.cmd("filetype plugin indent on")
