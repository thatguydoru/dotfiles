-- Neovim Options --

local opts = {
    -- indent and wrap
    shiftwidth = 4,
    expandtab = true,
    tabstop = 4,
    smartindent = true,
    wrap = false,
    --whichwrap = '<,>,[,],h,l',
    -- search
    incsearch = true,
    hlsearch = false,
    ignorecase = true,
    smartcase = true,
    -- column
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = 'yes',
    -- backup
    swapfile = false,
    backup = false,
    writebackup = false,
    -- cursor and scroll
    cursorline = true,
    scrolloff = 8,
    sidescrolloff = 8,
    -- splits
    splitbelow = true,
    splitright = true,
    -- misc
    termguicolors = true,
    updatetime = 100,
    fileencoding = 'utf-8',
    cmdheight = 0,
    clipboard = 'unnamedplus',
    showcmd = false,
    showmode = false,
    laststatus = 3,
    hidden = true,
}

for k, v in pairs(opts) do
    vim.o[k] = v
end
