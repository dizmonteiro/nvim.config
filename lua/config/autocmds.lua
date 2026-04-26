vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking",
  group = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "CurSearch" })
  end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Override mapping in quickfix window
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    -- Unmap <CR> in quickfix window (if needed)
    vim.keymap.set("n", "<CR>", "<CR>", { buffer = true, desc = "Default Enter in quickfix" })
    -- Enable cursorline only in quickfix window
    vim.opt_local.cursorline = true
  end,
})

local hooks = function(ev)
  if vim.fn.has("win32") == 0 or vim.fn.executable("curl") == 0 then
    return
  end

  local name, kind = ev.data.spec.name, ev.data.kind
  local path = ev.data.path

  if name == "blink.cmp" and (kind == "install" or kind == "update") then
    local git_cmd = vim.system({ "git", "describe", "--tags", "--abbrev=0" }, { text = true, cwd = path }):wait()

    if git_cmd.code ~= 0 then
      vim.notify("blink.cmp: Could not determine version tag. Binary download skipped.", vim.log.levels.ERROR)
      return
    end

    local version = git_cmd.stdout:gsub("%s+", "")
    local target_dir = path .. "/target/release"
    local target_file = target_dir .. "/libblink_cmp_fuzzy.dll"
    local download_url = "https://github.com/Saghen/blink.cmp/releases/download/"
      .. version
      .. "/x86_64-pc-windows-msvc.dll"

    vim.fn.mkdir(target_dir, "p")

    local curl_cmd = vim
      .system({
        "curl",
        "-L",
        "--fail",
        "-o",
        target_file,
        download_url,
      })
      :wait()

    if curl_cmd.code == 0 then
      vim.notify("blink.cmp: Binary installed successfully.", vim.log.levels.INFO)
    else
      vim.notify("blink.cmp: Download failed!\n" .. (curl_cmd.stderr or ""), vim.log.levels.ERROR)
    end
  end
end

vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })
