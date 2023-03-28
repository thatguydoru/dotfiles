local options = { noremap = true, silent = true }
local map = vim.keymap.set
local builtin = require('telescope.builtin')

-- Space as leader
map('', '<Space>', '<Nop>', options)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-------- NORMAL MODE --------
-- window nav
map('n', '<A-h>', '<C-w>h', options)
map('n', '<A-j>', '<C-w>j', options)
map('n', '<A-k>', '<C-w>k', options)
map('n', '<A-l>', '<C-w>l', options)
-- buffer nav
map('n', '<S-l>', ':bnext<CR>', options)
map('n', '<S-h>', ':bprev<CR>', options)
-- window resize
map('n', '<C-k>', ':resize -2<CR>', options)
map('n', '<C-j>', ':resize +2<CR>', options)
map('n', '<C-h>', ':vertical resize -2<CR>', options)
map('n', '<C-l>', ':vertical resize +2<CR>', options)
-- Lazy, the plugin manager
map('n', '<leader>l', ':Lazy<CR>', options)
-- NvimTree
map('n', '<leader><Tab>', ':NvimTreeToggle<CR>', options)
-- Telescope
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})
map('n', '<leader>fd', builtin.diagnostics, {})
map('n', '<leader>fa', builtin.builtin, {})

-------- VISUAL MODE --------
map('v', '<', '<gv', options)
map('v', '>', '>gv', options)
