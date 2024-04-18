local definitions = {
  {
    "BufWritePre",
    {
      group = "_buf_prewriting",
      desc = "Kill tailing space",
      pattern = { "*" },
      command = [[%s/\s\+$//e]],
    },
  },
  {
    "VimLeavePre",
    {
      group = "_vim_settings",
      desc = "Save Session Before Leave Vim",
      pattern = "*.*",
      callback = function()
        local exists, dap = pcall(require, "dapui")
        if exists then
          dap.close()
        end
        vim.cmd(":NvimTreeClose")
        vim.cmd("mksession!" .. get_last_session_filepath())
      end,
    },
  },
  {
    "TextYankPost",
    {
      group = "_general_settings",
      pattern = "*",
      desc = "Highlight text on yank",
      callback = function()
        require("vim.highlight").on_yank({ higroup = "Search", timeout = 100 })
      end,
    },
  },
  {
    "FileType",
    {
      group = "_hide_dap_repl",
      pattern = "dap-repl",
      command = "set nobuflisted",
    },
  },
  {
    "FileType",
    {
      group = "_filetype_settings",
      pattern = "qf",
      command = "set nobuflisted",
    },
  },
  {
    "FileType",
    {
      group = "_filetype_settings",
      pattern = { "gitcommit", "markdown" },
      command = "setlocal wrap spell",
    },
  },
  {
    "FileType",
    {
      group = "_buffer_mappings",
      pattern = { "qf", "help", "man", "floaterm", "lspinfo", "lsp-installer", "null-ls-info" },
      command = "nnoremap <silent> <buffer> q :close<CR>",
    },
  },
  {
    "VimResized",
    {
      group = "_auto_resize",
      pattern = "*",
      command = "tabdo wincmd =",
    },
  },
  {
    "FileType",
    {
      group = "_filetype_settings",
      pattern = "alpha",
      callback = function()
        vim.cmd([[
            nnoremap <silent> <buffer> q :qa<CR>
            nnoremap <silent> <buffer> <esc> :qa<CR>
            set nobuflisted
          ]])
      end,
    },
  },
  {
    "FileType",
    {
      group = "_filetype_settings",
      pattern = "lir",
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
      end,
    },
  },
  {
    "ColorScheme",
    {
      group = "_colorscheme",
      callback = function()
        -- EyeLiner
        -- vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#FFA500", bold = true })
        -- vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#FFA500" })

        -- GitSigns
        vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#7FCC28" })
        vim.api.nvim_set_hl(0, "DiffChange", { fg = "#FFF700" })
        vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#F1502F" })

        -- IndentLine
        require("neovim.plugins.indentline").reset_indentline()
      end,
    },
  },
}

-- Define autocommands
for _, entry in ipairs(definitions) do
  local event_name = entry[1]
  local autocmd_opts = entry[2]
  if type(autocmd_opts.group) == "string" and autocmd_opts.group ~= "" then
    local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = autocmd_opts.group })
    if not exists then
      vim.api.nvim_create_augroup(autocmd_opts.group, {})
    end
  end
  vim.api.nvim_create_autocmd(event_name, autocmd_opts)
end
