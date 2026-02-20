vim.pack.add({
  -- { src = "https://github.com/linrongbin16/lsp-progress.nvim", name = "lsp-progress" },
  { src = "https://github.com/nvim-lualine/lualine.nvim", name = "lualine" },
  { src = "https://github.com/akinsho/bufferline.nvim",   name = "bufferline" },
}
)

local C = require("catppuccin.palettes").get_palette("mocha")
local theme_mocha = {
  normal = {
    a = { bg = C.blue, fg = C.mantle, gui = "bold" },
    b = { bg = C.mantle, fg = C.blue },
    c = { bg = C.mantle, fg = C.text },
    x = { bg = C.mantle, fg = C.text },
    y = { bg = C.mantle, fg = C.text },
    z = { bg = C.mantle, fg = C.blue },
  },

  insert = {
    a = { bg = C.green, fg = C.base, gui = "bold" },
    b = { bg = C.mantle, fg = C.green },
    c = { bg = C.mantle, fg = C.text },
    x = { bg = C.mantle, fg = C.text },
    y = { bg = C.mantle, fg = C.text },
    z = { bg = C.mantle, fg = C.green },
  },

  terminal = {
    a = { bg = C.green, fg = C.base, gui = "bold" },
    b = { bg = C.mantle, fg = C.green },
    c = { bg = C.mantle, fg = C.text },
    x = { bg = C.mantle, fg = C.text },
    y = { bg = C.mantle, fg = C.text },
    z = { bg = C.mantle, fg = C.green },
  },

  command = {
    a = { bg = C.peach, fg = C.base, gui = "bold" },
    b = { bg = C.mantle, fg = C.peach },
    c = { bg = C.mantle, fg = C.text },
    x = { bg = C.mantle, fg = C.text },
    y = { bg = C.mantle, fg = C.text },
    z = { bg = C.mantle, fg = C.peach },
  },
  visual = {
    a = { bg = C.mauve, fg = C.base, gui = "bold" },
    b = { bg = C.mantle, fg = C.mauve },
    c = { bg = C.mantle, fg = C.text },
    x = { bg = C.mantle, fg = C.text },
    y = { bg = C.mantle, fg = C.text },
    z = { bg = C.mantle, fg = C.mauve },
  },
  replace = {
    a = { bg = C.red, fg = C.base, gui = "bold" },
    b = { bg = C.mantle, fg = C.red },
    c = { bg = C.mantle, fg = C.text },
    x = { bg = C.mantle, fg = C.text },
    y = { bg = C.mantle, fg = C.text },
    z = { bg = C.mantle, fg = C.red },
  },
  inactive = {
    a = { bg = C.mantle, fg = C.blue },
    b = { bg = C.mantle, fg = C.surface1, gui = "bold" },
    c = { bg = C.mantle, fg = C.overlay0 },
  },
}
local colors = {
  fg = C.text,
  fg_inactive = C.overlay0,
  bg = C.mantle,
  yellow = C.yellow,
  cyan = C.teal,
  darkblue = C.blue,
  green = C.green,
  orange = C.peach,
  violet = C.mauve,
  magenta = C.maroon,
  blue = C.sky,
  red = C.red
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    theme = theme_mocha,
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {
      {
        "mode",
        icons_enabled = false,
      },
    },
    lualine_b = {
      {
        "branch",
        icon = '',
      },
    },
    lualine_c = {
      {
        "diff",
        symbols = { added = '+', modified = '~', removed = '-' },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      },
      {
        "filename",
        file_status = true,
        newfile_status = false,
        path = 3,
        shorting_target = 100
      },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.cyan },
          info = { fg = colors.blue },
        },
      },
      {
        "lsp_status",
      },
    },
    -- right
    lualine_x = {
      -- "searchcount",
      "location",
      "progress",
    },
    lualine_y = {
      {
        'o:encoding',
        fmt = string.upper,
        cond = conditions.hide_in_width,
        color = { fg = colors.green, gui = 'bold' },
      },
      {
        'fileformat',
        icons_enabled = true,
        color = { fg = colors.yellow }
      },
      {
        'filetype',
        icon_only = true, -- I think icons are cool but Eviline doesn't have them. sigh
        color = { fg = colors.darkblue, gui = 'bold' },
      },
    },
    lualine_z = {
      {
        function()
          return '▊'
        end,
        padding = { left = 1 },
      }
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        "filename",
        file_status = true,
        newfile_status = false,
        path = 3,
        shorting_target = 100
      },
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile", "BufNew" }, {
  group = vim.api.nvim_create_augroup("SetupLualine", { clear = true }),
  once = true,
  callback = function()
    require("lualine").setup(config)
    require("bufferline").setup({
      highlights = require("catppuccin.special.bufferline").get_theme()
    })
  end,
})

-- vim.api.nvim_create_augroup("lualine_refresh_LSP", { clear = true })
-- vim.api.nvim_create_autocmd("User", {
-- group = "lualine_refresh_LSP",
-- pattern = "LspProgressStatusUpdated",
-- callback = require("lualine").refresh,
-- })
