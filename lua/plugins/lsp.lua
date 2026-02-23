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
  },
})

vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { silent = true })
-- vim.lsp.enable("clangd")
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

-- lua-language-server
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua", "luau" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- lightweight and sufficient
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Marksman (Markdown)
vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  filetypes = { "markdown" },
})

-- Biome (web tool chain, linter and formatter as a language server)
vim.lsp.config("biome", {
  -- cmd = { "biome", "lsp-proxy" },
  -- filetypes = {
  --   "javascript",
  --   "javascriptreact",
  --   "typescript",
  --   "typescriptreact",
  --   "json",
  --   "jsonc",
  --   "css",
  --   "vue",
  --   "html",
  -- },
  root_markers = { "biome.json", "biome.jsonc", ".git", "package.json" },
})

-- Ruff (Python linter/formatter as a server)
vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
})

-- ty language server
vim.lsp.config("ty", {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", "setup.py", "requirements.txt", ".git" },
})

-- PowerShell
local ps_es = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services/PowerShellEditorServices"
vim.lsp.config("powershell_es", {
  shell = "pwsh",
  bundle_path = ps_es,
  -- cmd = {
  --   "pwsh",
  --   "-NoLogo",
  --   "-NoProfile",
  --   "-Command",
  --   "& '" .. ps_es .. "/PowerShellEditorServices/Start-EditorServices.ps1' -Stdio",
  -- },
  -- filetypes = { "ps1", "psm1", "psd1" },
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

-- yaml-language-server uses default config
-- vim.lsp.config("yamlls", {
--
-- })

vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
vim.lsp.enable("biome")
vim.lsp.enable("ruff")
vim.lsp.enable("ty")
vim.lsp.enable("powershell_es")
vim.lsp.enable("cssls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("yamlls")

local group = vim.api.nvim_create_augroup("LspFormatOnSaveWeb", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.json", "*.css", "*.html", "*.yaml" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    -- map filetype -> preferred LSP client
    local formatter_by_ft = {
      javascript = "biome",
      javascriptreact = "biome",
      typescript = "biome",
      typescriptreact = "biome",
      json = "biome",
      jsonc = "biome",
      css = "biome",
      yaml = "yamlls",
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
