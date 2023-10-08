local general_opts = { noremap = true, silent = true }

vim.cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

vim.keymap.set("i", "jk", "<ESC>", general_opts)
vim.keymap.set("i", "JK", "<ESC>", general_opts)
vim.keymap.set("i", "Jk", "<ESC>", general_opts)
vim.keymap.set("i", "kj", "<ESC>", general_opts)
vim.keymap.set("i", "hj", "<ESC>", general_opts)
vim.keymap.set("i", "jh", "<ESC>", general_opts)
vim.keymap.set("i", "<C-a>", "<ESC>I", general_opts)
vim.keymap.set("i", "<C-e>", "<ESC>A", general_opts)
vim.keymap.set("i", "$$", "<ESC>A ", general_opts)
vim.keymap.set("i", "ooo", "<ESC>o", general_opts)

vim.keymap.set("n", "J", "mzJ`z", general_opts)
vim.keymap.set("n", "n", "nzzzv", general_opts)
vim.keymap.set("n", "N", "Nzzzv", general_opts)
vim.keymap.set("n", "<C-c>", "<cmd>bd<CR>", general_opts)

-- Surround word
vim.keymap.set("n", "()", "ciw()<ESC>P", general_opts)
vim.keymap.set("n", "[]", "ciw[]<ESC>P", general_opts)
vim.keymap.set("n", "{}", "ciw{}<ESC>P", general_opts)
vim.keymap.set("n", '""', 'ciw""<ESC>P', general_opts)
vim.keymap.set("n", "''", "ciw''<ESC>P", general_opts)
vim.keymap.set("n", "``", "ciw``<ESC>P", general_opts)
vim.keymap.set("n", "($", "ebC()<ESC>P", general_opts)
vim.keymap.set("n", "[$", "ebC[]<ESC>P", general_opts)
vim.keymap.set("n", "{$", "ebC{}<ESC>P", general_opts)
vim.keymap.set("n", '"$', 'ebC""<ESC>P', general_opts)
vim.keymap.set("n", "'$", "ebC''<ESC>P", general_opts)
vim.keymap.set("n", "`$", "ebC``<ESC>P", general_opts)

-- Replace with last registry
vim.keymap.set("n", ")p", "ci)<C-r>0<ESC>", general_opts)
vim.keymap.set("n", "]p", "ci]<C-r>0<ESC>", general_opts)
vim.keymap.set("n", "}p", "ci}<C-r>0<ESC>", general_opts)
vim.keymap.set("n", '"p', 'ci"<C-r>0<ESC>', general_opts)
vim.keymap.set("n", "'p", "ci'<C-r>0<ESC>", general_opts)
vim.keymap.set("n", "`p", "ci`<C-r>0<ESC>", general_opts)
vim.keymap.set("n", "dp", "ciw<C-r>0<ESC>", general_opts)

-- Paste
vim.keymap.set("n", "<Space>p", '"+p', general_opts) -- Paste normal mode
vim.keymap.set("v", "<C-v>", '"+P', general_opts) -- Paste visual mode
vim.keymap.set("c", "<C-v>", "<C-R>+", general_opts) -- Paste command mode
vim.keymap.set("t", "<C-v>", '<C-\\><C-N>"+pi<Left><Right>', general_opts) -- Paste command mode
vim.keymap.set("i", "<C-v>", '<ESC>"+pa', general_opts) -- Paste insert mode

-- Window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", general_opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", general_opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", general_opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", general_opts)

-- Resize Window
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", general_opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", general_opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", general_opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true }, general_opts)

-- Shorten Navigation
vim.keymap.set("n", "<C-u>", "9k", general_opts)
vim.keymap.set("n", "<C-d>", "9j", general_opts)

-- Move between buffer
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", general_opts)
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", general_opts)

-- Move Line
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", general_opts)
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", general_opts)

vim.keymap.set("v", "<", "<gv", general_opts)
vim.keymap.set("v", ">", ">gv", general_opts)

-- QuickFix
vim.keymap.set("n", "]q", ":cnext<CR>", general_opts)
vim.keymap.set("n", "[q", ":cprev<CR>", general_opts)
vim.keymap.set("n", "<C-q>", ":call QuickFixToggle()<CR>", general_opts)

-- Surround word
vim.keymap.set("v", "()", "c()<ESC>P", general_opts)
vim.keymap.set("v", "[]", "c[]<ESC>P", general_opts)
vim.keymap.set("v", "{}", "c{}<ESC>P", general_opts)
vim.keymap.set("v", '""', 'c""<ESC>P', general_opts)
vim.keymap.set("v", "''", "c''<ESC>P", general_opts)
vim.keymap.set("v", "``", "c``<ESC>P", general_opts)

-- navigate tab completion with <c-j> and <c-k>
-- runs conditionally
vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })
