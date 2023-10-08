---@diagnostic disable
-- vim: ft=lua tw=80

stds.nvim = {
  globals = {
    vim = { fields = { "g" } },
  },
  read_globals = {
    "vim",
    "join_paths",
    "get_cache_dir",
    "get_last_session_filepath",
    "require_clean",
    "has_value",
  },
}
std = "lua51+nvim"

-- Rerun tests only if their modification time changed.
cache = true

ignore = {
  "631", -- max_line_length
}
