local M = {}

M.timings = {}

function M.get_total()
  local total = 0
  for _, time in pairs(M.timings) do
    total = total + time
  end
  return total
end

function M.get_count()
  return vim.tbl_count(M.timings)
end

function M.format_report()
  local lines = {}
  local entries = {}

  for name, time in pairs(M.timings) do
    table.insert(entries, { name = name, time = time })
  end

  table.sort(entries, function(a, b)
    return a.time > b.time
  end)

  local max_len = 0
  for _, entry in ipairs(entries) do
    max_len = math.max(max_len, #entry.name)
  end

  for _, entry in ipairs(entries) do
    local padded = entry.name .. string.rep(" ", max_len - #entry.name)
    table.insert(lines, string.format("  %s  %6.2f ms", padded, entry.time))
  end

  return lines
end

function M.show_report()
  local lines = M.format_report()
  table.insert(lines, 1, "Plugin Startup Times (sorted by load time):")
  table.insert(lines, 2, "")
  table.insert(lines, string.format("\n  Total: %d plugins loaded in %.2f ms", M.get_count(), M.get_total()))

  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("StartupTime", function()
  M.show_report()
end, { desc = "Show plugin startup times" })

return M
