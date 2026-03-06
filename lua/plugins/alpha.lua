vim.pack.add({
  { src = "https://github.com/goolord/alpha-nvim", name = "alpha" },
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local startup = require("utils.startup")

dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
  "                     nvim v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
}

dashboard.section.buttons.val = {
  dashboard.button("n", "     New file       ", "<cmd>ene <BAR> startinsert <CR>"),
  dashboard.button("f", "   󰱞  Find file      ", "<cmd>FzfLua files<CR>"),
  dashboard.button("r", "   󰄉  Recent files   ", "<cmd>FzfLua oldfiles<CR>"),
  dashboard.button("g", "   󰺾  Find text      ", "<cmd>FzfLua grep<CR>"),
  dashboard.button("s", "     Settings       ", "<cmd>e $MYVIMRC <CR>"),
  dashboard.button("m", "   󰭖  Mason          ", "<cmd>Mason<CR>"),
  dashboard.button("t", "   󰈚  Startup time   ", "<cmd>StartupTime<CR>"),
  dashboard.button("q", "   󰗼  Quit           ", "<cmd>qa<CR>"),
}

dashboard.section.footer.val = function()
  local count = startup.get_count()
  local time = string.format("%.2f", startup.get_total())
  return "  " .. count .. " plugins  ·  " .. time .. " ms"
end

dashboard.section.footer.opts.hl = "Comment"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"

dashboard.opts.opts.noautocmd = true
dashboard.opts.layout = {
  { type = "padding", val = 1 },
  dashboard.section.header,
  { type = "padding", val = 1 },
  dashboard.section.buttons,
  dashboard.section.footer,
}

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    vim.opt_local.cursorline = false
    vim.opt_local.showtabline = 0
  end,
})
