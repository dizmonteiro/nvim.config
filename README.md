# Neovim Configuration

Minimal, native-first Neovim **0.12.2** config for Bosch AI Safety work and the path toward a senior/expert deep learning engineer role.

## Focus

- Python and PyTorch implementation
- C, C++, and CUDA for lower-level performance work when needed
- Markdown notes, planning, and research writing
- LaTeX math-heavy notes
- YAML and shell support for tooling/config
- Lua only for maintaining this config

## Principles

- use built-in Neovim first: `vim.pack`, `vim.lsp`, `vim.treesitter`, diagnostics, statusline
- keep the plugin layer small and practical
- optimize for reliable daily work, not editor novelty

## What is included

| Component | Purpose |
| --- | --- |
| Built-in `vim.pack` | Native package manager |
| Built-in `vim.treesitter` | Highlighting and folds when a parser is available on `runtimepath` |
| Built-in `vim.lsp` | Native LSP for role-relevant languages |
| `mini.files` | File explorer |
| `mini.pick` | Files, buffers, recent files, live grep |
| `mini.pairs` | Simple autopairs |
| `mini.surround` | Surround editing |
| `blink.cmp` | Completion |
| `LuaSnip` | Custom snippets, especially math snippets |
| `lazydev.nvim` | Better Lua completion while maintaining the config |
| `vimtex` | LaTeX editing support |

## What is intentionally not included

- dashboard plugin
- custom statusline or tab UI plugins
- Mason or other LSP installer wrappers
- theme/plugin-heavy UI layers
- extra search, outline, diagnostic, terminal, or clipboard plugins when native tools are enough

## Language support

The config is biased toward these workflows:

| Language | Why it is here |
| --- | --- |
| Python | Bosch AI Safety implementation and experiments |
| C / C++ / CUDA | lower-level tooling, kernels, and performance-oriented work when needed |
| Markdown | notes, planning, and study artifacts |
| TeX | math notation and technical writing |
| YAML | configs and experiment metadata |
| Bash | scripts and tooling |
| Lua | maintaining the Neovim config |

## LSP

LSP is configured with native `vim.lsp.config()` and auto-enabled only when the server executable is already installed.

Configured servers:

- `lua_ls`
- `marksman`
- `ruff`
- `ty`
- `texlab`
- `yamlls`
- `bashls`
- `clangd`

Recommended binaries:

- `lua-language-server`
- `marksman`
- `ruff`
- `ty`
- `texlab`
- `yaml-language-server`
- `bash-language-server`
- `clangd`

There is no Mason dependency. Install language servers with your system package manager, Homebrew, npm, pip, uv, cargo, or other normal tooling.

## Treesitter

- Uses native `vim.treesitter`
- Starts only when a parser is already available on `runtimepath`
- C works with Neovim's bundled parser; CUDA is mapped to the `cpp` parser when that parser is available
- Extra parsers should be added as parser/query plugins, not built from this config

## LaTeX

- `vimtex` is kept for editing support and math-aware snippet workflows
- compiler integration is disabled by default, so editing TeX files does not require `latexmk`

## Keymaps

| Key | Description |
| --- | --- |
| `<leader>e` | open file explorer |
| `<leader>ff` | find files |
| `<leader>fg` | live grep |
| `<leader>fr` | recent files |
| `<leader>fb` | open buffers picker |
| `<leader>bd` | close current buffer |
| `<leader>cd` | show diagnostics on current line |
| `<leader>q` | open diagnostics location list |
| `gd` | go to definition |
| `gr` | references |
| `K` | hover |
| `<leader>rn` | rename symbol |
| `<leader>ca` | code action |
| `<leader>cf` | format buffer with LSP if supported |
| `<leader>fs` | edit LuaSnip snippet files |
| `<localleader>ec` | open config directory |
| `<localleader>es` | open snippets directory |

## Requirements

- Neovim **0.12.2**
- `rg` recommended for live grep
- optional: `latexmk` if you want external LaTeX compilation outside the default editing flow
- optional: `stylua` for formatting Lua manually

## Updating plugins

```vim
:PackUpdate
```

## Repo layout

```text
init.lua
lua/config/
lua/plugins/
lua/snippets/
lua/utils/
after/ftplugin/
```

## Validation

Useful checks while editing the config:

```bash
nvim --headless '+quitall'
stylua --check lua/ after/
```
