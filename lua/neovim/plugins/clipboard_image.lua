require("clipboard-image").setup({
  default = {
    img_name = function()
      vim.fn.inputsave()
      local name = vim.fn.input("Name: ")
      vim.fn.inputrestore()
      return name
    end,
    img_dir = { "%:p:h", "images" },
    img_dir_txt = "images",
  },
  markdown = {
    img_handler = function(img)
      local title_case_name = string.gsub(img.name, "(%l)(%w+)", function(a, b)
        return string.upper(a) .. b
      end)
      title_case_name = string.gsub(title_case_name, "-", " ")
      vim.cmd("normal! f[a" .. title_case_name)
    end,
  },
})
