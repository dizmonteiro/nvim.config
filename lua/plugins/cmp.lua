-- local blink_cmp_version = "v1.9.1"
vim.pack.add({
  -- { src = "https://github.com/archie-judd/blink-cmp-words",  name = "blink-cmp-words" },
  {
    src = "https://github.com/saghen/blink.cmp",
    name = "blink.cmp",
    version = vim.version.range("*"),
  },
  {
    src = "https://github.com/saghen/blink.compat",
    name = "blink.compat",
    version = vim.version.range("*"),
  },
  { src = "https://github.com/folke/lazydev.nvim", name = "lazydev" },
  { src = "https://github.com/micangl/cmp-vimtex", name = "cmp-vimtex" },
})

vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
  group = vim.api.nvim_create_augroup("SetupCompletion", { clear = true }),
  once = true,
  callback = function()
    -- lazydev
    require("lazydev").setup({
      library = {
        { path = "LuaSnip", words = { "luasnip" } },
        { path = "catppuccin", words = { "catppuccin" } },
        { path = "lualine", words = { "lualine" } },
      },
    })
    -- blink.cmp
    require("blink.cmp").setup({

      snippets = {
        preset = "luasnip",
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
          -- tex = { "vimtex", "path", "snippets", "buffer" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          -- vimtex = {
          --   name = "vimtex",
          --   module = "blink.compat.source",
          --   score_offset = 120,
          -- },
        },
      },

      completion = {
        menu = {
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" }, { "source_name" } },
            components = {
              item_idx = {
                text = function(ctx)
                  return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
                end,
                highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
              },
            },
          },
        },
        -- list = {
        --   selection = {
        --     preselect = function(ctx)
        --       return not require("blink.cmp").snippet_active({ direction = 1 })
        --     end,
        --   },
        -- },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
        },
        ghost_text = {
          enabled = false,
        },
      },

      fuzzy = {
        sorts = {
          "exact",
          -- defaults
          "score",
          "sort_text",
        },
      },

      keymap = {
        preset = "default",
        ["<c-d>"] = { "show", "show_documentation", "hide_documentation" },
        ["<c-space>"] = {},
        -- ["<C-y>"] = { 'select_and_accept', 'fallback' },
        ["<cr>"] = { "accept", "fallback" },
      },

      cmdline = {
        keymap = {
          preset = "cmdline",
          ["<Right>"] = {},
          ["<Left>"] = {},
          ["<C-space>"] = {},
        },
        completion = {
          menu = {
            auto_show = false,
            -- auto_show = function (ctx)
            --   return vim.fn.getcmdtype() == ':'
            -- end
          },
          list = {
            selection = {
              preselect = true,
              auto_insert = true,
            },
          },
          ghost_text = {
            enabled = true,
          },
        },
      },
    })
  end,
})
