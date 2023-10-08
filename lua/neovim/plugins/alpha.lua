local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = _G.PIKACHU

dashboard.section.buttons.val = {
  dashboard.button("s", "  Last Session", ":source " .. get_last_session_filepath() .. "<CR>"),
  dashboard.button("p", "  Projects", ":Telescope projects<CR>"),
  dashboard.button("f", "  Files", ":Telescope find_files <CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("c", "  Nvim Plugin Config", ":e ~/.config/nvim/lua/neovim/plugin.lua<CR>G"),
  dashboard.button("q", "  Bye bye", ":qa<CR>"),
}

local function footer()
  return "Soon to be PRO!"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
