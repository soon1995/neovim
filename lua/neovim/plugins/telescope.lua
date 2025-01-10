local telescope = require("telescope")

local empty_border_char = {
  prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
  results = { " ", " ", " ", " ", " ", " ", " ", " " },
  preview = { " ", " ", " ", " ", " ", " ", " ", " " },
}

local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
telescope.setup({
  file_previewer = previewers.vim_buffer_cat.new,
  grep_previewer = previewers.vim_buffer_vimgrep.new,
  qflist_previewer = previewers.vim_buffer_qflist.new,
  file_sorter = sorters.get_fuzzy_file,
  generic_sorter = sorters.get_generic_fuzzy_sorter,
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,
        ["<C-u>"] = actions.results_scrolling_up,
        ["<C-d>"] = actions.results_scrolling_down,
      },
    },
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        width = 0.8,
        preview_width = 0.5,
      },
      scroll_speed = 9, -- Scroll for 'x' lines
    },
    borderchars = empty_border_char,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git/",
    },
    path_display = { "smart" },
    winblend = 0,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  },
  pickers = {
    find_files = {
      previewer = false,
      layout_strategy = "center",
      sorting_strategy = "ascending",
      layout_config = {
        anchor = "CENTER",
        prompt_position = "top",
        height = 0.5,
        width = 0.6,
      },
      borderchars = empty_border_char,
    },
    live_grep = {
      only_sort_text = true,
    },
    git_files = {
      hidden = true,
      previewer = false,
      show_untracked = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    bookmarks = {
      selected_browser = "vivaldi",
      config_dir = "/mnt/c/Users/Alex Soon Ai Lin/AppData/Local/Vivaldi/User Data",
      url_open_command = "wslview",
    },
  },
})
telescope.load_extension("fzf")
telescope.load_extension("docker")
telescope.load_extension("projects")
telescope.load_extension("notify")
telescope.load_extension("bookmarks")
telescope.load_extension("harpoon")
