vim.treesitter.language.register("latex", { "plaintex", "tex" })
vim.treesitter.language.register("bash", { "sh", "zsh" })
vim.treesitter.language.register("cpp", { "cuda" })

local function enable_treesitter(ev)
  local buf = ev.buf
  if vim.bo[buf].buftype ~= "" then
    return
  end

  local ft = vim.bo[buf].filetype
  local lang = vim.treesitter.language.get_lang(ft)
  if not lang or not vim.treesitter.language.add(lang) then
    return
  end

  local started, err = pcall(vim.treesitter.start, buf, lang)
  if not started then
    vim.schedule(function()
      vim.notify(("Treesitter disabled for %s: %s"):format(lang, err), vim.log.levels.WARN)
    end)
    return
  end

  local win = vim.api.nvim_get_current_win()
  if vim.api.nvim_win_get_buf(win) ~= buf then
    return
  end

  vim.wo[win].foldmethod = "expr"
  vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
end

vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  group = vim.api.nvim_create_augroup("SetupTreesitter", { clear = true }),
  callback = enable_treesitter,
})
