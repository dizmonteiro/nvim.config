-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "CurSearch" })
  end,
})

-- Restore cursor position
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*' },
  callback = function()
    vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Override mapping in quickfix window
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    -- Unmap <CR> in quickfix window (if needed)
    vim.keymap.set('n', '<CR>', '<CR>', { buffer = true, desc = 'Default Enter in quickfix' })
    -- Enable cursorline only in quickfix window
    vim.opt_local.cursorline = true
  end,
})

vim.api.nvim_create_user_command("FCN", function()
  vim.cmd("silent! vimgrep /FCN=/gj %")
  vim.cmd("copen")
end, { desc = "Search for FCN= in current buffer" })

-- This autocmd listens for the 'PackChanged' event,
-- which is triggered by the vim.pack after installing or updating plugins.
-- and download the prebuilt binary for blink.cmp from GitHub releases based on the version tag.
local hooks = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  local path = ev.data.path

  -- Only run for blink.cmp on install or update
  if name == 'blink.cmp' and (kind == 'install' or kind == 'update') then
    -- 1. Get the version tag from the git repo
    -- We use 'git describe --tags --abbrev=0' to get the closest tag (e.g., "v0.11.0")
    local git_cmd = vim.system(
      { 'git', 'describe', '--tags', '--abbrev=0' },
      { text = true, cwd = path }
    ):wait()

    if git_cmd.code ~= 0 then
      vim.notify("blink.cmp: Could not determine version tag. Binary download skipped.", vim.log.levels.ERROR)
      return
    end

    -- Clean up whitespace (remove newline)
    local version = git_cmd.stdout:gsub("%s+", "")

    -- 2. Define Paths and URLs
    -- Note: We use 'path' from the event to ensure we target the correct folder
    -- regardless of whether it is in /start/ or /opt/
    local target_dir = path .. "/target/release"
    local target_file = target_dir .. "/libblink_cmp_fuzzy.dll"
    local download_url = "https://github.com/Saghen/blink.cmp/releases/download/" ..
        version .. "/x86_64-pc-windows-msvc.dll"

    -- 3. Create the target directory if it doesn't exist
    vim.fn.mkdir(target_dir, "p")

    -- 4. Download using Curl
    vim.notify("blink.cmp: Downloading prebuilt binary for " .. version .. "...", vim.log.levels.INFO)

    local curl_cmd = vim.system({
      'curl',
      '-L',              -- Follow redirects (GitHub releases redirect)
      '-o', target_file, -- Output file
      download_url
    }):wait()

    -- 5. Verify success
    if curl_cmd.code == 0 then
      vim.notify("blink.cmp: Binary installed successfully.", vim.log.levels.INFO)
    else
      vim.notify("blink.cmp: Download failed!\n" .. (curl_cmd.stderr or ""), vim.log.levels.ERROR)
    end
  end

  -- Run for blink.pairs
  if name == 'blink.pairs' and (kind == 'install' or kind == 'update') then
    -- 1. Get the exact tag (e.g., "v0.4.0")
    local git_cmd = vim.system({ 'git', 'describe', '--tags', '--abbrev=0' }, { text = true, cwd = path }):wait()
    if git_cmd.code ~= 0 then
      vim.notify("blink.pairs: Could not determine version tag.", vim.log.levels.ERROR)
      return
    end

    local version = git_cmd.stdout:gsub("%s+", "")

    -- 2. Define URLs and Paths
    -- Source: Generic name on GitHub Releases
    local url = "https://github.com/Saghen/blink.pairs/releases/download/" .. version .. "/x86_64-pc-windows-msvc.dll"

    -- Destination: The author usually expects "lib" prefix even on Windows for these plugins
    local target_dir = path .. "/target/release"
    local target_file = target_dir .. "/libblink_pairs.dll"

    -- 3. Create Directory
    vim.fn.mkdir(target_dir, "p")

    -- 4. Download
    vim.notify("blink.pairs: Syncing binary for " .. version .. "...", vim.log.levels.INFO)

    local ret = vim.system({
      'curl',
      '-L',     -- Follow redirects
      '--fail', -- Fail on 404 errors
      '-o', target_file,
      url
    }):wait()

    -- 5. Verify
    if ret.code == 0 then
      vim.notify("blink.pairs: Binary installed successfully.", vim.log.levels.INFO)
    else
      vim.notify("blink.pairs: Download failed for " .. version .. "\nCheck if release asset exists.",
        vim.log.levels.ERROR)
    end
  end
end

-- Register the Autocmd
vim.api.nvim_create_autocmd('PackChanged', { callback = hooks })
