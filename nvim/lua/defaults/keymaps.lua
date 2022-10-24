local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Space as leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MODE --
-- window nav
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- buffer nav
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

-- window resize
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- VISUAL MODE --
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- PLUGIN KEYMAPS --
-- treeeeeeeeeeeeee
keymap("n", "<leader>q", ":NvimTreeToggle<CR>", opts)

-- teleeeeeescooope
local builtin = require('telescope.builtin')
keymap("n", "<leader>w", builtin.find_files, opts)
keymap("n", "<leader>e", builtin.live_grep, opts)
keymap("n", "<leader>r", builtin.buffers, opts)
keymap("n", "<leader>a", builtin.help_tags, opts)
keymap("n", "<leader>s", builtin.diagnostics, opts)
keymap("n", "<leader>d", builtin.builtin, opts)

-- LSP Diagnostics
keymap("n", "[p", vim.diagnostic.goto_prev, opts)
keymap("n", "]p", vim.diagnostic.goto_next, opts)
