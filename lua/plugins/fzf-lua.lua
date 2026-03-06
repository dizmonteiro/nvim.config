vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua", name = "fzf-lua" },
})

local C = require("catppuccin.palettes").get_palette("mocha")
require("fzf-lua").setup({
  winopts = {
    width = 0.85,
    border = "single",
    preview = {
      default = "bat",
      border = "single",
      hidden = true,
    },
    on_creation = function()
      vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
      vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
    end,
  },
  -- hls = {
  --   FzfLuaBorder = "FloatBorder",
  --   FzfLuaTitle = "FloatBorder",
  --   FzfLuaHeaderText = {
  --     foreground = C.mauve,
  --   },
  --   FzfLuaHeaderBind = {
  --     foreground = C.rosewater,
  --   },
  -- },
  fzf_colors = {
    -- ["bg"] = "-1", -- Transparent background, originally base
    ["fg"] = C.text,
    ["bg+"] = C.ui_selection, -- Custom color, originally surface0
    ["fg+"] = C.text,
    ["hl"] = C.red,
    ["hl+"] = C.red,
    ["spinner"] = C.rosewater,
    ["header"] = C.mauve, -- Personal preference, originally red
    ["info"] = C.mauve,
    ["pointer"] = C.rosewater,
    ["marker"] = C.rosewater,
    ["prompt"] = C.mauve,
    -- ["gutter"] = "-1", -- Transparent background
  },
})

vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "FzfLuaTitle", { link = "FloatBorder" })
vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { foreground = C.mauve })
vim.api.nvim_set_hl(0, "FzfLuaHeaderBind", { foreground = C.rosewater })
