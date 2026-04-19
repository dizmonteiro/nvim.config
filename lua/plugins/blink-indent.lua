vim.pack.add({
  { src = "https://github.com/Saghen/blink.indent", name = "blink.indent" },
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
  surface = C.surface2,
}

vim.api.nvim_set_hl(0, "BlinkIndentDim", { fg = colors.surface })
vim.api.nvim_set_hl(0, "BlinkIndentWhite", { fg = colors.grey })
vim.api.nvim_set_hl(0, "BlinkIndentYellow", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "BlinkIndentGreen", { fg = colors.green })
vim.api.nvim_set_hl(0, "BlinkIndentBlue", { fg = colors.blue })
vim.api.nvim_set_hl(0, "BlinkIndentRed", { fg = colors.red })
vim.api.nvim_set_hl(0, "BlinkIndentOrange", { fg = colors.orange })

vim.api.nvim_set_hl(0, "BlinkIndentUnderlineRed", { underline = true, sp = colors.red })
vim.api.nvim_set_hl(0, "BlinkIndentUnderlineYellow", { underline = true, sp = colors.yellow })
vim.api.nvim_set_hl(0, "BlinkIndentUnderlineGreen", { underline = true, sp = colors.green })
vim.api.nvim_set_hl(0, "BlinkIndentUnderlineOrange", { underline = true, sp = colors.orange })
vim.api.nvim_set_hl(0, "BlinkIndentUnderlineBlue", { underline = true, sp = colors.blue })

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupBlinkIndent", { clear = true }),
  once = true,
  callback = function()
    require("blink.indent").setup({
      enabled = true,
      blocked = {
        filetypes = {
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "markdown",
          "TelescopePrompt",
        },
        buftypes = { "terminal", "nofile", "quickfix", "prompt" },
      },
      static = {
        enabled = true,
        char = "▏",
        priority = 100,
        highlights = {
          "BlinkIndentDim",
        },
      },
      scope = {
        enabled = true,
        char = "▎",
        priority = 1000,
        highlights = {
          "BlinkIndentRed",
          "BlinkIndentGreen",
          "BlinkIndentYellow",
          "BlinkIndentGreen",
          "BlinkIndentBlue",
        },
        underline = {
          enabled = true,
          highlights = {
            "BlinkIndentUnderlineRed",
            "BlinkIndentUnderlineOrange",
            "BlinkIndentUnderlineYellow",
            "BlinkIndentUnderlineGreen",
            "BlinkIndentUnderlineBlue",
          },
        },
      },
    })
  end,
})
