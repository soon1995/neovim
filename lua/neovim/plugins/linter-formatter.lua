local null_ls = require("null-ls")

local diagnostic = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
-- local code_action = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    formatting.prettierd,
    -- go
    diagnostic.golangci_lint,
    formatting.gofmt,
    formatting.goimports,
    -- lua
    formatting.stylua,
  },
})
