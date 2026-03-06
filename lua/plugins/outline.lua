vim.pack.add({
  { src = "https://github.com/hedyhli/outline.nvim", name = "outline.nvim" },
})

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupOutline", { clear = true }),
  once = true,
  callback = function()
    require("outline").setup({
      outline_window = {
        position = "right",
        width = 25,
        relative_width = true,
        auto_close = false,
        auto_jump = false,
        focus_on_open = true,
      },
      outline_items = {
        show_symbol_details = true,
        show_symbol_lineno = false,
        highlight_hovered_item = true,
        auto_set_cursor = true,
      },
      keymaps = {
        goto_location = "<Cr>",
        peek_location = "o",
        close = { "<Esc>", "q" },
      },
    })
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
    vim.keymap.set("n", "<leader>co", "<cmd>OutlineFocus<CR>", { desc = "Focus Outline" })
  end,
})
