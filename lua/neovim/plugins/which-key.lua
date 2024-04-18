local whichkey = require("which-key")

whichkey.setup({
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = false, -- misc bindings to work with windows
      z = false, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
    spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
  },
  icons = {
    separator = "",
    group = " ",
  },
})
require("which-key").register({
  [";"] = { ":Alpha<CR>", "Open Dashboard" },
  z = { ":ZenMode<CR>", "ZenMode" },
  w = { ":w!<CR>", "Save" },
  q = { ":qa<CR>", "Quit" },
  c = { ":bd<CR>", "Kill Current Buffer" },
  C = { ":close<CR>", "Kill Current Window" },
  o = { ":only<CR>", "Kill Other Splits" },
  v = { ":vsplit<CR>", "V Split" },
  h = { ":HopChar1<CR>", "Hop Buffer" },
  H = { ":nohl<CR>", "No Highlight" },
  e = { ":NvimTreeToggle<CR>", "Explorer" },
  E = { ":AerialToggle<CR>", "Code Outline" },
  f = { ":Telescope find_files<CR>", "Find Files" },
  F = { ":Telescope live_grep<CR>", "Find Texts" },
  s = {
    name = "Search",
    h = { ":Telescope help_tags<CR>", "Help" },
    H = { ":Telescope highlights<CR>", "Highlight groups" },
    j = { ":Telescope jumplist<CR>", "Jumplists" },
    m = { ":Telescope marks<CR>", "Marks" },
    M = { ":Telescope man_pages<CR>", "Man Pages" },
    r = { ":Telescope oldfiles<CR>", "Open Recent File" },
    R = { ":Telescope registers<CR>", "Registers" },
    k = { ":Telescope keymaps<CR>", "Keymaps" },
    c = { ":Telescope command_history<CR>", "Command History" },
    C = { ":Telescope commands<CR>", "Commands" },
    l = { ":Telescope resume<CR>", "Resume last search" },
    d = { ":Telescope diagnostics<CR>", "Diagnostics" },
    D = { ":Telescope docker<CR>", "Docker" },
    Q = { ":Telescope quickfixhistory<CR>", "Quick Fix History" },
    s = { ":Telescope lsp_document_symbols<CR>", "Document Symbols" },
    S = { ":Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols" },
    n = { ":Telescope notify<CR>", "Notify" },
    b = { ":Telescope harpoon marks<CR>", "Buffer Marks" },
  },
  b = {
    name = "Buffer",
    c = { ":bd<CR>", "Kill Buffer" },
    h = { ":BufferLineCloseLeft<CR>", "Kill Left Buffers" },
    l = { ":BufferLineCloseRight<CR>", "Kill Right Buffers" },
    p = { ":BufferLinePick<CR>", "Pick Buffer" },
    f = { ":Telescope buffers<CR>", "Find Buffer" },
    a = { ":lua require('harpoon.mark').add_file()<CR>", "Mark File" },
  },
  g = {
    name = "Git",
    g = { ":lua lazygit_toggle()<CR>", "Lazygit" },
    j = { ":lua require 'gitsigns'.next_hunk({navigation_message = false})<CR>", "Next Hunk" },
    k = { ":lua require 'gitsigns'.prev_hunk({navigation_message = false})<CR>", "Prev Hunk" },
    l = { ":lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    s = { ":lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
    p = { ":lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { ":lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    u = { ":lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
    o = { ":Telescope git_status<CR>", "Open changed Files" },
    b = { ":Telescope git_branches<CR>", "Git Branches" },
  },
  l = {
    name = "Language",
    j = { vim.diagnostic.goto_next, "Next Diagnostic" },
    k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
    a = { vim.lsp.buf.code_action, "Actions" },
    f = { vim.lsp.buf.format, "Format" },
    r = { vim.lsp.buf.rename, "Rename" },
    i = { ":LspInfo<CR>", "Lsp Info" },
    n = { ":NullLsInfo<CR>", "NullLs Info" },
    I = { ":Mason<CR>", "Mason Info" },
  },
  t = {
    name = "Theme",
    o = {
      function()
        color_my_dark_pencils("onedark")
      end,
      "One Dark Cool",
    },
    i = {
      function()
        color_my_dark_pencils("ironman_dark")
      end,
      "Ironman Dark",
    },
    m = {
      function()
        color_my_dark_pencils("matrix2")
      end,
      "Matrix 2",
    },
    r = {
      name = "Rose Pine",
      l = {
        function()
          color_my_light_pencils("rose-pine")
        end,
        "Rose Pine Light",
      },
      d = {
        function()
          color_my_dark_pencils("rose-pine")
        end,
        "Rose Pine Dark",
      },
    },
    g = {
      name = "Gruvbox",
      l = {
        function()
          color_my_light_pencils("gruvbox")
        end,
        "Gruvbox Light",
      },
      d = {
        function()
          color_my_dark_pencils("gruvbox")
        end,
        "Gruvbox Dark",
      },
    },
  },
  a = {
    name = "Ask ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
  },
  d = {
    o = {
      function()
        require("dapui").toggle()
      end,
      "Toggle Debug UI",
    },
    b = { ":DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
    s = { ":DapContinue<CR>", "Continue Debug" },
    c = { ":DapTerminate<CR>", "Bye" },
  },
}, { prefix = "<leader>" })
