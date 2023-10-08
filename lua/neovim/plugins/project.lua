local project_nvim = require("project_nvim")

project_nvim.setup({
  manual_mode = false,
  ---@usage Methods of detecting the root directory
  --- Allowed values: **"lsp"** uses the native neovim lsp
  --- **"pattern"** uses vim-rooter like glob pattern matching. Here
  --- order matters: if one is not detected, the other is used as fallback. You
  --- can also delete or rearangne the detection methods.
  -- detection_methods = { "lsp", "pattern" },
  --- NOTE: lsp detection will get annoying with multiple langs in one project
  detection_methods = { "pattern" },
  ---@usage patterns used to detect root dir, when **"pattern"** is in detection_methods
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
  ---@ Show hidden files in telescope when searching for files in a project
  show_hidden = false,
  ---@usage When set to false, you will get a message when project.nvim changes your directory.
  -- When set to false, you will get a message when project.nvim changes your directory.
  silent_chdir = true,
  exclude_dirs = { "~/go/pkg/*" },
  ---@usage list of lsp client names to ignore when using **lsp** detection. eg: { "efm", ... }
  ignore_lsp = {},
  datapath = get_cache_dir(),
})
