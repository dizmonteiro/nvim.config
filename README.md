# Neovim Configuration

A modern, minimal Neovim configuration targeting **Neovim 12.0+** with native package management.

## Features

- **Native Plugin Management**: Uses Neovim 12.0's built-in `vim.pack` instead of third-party managers
- **Lazy Loading**: Plugins load on-demand via autocmds for fast startup
- **LaTeX/Math Support**: Extensive LuaSnip snippets for mathematical notation
- **Catppuccin Theme**: Beautiful, consistent color scheme throughout
- **Mini.nvim Ecosystem**: Lightweight, well-integrated utilities

## Requirements

- Neovim 12.0+ (for `vim.pack` and `vim.lsp.config`)
- A Nerd Font for icons
- `curl` for downloading prebuilt binaries (Windows)
- Optional: `stylua` for Lua formatting

## Plugin Overview

### Core

| Plugin | Purpose |
|--------|---------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP server management |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Code formatting |

### Completion & Snippets

| Plugin | Purpose |
|--------|---------|
| [blink.cmp](https://github.com/saghen/blink.cmp) | Autocompletion engine |
| [blink.pairs](https://github.com/Saghen/blink.pairs) | Bracket matching with rainbow colors |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Pre-made snippets |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim) | Lua development support |

### UI & Navigation

| Plugin | Purpose |
|--------|---------|
| [catppuccin](https://github.com/catppuccin/nvim) | Color scheme |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Dashboard |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indent guides |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding help |

### mini.nvim Suite

| Plugin | Purpose |
|--------|---------|
| mini.ai | Enhanced text objects |
| mini.surround | Surround operations |
| mini.files | File explorer |
| mini.icons | File icons |
| mini.pick | Fuzzy picker |
| mini.diff | Diff visualization |
| mini.splitjoin | Split/join code blocks |

### Motion & Editing

| Plugin | Purpose |
|--------|---------|
| [flash.nvim](https://github.com/folke/flash.nvim) | Fast motion/jump |

### Diagnostics & Search

| Plugin | Purpose |
|--------|---------|
| [trouble.nvim](https://github.com/folke/trouble.nvim) | Diagnostics, references, quickfix list |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | Find and replace |

### Language Support

| Plugin | Purpose |
|--------|---------|
| [vimtex](https://github.com/lervag/vimtex) | LaTeX editing |

## Plugin Loading Order

```
init.lua
    │
    ├── config/options.lua      ← Vim settings
    ├── config/keymaps.lua      ← Global keymaps  
    ├── config/autocmds.lua     ← Autocommands
    │
    └── plugins/
        ├── lsp.lua             ← LSP (early for capabilities)
        ├── catppuccin.lua      ← Theme (early for highlights)
        ├── mini.lua            ← mini.nvim suite
        ├── lualine.lua         ← Statusline
        ├── alpha.lua           ← Dashboard
        ├── treesitter.lua      ← Syntax
        ├── ibl.lua             ← Indent guides
        ├── conform.lua         ← Formatting
        ├── luasnip.lua         ← Snippet engine (before cmp)
        ├── cmp.lua             ← Completion (after luasnip)
        ├── flash.lua           ← Motion
        ├── blink-pairs.lua     ← Bracket pairs
        ├── latex.lua           ← LaTeX support
        ├── trouble.lua         ← Diagnostics list
        ├── grug-far.lua        ← Find and replace
        └── which-key.lua       ← Keybinding help
```

## Key Bindings

### Leader Keys
- `<Space>` - Leader key
- `\` - Local leader

### General

| Key | Mode | Description |
|-----|------|-------------|
| `<C-s>` | n | Save file |
| `<Esc>` | n | Clear search highlight |
| `j` / `k` | n,x,v | Smart down/up (respect display lines) |
| `<leader>bd` | n | Close current buffer |
| `<localleader>qt` | n | Quit Neovim |
| `<localleader>wq` | n | Save and quit |

### LSP

| Key | Mode | Description |
|-----|------|-------------|
| `gd` | n | Go to definition |
| `K` | n | Hover documentation |
| `<leader>rn` | n | Rename symbol |
| `<leader>ca` | n | Code action |
| `<leader>cm` | n | Open Mason |

#### Configured LSP Servers

| Server | Languages |
|--------|-----------|
| lua_ls | Lua |
| marksman | Markdown |
| biome | JavaScript, TypeScript, JSON |
| ruff | Python |
| powershell_es | PowerShell |

### File Navigation

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>e` | n | Open mini.files |
| `<localleader>ec` | n | Open config directory |
| `<localleader>es` | n | Open snippets directory |

### Snippets (LuaSnip)

| Key | Mode | Description |
|-----|------|-------------|
| `<Tab>` | i,s | Store visual selection |
| `<C-k>` | i,s | Expand/jump forward |
| `<C-j>` | i,s | Jump backward |
| `<C-l>` | i | Next choice |
| `<leader>fs` | n | Edit snippet files |

### Motion

| Key | Mode | Description |
|-----|------|-------------|
| `s` | n,x,o | Flash jump |

### Diagnostics (trouble.nvim)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>xx` | n | Toggle diagnostics |
| `<leader>xX` | n | Buffer diagnostics |
| `<leader>cs` | n | Document symbols |
| `<leader>cl` | n | LSP definitions/references |
| `<leader>xL` | n | Location list |
| `<leader>xQ` | n | Quickfix list |

### Search & Replace (grug-far.nvim)

| Key | Mode | Description |
|-----|------|-------------|
| `<leader>sr` | n | Search and replace |
| `<leader>sw` | n | Search word under cursor |
| `<leader>sv` | x | Search visual selection |

### Surround (mini.surround)

| Key | Description |
|-----|-------------|
| `gsa` | Add surround |
| `gsd` | Delete surround |
| `gsr` | Replace surround |
| `gsf` | Find surround (right) |
| `gsF` | Find surround (left) |
| `gsh` | Highlight surround |

## Snippets

### Math Snippets (LaTeX/Markdown)

Auto-expanding snippets for mathematical notation:

#### Environments
| Trigger | Expansion | Context |
|---------|-----------|---------|
| `mk` | `$...$` | In text |
| `dm` | `$$\n...\n$$` | In text |
| `lm` | `$$ ... $$` | In text |

#### Greek Letters (in math)
| Trigger | Symbol |
|---------|--------|
| `alpha` through `omega` | `\alpha` through `\omega` |
| `@a` | `\alpha` |
| `@b` | `\beta` |
| `@g` / `@G` | `\gamma` / `\Gamma` |
| `@d` / `@D` | `\delta` / `\Delta` |
| `@l` / `@L` | `\lambda` / `\Lambda` |
| etc. | |

#### Operations (in math)
| Trigger | Expansion |
|---------|-----------|
| `__` | `_{...}` |
| `^^` | `^{...}` |
| `sr` | `\sqrt{}` |
| `ff` | `\frac{}{}` |
| `sq` | `^{2}` |
| `cb` | `^{3}` |
| `sum` | `\sum_{}^{}` |
| `prod` | `\prod_{}^{}` |
| `xx` | `\times` |
| `**` | `\cdot` |
| `+-` | `\pm` |

## Installation

1. Clone to your Neovim config directory:
   ```bash
   git clone <repo> ~/.config/nvim  # Linux/Mac
   git clone <repo> ~/AppData/Local/nvim  # Windows
   ```

2. Start Neovim. Plugins will be automatically installed.

3. Install LSP servers via Mason:
   ```vim
   :Mason
   ```
   Then install desired servers (lua-language-server, marksman, etc.)

## Utilities

The `lua/utils/` directory contains helper modules:

| Module | Description |
|--------|-------------|
| `ts_utils` | Treesitter-based math zone detection for snippets |
| `tex_utils` | VimTeX-based math zone detection (alternative) |
| `luasnip-snip_env` | Global snippet environment (aliases like `s`, `i`, `fmta`) |

## Configuration

### StyLua (`.stylua.toml`)
```toml
indent_type = "Spaces"
indent_width = 2
column_width = 120
```

### Lua Language Server (`.luarc.json`)
```json
{
  "workspace.library": ["lua/utils/luasnip-snip_env"]
}
```

## Commands

| Command | Description |
|---------|-------------|
| `:PackUpdate` | Update plugins |
| `:Mason` | Manage LSP servers |
| `:FCN` | Search for `FCN=` in buffer (custom) |

## License

MIT
