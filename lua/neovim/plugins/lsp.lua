local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ln", ":NullLsInfo<CR>", opts)
end)

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sources = {
    {
      name = "nvim_lsp",
      entry_filter = function(entry, ctx)
        local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
        if kind == "Snippet" and ctx.prev_context.filetype == "java" then
          return false
        end
        if kind == "Text" then
          return false
        end
        return true
      end,
    },
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    ["<CR>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local confirm_opts = vim.deepcopy({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }) -- avoid mutating the original opts below
        local is_insert_mode = function()
          return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
        end
        if is_insert_mode() then -- prevent overwriting brackets
          confirm_opts.behavior = cmp.ConfirmBehavior.Insert
        end
        if cmp.confirm(confirm_opts) then
          return -- success, exit early
        end
      end

      fallback() -- if not exited early, always fallback
    end),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
})

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "bashls", "lua_ls", "gopls", "marksman" },
  handlers = {
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})
lsp_zero.setup_servers({ "bashls", "gopls", "marksman" })
