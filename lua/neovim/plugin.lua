-- setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- opts = {} --this is equalent to setup({}) function
require("lazy").setup({
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "eandrju/cellular-automaton.nvim" }, -- Useless but execute aesthetically pleasing, cellular automaton animations
  -- Alpha Dashboard -- Welcome Screen
  { "goolord/alpha-nvim" },
  -- Telescope
  { "nvim-telescope/telescope.nvim", tag = "0.1.3" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "lpoto/telescope-docker.nvim" },
  { "ahmedkhalf/project.nvim" },
  -- Color Theme
  { "norcalli/nvim-colorizer.lua" }, -- Colorize Buffer
  { "rose-pine/neovim", name = "rose-pine" },
  { "i3d/vim-jimbothemes" },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = ":TSUpdate",
  },
  { "numToStr/Comment.nvim", opts = {} },
  -- LSP Support
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  { "neovim/nvim-lspconfig" },
  -- Linter and Formatter
  { "jose-elias-alvarez/null-ls.nvim" },
  -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  -- File Explorer
  { "nvim-tree/nvim-tree.lua" },
  -- Bufferline
  { "akinsho/bufferline.nvim" },
  -- Lualine
  { "nvim-lualine/lualine.nvim" },
  -- Quick Navigation
  { "phaazon/hop.nvim", opts = {} }, -- hop around buffer
  { "jinh0/eyeliner.nvim" }, -- highlight unique char for F or f quicker
  { "stevearc/aerial.nvim", opts = {} }, -- function explorer to jump to function quicker
  -- Which Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- Go To Preview
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({ default_mappings = true })
    end,
  },
  -- GitSigns
  { "lewis6991/gitsigns.nvim" },
  -- Indent Line
  { "lukas-reineke/indent-blankline.nvim", version = "v2.20.8" },
  -- Noice
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      render = "wrapped-compact",
      timeout = 3000,
      level = vim.log.levels.INFO,
      top_down = false,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    },
  },
  -- Toggle Terminal
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  -- Winbar
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = { exclude_filetypes = { "netrw", "toggleterm" } },
  },
  -- Markdown Helpers
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "jakewvincent/mkdnflow.nvim" },
  { "Ttayu/clipboard-image.nvim", branch = "bugfix/wsl-error" },
  -- WakaTime -- Record Spending Hour in Neovim
  { "wakatime/vim-wakatime" },
  -- ZenMode -- Kill Distraction
  { "folke/zen-mode.nvim", opts = {} },
  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
})
