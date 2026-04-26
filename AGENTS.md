# AGENTS.md - Neovim Configuration Guidelines

This repository is a **minimal, native-first Neovim 0.12.2 config** optimized for Bosch AI Safety work.

## Project intent

Bias changes toward:

- Python and PyTorch engineering
- C/C++/CUDA when lower-level performance or kernel work is active
- Markdown planning and research notes
- LaTeX math writing
- YAML/Bash/Lua config maintenance

Avoid turning the config back into a broad plugin collection. Native Neovim should be the default choice whenever it is good enough.

## Current architecture

```text
init.lua
lua/
  config/
    options.lua
    keymaps.lua
    autocmds.lua
    hlgroups.lua
  plugins/
    lsp.lua
    treesitter.lua
    mini.lua
    luasnip.lua
    cmp.lua
    latex.lua
  snippets/
    luasnip/
  utils/
    ts_utils.lua
    tex_utils.lua
    luasnip-snip_env/
after/
  ftplugin/
nvim-pack-lock.json
stylua.toml
.luarc.json
```

## Design rules

1. Prefer built-in Neovim features first: `vim.pack`, `vim.lsp`, `vim.treesitter`, diagnostics, quickfix/location list, native statusline.
2. Only keep plugins that clearly improve the core role workflow.
3. Do not add purely cosmetic UI layers unless there is a strong functional reason.
4. New language/tooling support should be justified against the actual role focus.

## Active plugin set

| File | Purpose |
| --- | --- |
| `plugins/lsp.lua` | native LSP setup for role-relevant languages |
| `plugins/treesitter.lua` | native Treesitter startup when parsers are present |
| `plugins/mini.lua` | file explorer, picker, pairs, surround |
| `plugins/luasnip.lua` | snippet engine and snippet loader |
| `plugins/cmp.lua` | completion with blink.cmp and lazydev |
| `plugins/latex.lua` | VimTeX editing support without mandatory compiler integration |

## Preferred workflows

- file navigation with `mini.files`
- search and selection with `mini.pick`
- diagnostics with native `vim.diagnostic`
- formatting with LSP when available
- snippets for Markdown/TeX math writing
- C/C++/CUDA through native `clangd` when the executable is installed

## Build, lint, and validation

```bash
nvim --headless '+quitall'
stylua --check lua/ after/
lua-language-server --check lua/
```

There is no formal automated test suite.

## Key implementation patterns

### Native LSP

```lua
vim.lsp.config("ruff", {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", ".git" },
})

if vim.fn.executable("ruff") == 1 then
  vim.lsp.enable("ruff")
end
```

### Native Treesitter

```lua
local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
if lang and vim.treesitter.language.add(lang) then
  vim.treesitter.start(buf, lang)
end
```

### Plugin setup

```lua
vim.pack.add({
  { src = "https://github.com/owner/repo", name = "plugin-name" },
})

require("plugin-name").setup({})
```

Prefer simple setup over elaborate lazy-loading unless startup cost or side effects justify it.

## Snippets

- Snippets live in `lua/snippets/luasnip/`
- `utils.ts_utils` is the primary math-context helper
- TeX buffers can fall back to VimTeX math detection when a parser is unavailable

## Editing guidance

- Keep changes surgical and readable
- Remove dead code when simplifying
- Update `README.md`, `AGENTS.md`, and `nvim-pack-lock.json` when the plugin surface changes
- Do not add back Mason, dashboard, custom statusline, or extra UI plugins unless explicitly requested
