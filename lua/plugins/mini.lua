vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.pairs", name = "mini.pairs" },
  { src = "https://github.com/nvim-mini/mini.surround", name = "mini.surround" },
  { src = "https://github.com/nvim-mini/mini.ai", name = "mini.ai" },
  { src = "https://github.com/nvim-mini/mini.diff", name = "mini.diff" },
  { src = "https://github.com/nvim-mini/mini.files", name = "mini.files" },
  { src = "https://github.com/nvim-mini/mini.icons", name = "mini.icons" },
  { src = "https://github.com/nvim-mini/mini.splitjoin", name = "mini.splitjoin" },
  { src = "https://github.com/nvim-mini/mini.pick", name = "mini.pick" },
})

-- turns to use blink.pairs
-- require("mini.pairs").setup({
--   modes = { insert = true, command = true, terminal = false },
-- })

require("mini.icons").setup({
  style = "glyph",
  file = {
    README = { glyph = "󰆈", hl = "MiniIconsYellow" },
    ["README.md"] = { glyph = "󰆈", hl = "MiniIconsYellow" },
  },
  filetype = {
    bash = { glyph = "󱆃", hl = "MiniIconsGreen" },
    sh = { glyph = "󱆃", hl = "MiniIconsGrey" },
    toml = { glyph = "󱄽", hl = "MiniIconsOrange" },
  },
})

require("mini.files").setup({
  windows = {
    max_number = 3,
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open file explorer" })
vim.keymap.set(
  "n",
  "<localleader>ec",
  "<cmd>lua MiniFiles.open(vim.fn.stdpath('config'))<CR>",
  { desc = "Open nvim config dir" }
)
vim.keymap.set(
  "n",
  "<localleader>es",
  "<cmd>lua MiniFiles.open(vim.fn.stdpath('config') .. '/lua/snippets')<CR>",
  { desc = "Open nvim snippet dir" }
)

vim.api.nvim_create_autocmd({ "BufEnter", "InsertEnter" }, {
  group = vim.api.nvim_create_augroup("MiniPluginsSetup", { clear = true }),
  once = true,
  callback = function()
    require("mini.splitjoin").setup()
    require("mini.diff").setup()
    require("mini.ai").setup({
      mappings = {
        goto_left = "[",
        goto_right = "]",
      },
    })
    require("mini.surround").setup({
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
        suffix_last = "l",
        suffix_next = "n",
      },
    })
  end,
})

require("mini.pick").setup()

local MiniPick = require("mini.pick")

local function pick_oldfiles(opts)
  opts = opts or {}

  -- Collect oldfiles; filter out non-readable files if desired
  local items = {}
  for _, path in ipairs(vim.v.oldfiles or {}) do
    if vim.fn.filereadable(path) == 1 then
      table.insert(items, path)
    end
  end

  MiniPick.start({
    source = {
      name = "Oldfiles",

      items = items,

      -- What is displayed in the picker

      show = MiniPick.default_show,

      -- How matching is performed (default fuzzy)
      match = MiniPick.default_match,

      -- What happens when user presses <CR>
      choose = function(item)
        MiniPick.stop()
        vim.cmd.edit(vim.fn.fnameescape(item))
      end,

      -- Optional preview window
      preview = function(item, buf)
        if vim.fn.filereadable(item) == 0 then
          return
        end
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        vim.fn.bufload(item)
        vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.api.nvim_buf_get_lines(vim.fn.bufnr(item), 0, 200, false))
      end,
    },

    -- Picker options
    options = {
      content_from_bottom = false,
    },
  })
end

-- Optional user command
MiniPick.registry.oldfiles = function()
  pick_oldfiles()
end
