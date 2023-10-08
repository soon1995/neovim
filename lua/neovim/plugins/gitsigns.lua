local gitsigns = require("gitsigns")

local ui = {
  LineLeft = "▏",
  BoldLineLeft = "▎",
  Triangle = "",
}
gitsigns.setup({
  signs = {
    add = { text = ui.BoldLineLeft },
    change = { text = ui.BoldLineLeft },
    delete = { text = ui.Triangle },
    topdelete = { text = ui.Triangle },
    changedelete = { text = ui.BoldLineLeft },
    untracked = { text = ui.LineLeft },
  },
})
