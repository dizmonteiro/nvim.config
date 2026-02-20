vim.pack.add({ { src = "catppuccin/nvim", name = "catppuccin" } })

require("catppuccin").setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "mocha",
  },
  term_color = true,
  transparent_background = false,
  float = {
    transparent = false,
    solid = true,
  },
  show_end_of_buffer = true,
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.25,
  },
  styles = {
    comments = {},
  },
  default_integrations = true,
  integrations = {
    blink_cmp = true,
    indent_blankline = {
      enabled = true,
      -- scope_color = "lavender",
      colored_indent_levels = true,
    },
    mini = {
      enabled = true,
      -- indentscope_color = "sky",
    },
    mason = true,
    treesitter = true,
  },
  custom_highlights = function(colors)
    return {
      FloatBorder = { fg = colors.blue },
      WinSeparator = { fg = colors.mauve },
    }
  end,
})

vim.cmd.colorscheme("catppuccin")
vim.cmd.hi("statusline guibg=NONE")
vim.cmd.hi("Comment gui=none")
