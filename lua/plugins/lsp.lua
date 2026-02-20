vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim", name = "mason.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig", name = "nvim-lspconfig" },
})

require("mason").setup({
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "marksman",
    -- ty
    --  biome (keywords: json, javascript, typescript)
    --
    -- ruff (keywords: python)
    -- powershell-editor-services (keywords: powershell)
    -- lua-language-server (keywords: lua)
    -- stylua (keywords: lua, luau)
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

-- ============================================================================
-- Enable servers (filetype-scoped, not global)
-- ============================================================================

vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
