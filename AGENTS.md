# AGENTS.md - Neovim Configuration Guidelines

This document provides guidelines for AI coding agents working on this Neovim v12.0+ configuration.

## Project Overview

This is a modern Neovim configuration targeting **Neovim 12.0+** that uses the new built-in `vim.pack` plugin manager instead of lazy.nvim or packer. The configuration emphasizes:
- Native Neovim capabilities where possible
- Lazy loading via autocmds with `once = true`
- Extensive LaTeX/math snippet support via LuaSnip
- Catppuccin color scheme integration

## Directory Structure

```
nvim/
├── init.lua              # Entry point, loads all modules in order
├── lua/
│   ├── config/           # Core configuration
│   │   ├── options.lua   # Vim options
│   │   ├── keymaps.lua   # Global keymaps
│   │   ├── autocmds.lua  # Autocommands and hooks
│   │   └── hlgroups.lua  # Highlight groups
│   ├── plugins/          # Plugin configurations
│   ├── snippets/         # LuaSnip snippets
│   │   └── luasnip/      # Lua-based snippets
│   │       ├── math/     # Math snippets for LaTeX/Markdown
│   │       ├── markdown/ # Markdown snippets
│   │       └── lua/      # Lua snippets
│   └── utils/            # Utility modules
│       ├── ts_utils.lua  # Treesitter utilities
│       ├── tex_utils.lua # LaTeX/VimTeX utilities
│       └── luasnip-snip_env/ # Global snippet environment
├── after/
│   └── ftplugin/         # Filetype-specific settings
├── stylua.toml           # StyLua formatter config
├── .luarc.json           # Lua language server config
└── nvim-pack-lock.json   # Plugin lockfile
```

## Build/Lint/Test Commands

### Formatting
```bash
# Format all Lua files with StyLua
stylua lua/ after/

# Format a single file
stylua lua/plugins/cmp.lua

# Check formatting without modifying (dry-run)
stylua --check lua/
```

### Linting/Type Checking
```bash
# Lua language server diagnostics (run inside Neovim)
# Or use lua-language-server CLI:
lua-language-server --check lua/

# The LSP is configured in lua/plugins/lsp.lua with lua_ls
```

### Testing Snippets
```bash
# There is no formal test suite. To verify snippets:
# 1. Open a .md or .tex file in Neovim
# 2. Trigger snippets manually (e.g., type "mk" in text for inline math)
# 3. Use <leader>fs to open snippet editor
```

## Plugin Loading Order (init.lua)

Plugins are loaded in this specific order for dependency resolution:

1. `config.options` - Core vim options
2. `config.keymaps` - Global keymaps
3. `config.autocmds` - Autocommands
4. **Plugins** (in order):
   - `plugins.lsp` - LSP configuration (must load early)
   - `plugins.catppuccin` - Colorscheme (load early for highlight groups)
   - `plugins.mini` - mini.nvim ecosystem
   - `plugins.lualine` - Statusline and bufferline
   - `plugins.alpha` - Dashboard
   - `plugins.treesitter` - Syntax highlighting
   - `plugins.ibl` - Indent guides
   - `plugins.conform` - Formatter
   - `plugins.luasnip` - Snippet engine (before cmp)
   - `plugins.cmp` - Completion (depends on luasnip)
   - `plugins.flash` - Motion/jump
   - `plugins.blink-pairs` - Bracket pairs
   - `plugins.latex` - LaTeX support
   - `plugins.which-key` - Keybinding help

## Code Style Guidelines

### Lua Formatting (stylua.toml)
- **Indent**: 2 spaces
- **Column width**: 120 characters
- **No comments** unless explicitly requested

### Imports and Requires
```lua
-- Use vim.pack.add for plugins (Neovim 12.0+ native)
vim.pack.add({
  { src = "https://github.com/owner/repo", name = "repo" },
})

-- Standard requires at module level
local ls = require("luasnip")
local types = require("luasnip.util.types")
```

### Plugin Configuration Pattern
```lua
-- 1. Add plugin with vim.pack.add
vim.pack.add({
  { src = "https://github.com/owner/repo", name = "plugin-name" },
})

-- 2. Setup with lazy loading via autocmd
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("SetupPlugin", { clear = true }),
  once = true,  -- Only run once
  callback = function()
    require("plugin").setup({
      -- options
    })
  end,
})
```

### Keymap Style
```lua
-- Use vim.keymap.set with opts table
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open file explorer" })

-- For buffer-local maps, include buffer = true
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover" })
```

### Snippet Style (LuaSnip)
```lua
-- Import utilities
local U = require("utils.ts_utils")
local in_math = U.in_math
local in_text = U.in_text

return {
  s(
    { trig = "mk", desc = "Inline Math", wordTrig = true, snippetType = "autosnippet", condition = in_text },
    fmta("$<>$<>", { i(1), i(0) })
  ),
}
```

### Naming Conventions
- **Files**: `lowercase.lua` or `kebab-case.lua`
- **Modules**: Return a table `M` or `local M = {}`
- **Functions**: `snake_case` for local, `camelCase` optional for exported
- **Constants**: `UPPER_SNAKE_CASE` for module-level constants
- **Autocmd groups**: Descriptive names like `"SetupLSP"`, `"SetupConform"`

### Error Handling
```lua
-- Use early returns for nil checks
local client = vim.lsp.get_client_by_id(ev.data.client_id)
if not client then
  return
end

-- Use pcall for optional requires
local ok, module = pcall(require, "optional-module")
if not ok then
  return
end
```

### LSP Configuration (Neovim 12.0+)
```lua
-- Use vim.lsp.config for server definitions
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua", "luau" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = { ... },
})

-- Use vim.lsp.enable to activate
vim.lsp.enable("lua_ls")
```

## Key Leader Mappings

| Mapping | Description |
|---------|-------------|
| `<Space>` | Leader key |
| `\` | Local leader |
| `<leader>bd` | Close buffer |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename |
| `<leader>cm` | Open Mason |
| `<leader>e` | Open mini.files |
| `<leader>fs` | Edit snippets |
| `<leader>?` | Which-key |
| `<localleader>ec` | Open config dir |
| `<localleader>es` | Open snippets dir |

## Plugin-Specific Notes

### blink.cmp
- Requires prebuilt binary download (handled in autocmds.lua via PackChanged hook)
- Uses LuaSnip preset for snippet integration

### blink.pairs
- Also requires binary download
- Replaces mini.pairs

### Treesitter
- Parsers installed to `stdpath("data")/site/parser`
- Auto-updates on PackChanged event

### LuaSnip
- Custom snippet environment in `lua/utils/luasnip-snip_env/snip_env.lua`
- Math snippets use treesitter-based `in_math` detection
- Snippets organized by category in `lua/snippets/luasnip/`

## Common Tasks

### Adding a New Plugin
1. Create `lua/plugins/plugin-name.lua`
2. Use `vim.pack.add()` to declare the plugin
3. Add setup code with lazy loading via autocmd
4. Add `require("plugins.plugin-name")` to `init.lua` in correct order

### Adding a New Snippet
1. Choose appropriate file in `lua/snippets/luasnip/`
2. Use the snippet template with `s()`, `fmta()`, and conditions
3. For math snippets, use `in_math` or `in_text` conditions

### Updating Plugins
```vim
:PackUpdate
```

## Important Files to Check

- `nvim-pack-lock.json` - Locked plugin versions
- `.luarc.json` - LSP workspace library configuration
- `stylua.toml` - Formatter settings
