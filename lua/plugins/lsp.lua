vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim", name = "mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
})

require("mason").setup({
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "marksman",
    "biome",
    "ruff",
    "ty",
    "powershell-editor-services",
    "ts_ls",
    "css-lsp",
    "yaml-language-server",
    "texlab",
    "tex-fmt",
  },
})

vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { silent = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("SetupLSP", {}),
  callback = function(ev)
    local buf = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    local opts = { buffer = buf }

    if client.server_capabilities.definitionProvider then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    end
    if client.server_capabilities.hoverProvider then
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end
    if client.server_capabilities.renameProvider then
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end
    if client.server_capabilities.codeActionProvider then
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    end
  end,
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua", "luau" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = { vim.env.VIMRUNTIME }, checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
})

vim.lsp.config("biome", {
  root_markers = { "biome.json", "biome.jsonc", ".git", "package.json" },
})

vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
})

vim.lsp.config("ty", {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", "setup.py", "requirements.txt", ".git" },
})

local ps_es = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services"
vim.lsp.config("powershell_es", {
  shell = "pwsh",
  bundle_path = ps_es,
  root_markers = { ".git" },
})

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  init_options = { provideFormatter = false },
  root_markers = { "package.json", ".git" },
})

vim.lsp.config("ts_ls", {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
})

vim.lsp.config("texlab", {
  settings = {
    texlab = {
      build = { args = {} },
      latexFormatter = "tex-fmt",
    },
  },
})

local lsp_servers = {
  "lua_ls",
  "marksman",
  "biome",
  "ruff",
  "ty",
  "powershell_es",
  "cssls",
  "ts_ls",
  "yamlls",
  "texlab",
  "julials",
}

vim.g.lsp_auto_start = false

vim.api.nvim_create_user_command("LspStart", function()
  if vim.g.lsp_auto_start then
    vim.notify("LSP auto-start already enabled", vim.log.levels.INFO)
    return
  end
  vim.g.lsp_auto_start = true
  for _, server in ipairs(lsp_servers) do
    vim.lsp.enable(server)
  end
  vim.notify("LSP auto-start enabled", vim.log.levels.INFO)
end, { desc = "Enable LSP auto-start" })

vim.api.nvim_create_user_command("LspStop", function()
  vim.g.lsp_auto_start = false
  for _, server in ipairs(lsp_servers) do
    vim.lsp.enable(server, false)
  end
  for _, client in ipairs(vim.lsp.get_clients()) do
    client:stop(true)
  end
  vim.notify("LSP stopped", vim.log.levels.INFO)
end, { desc = "Disable LSP and stop all clients" })

vim.keymap.set("n", "<leader>ls", "<cmd>LspStart<CR>", { desc = "Enable LSP auto-start" })

local group = vim.api.nvim_create_augroup("LspFormatOnSaveWeb", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.css", "*.html", "*.yaml", "*.tex", "*.bib", "*.jl" },
  callback = function(args)
    if not vim.g.lsp_auto_start then
      return
    end
    local ft = vim.bo[args.buf].filetype

    local formatter_by_ft = {
      javascript = "biome",
      javascriptreact = "biome",
      typescript = "biome",
      typescriptreact = "biome",
      json = "biome",
      jsonc = "biome",
      css = "biome",
      yaml = "yamlls",
      latex = "texlab",
      bibtex = "texlab",
      julia = "julials",
    }

    local preferred = formatter_by_ft[ft]
    if not preferred then
      return
    end

    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false,
      filter = function(client)
        return client.name == preferred
      end,
    })
  end,
})
