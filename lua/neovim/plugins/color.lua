local VIM_JIMBOTHEMES = { "matrix2", "ironman_dark" }

VIM_JIMBOTHEMES.correct = function(theme)
  if not has_value(VIM_JIMBOTHEMES, theme) then
    return
  end
  -- Without this, status line show '^^^^^^^^^^^^^^' in this colortheme.
  vim.api.nvim_set_hl(0, "StatusLineNC", {})

  vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true })
  vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true })
  vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true })
  vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true })
end

function _G.color_my_pencils(theme)
  theme = theme or "ironman_dark"
  vim.opt.background = "dark"
  vim.opt.termguicolors = true
  vim.cmd.colorscheme(theme)
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = "_colorscheme",
  callback = function()
    VIM_JIMBOTHEMES.correct(vim.g.colors_name)
  end,
})

_G.color_my_pencils("ironman_dark")
