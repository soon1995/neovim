local bufferline = require("bufferline")

vim.opt.termguicolors = true
bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return icon .. count
    end,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "slant",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true, -- use a "true" to enable the default, or set your own character
      },
    },
  },
})
