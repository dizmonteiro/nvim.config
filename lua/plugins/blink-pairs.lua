vim.pack.add({
  { src = "https://github.com/Saghen/blink.pairs", name = "blink.pairs", version = vim.version.range("*") },
})

local C = require("catppuccin.palettes").get_palette("mocha")
local colors = {
  red = C.red,
  green = C.green,
  deepblue = C.blue,
  blue = C.sapphire,
  yellow = C.yellow,
  orange = C.peach,
  purple = C.mauve,
  white = C.text,
  grey = C.subtext0,
  surface = C.surface0,
}

vim.api.nvim_set_hl(0, "BlinkPairsMatch", { fg = colors.orange, bg = colors.surface, bold = true })
vim.api.nvim_set_hl(0, "BlinkPairsUnmatch", { fg = colors.red })
vim.api.nvim_set_hl(0, "BlinkPairsWhite", { fg = colors.grey })
vim.api.nvim_set_hl(0, "BlinkPairsYellow", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "BlinkPairsGreen", { fg = colors.green })
vim.api.nvim_set_hl(0, "BlinkPairsPurple", { fg = colors.purple })
vim.api.nvim_set_hl(0, "BlinkPairsBlue", { fg = colors.blue })

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("BlinkPairsSetup", { clear = true }),
  once = true,
  callback = function()
    -- require('vim._extui').enable({})
    require("blink.pairs").setup({
      mappings = {
        enabled = true,
        cmdline = true,
        -- pairs = {
        --   ["("] = {
        --     { ")", languages = { "markdown" } },
        --   },
        -- },
      },
      highlights = {
        enabled = true,
        cmdline = false,
        groups = {
          "BlinkPairsWhite",
          "BlinkPairsYellow",
          "BlinkPairsGreen",
          "BlinkPairsPurple",
          "BlinkPairsBlue",
        },
        priority = 200,
        unmatched_group = "BlinkPairsUnmatch",
        matchparen = {
          enabled = true,
          -- known issue where typing won"t update matchparen highlight, disabled by default
          cmdline = false,
          -- also include pairs not on top of the cursor, but surrounding the cursor
          include_surrounding = false,
          -- group = "BlinkPairsMatch",
          priority = 200,
        },
      },
    })
  end,
})
