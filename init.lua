local startup = require("utils.startup")

require("config.options")
require("config.keymaps")
require("config.autocmds")

-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = vim.api.nvim_create_augroup("ShowAlpha", { clear = true }),
--   once = true,
--   callback = function()
--     if vim.fn.argc() == 0 and vim.fn.line2byte(vim.fn.line("$")) == -1 then
--       vim.cmd("Alpha")
--     end
--   end,
-- })

local function load_plugin(name)
  local start_t = vim.loop.hrtime()
  require("plugins." .. name)
  local elapsed = (vim.loop.hrtime() - start_t) / 1e6
  startup.timings[name] = elapsed
end
require("plugins.alpha")

load_plugin("lsp")
load_plugin("catppuccin")
load_plugin("mini")
load_plugin("lualine")
load_plugin("treesitter")
load_plugin("fzf-lua")
load_plugin("blink-indent")
load_plugin("conform")
load_plugin("luasnip")
load_plugin("cmp")
load_plugin("flash")
load_plugin("blink-pairs")
load_plugin("yanky")
load_plugin("latex")
load_plugin("trouble")
load_plugin("outline")
load_plugin("grug-far")
load_plugin("scratch")
load_plugin("toggleterm")
load_plugin("which-key")
