local uv = vim.loop
local path_sep = uv.os_uname().version:match("Windows") and "\\" or "/"
local cache_dir = os.getenv("MY_NEOVIM_CACHE_DIR") or vim.fn.stdpath("cache")

function _G.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

function _G.get_cache_dir()
  return cache_dir
end

local session_dir = join_paths(get_cache_dir(), "session")
local last_session_path = join_paths(session_dir, "last.vim")
function _G.get_last_session_filepath()
  return last_session_path
end

local function exists(path)
  return vim.fn.empty(vim.fn.glob(path)) == 0
end

local function init_dir()
  -- cache dir
  uv.fs_mkdir(cache_dir, 448)

  local init_session_file = function()
    if exists(last_session_path) then
      return
    end

    uv.fs_mkdir(session_dir, 448)
    local file = uv.fs_open(last_session_path, "a", 438)
    if file ~= nil then
      uv.fs_close(file)
    end
  end
  init_session_file()
end

init_dir()
