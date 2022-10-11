-- Keymaps --
-- reference: github.com/LunarVim/Neovim-from-scratch

local opts = { noremap = true, silent = true }
local bufopts = { noremap=true, silent=true, buffer=bufnr }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Toggle nvim-tree
keymap("n", "<leader>e", ":NeoTreeFocusToggle<CR>", opts)

-- LSP keymaps
keymap('n', '<leader>r', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>q', vim.diagnostic.setloclist, opts)

keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap('n', 'K', vim.lsp.buf.hover, bufopts)
keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
keymap('n', '<leader>k', vim.lsp.buf.signature_help, bufopts)
keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
keymap('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
keymap('n', 'gr', vim.lsp.buf.references, bufopts)
keymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
