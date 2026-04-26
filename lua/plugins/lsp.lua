vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("SetupLSP", { clear = true }),
  callback = function(ev)
    local buf = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end

    local opts = { buffer = buf, silent = true }

    if client:supports_method("textDocument/definition") then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    end
    if client:supports_method("textDocument/references") then
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    end
    if client:supports_method("textDocument/hover") then
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end
    if client:supports_method("textDocument/rename") then
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end
    if client:supports_method("textDocument/codeAction") then
      vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    end
    if client:supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<leader>cf", function()
        vim.lsp.buf.format({ bufnr = buf, async = false })
      end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
    end
  end,
})

vim.diagnostic.config({
  underline = true,
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  signs = true,
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    source = "if_many",
  },
})

local function enable_if_installed(server_name, command)
  if vim.fn.executable(command) == 1 then
    vim.lsp.enable(server_name)
  end
end

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
  root_markers = { ".marksman.toml", ".git" },
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

vim.lsp.config("texlab", {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_markers = { ".latexmkrc", ".git" },
  settings = {
    texlab = {
      build = {
        onSave = false,
      },
    },
  },
})

vim.lsp.config("yamlls", {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
  root_markers = { ".git" },
})

vim.lsp.config("bashls", {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh", "zsh" },
  root_markers = { ".git", ".bashrc", ".zshrc" },
})

vim.lsp.config("clangd", {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
})

enable_if_installed("lua_ls", "lua-language-server")
enable_if_installed("marksman", "marksman")
enable_if_installed("ruff", "ruff")
enable_if_installed("ty", "ty")
enable_if_installed("texlab", "texlab")
enable_if_installed("yamlls", "yaml-language-server")
enable_if_installed("bashls", "bash-language-server")
enable_if_installed("clangd", "clangd")
