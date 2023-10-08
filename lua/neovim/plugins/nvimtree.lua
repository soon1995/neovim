local nvim_tree = require("nvim-tree")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open"))
  vim.keymap.set("n", "[g", api.node.navigate.git.prev, opts("Prev Git"))
  vim.keymap.set("n", "]g", api.node.navigate.git.next, opts("Next Git"))
  vim.keymap.set("n", "]d", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  vim.keymap.set("n", "[d", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
end

local is_unix = vim.fn.has("unix") == 1
local is_macos = vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1
local is_wsl = vim.fn.has("wsl") == 1
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1
local function system_open_cmd()
  if is_wsl then
    return "wslview"
  elseif is_windows then
    return "cmd"
  elseif is_macos then
    return "open"
  elseif is_unix then
    return "xdg-open"
  end
end

local function system_open_args()
  if is_windows then
    return { "/c", "start", '""' }
  end
  return {}
end

nvim_tree.setup({
  on_attach = on_attach,
  diagnostics = {
    enable = true,
  },
  update_cwd = true,
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
  system_open = {
    cmd = system_open_cmd(),
    args = system_open_args(),
  },
  renderer = {
    icons = {
      show = {
        git = false,
      },
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "●",
        },
      },
    },
  },
})
