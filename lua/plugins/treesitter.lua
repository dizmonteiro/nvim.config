-- nvim-treesitter has been rewritten, use main version requires to look up
-- https://github.com/nvim-treesitter/nvim-treesitter for details
vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
    version = "main",
  },
})

local nts = require("nvim-treesitter")
local ts_parsers = {
  "lua",
  "markdown",
  "markdown_inline",
  "vim",
  "vimdoc",
  "query",
  "latex",
  "json",
  "toml",
  "yaml",
  "bash",
  "powershell",
  "diff",
  "regex",
  "c",
  "python",
  "cpp",
  "julia",
  "html",
  "javascript",
  "typescript"
}

nts.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})
nts.install(ts_parsers):wait(180000) -- wait up to 3 minutes for async installation to complete
vim.api.nvim_create_autocmd("Packchanged", {
  callback = function()
    nts.update()
  end,
})

local installed = {}

do
  local parser_dir = vim.fn.stdpath("data") .. "/site/parser"

  if vim.fn.isdirectory(parser_dir) == 1 then
    for _, file in ipairs(vim.fn.globpath(parser_dir, "*.so", false, true)) do
      local lang = vim.fn.fnamemodify(file, ":t:r")
      installed[lang] = true
    end
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SetupTreesitter", { clear = true }),
  callback = function(ev)
    local ft = ev.match
    local buf = ev.buf

    -- map filetype -> treesitter language
    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    -- enable only if parser already exists
    if installed[lang] then
      -- enable_treesitter(buf, ft)
      vim.treesitter.start(buf)
      -- if ft == "tex" or ft == "markdown" then
      -- vim.bo[buf].syntax = "ON"
      -- end
      -- indentation
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      -- folding
      vim.wo[0][0].foldmethod = "expr"
      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end
  end,
})
