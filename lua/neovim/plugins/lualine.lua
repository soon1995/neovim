local lualine = require("lualine")

lualine.setup({
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    globalstatus = true,
    disabled_filetypes = { "alpha" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding" },
    lualine_y = { "progress" },
    lualine_z = { "searchcount", "location", "os.date('%X')" },
  },
})
