-- globals
vim.g.zig_fmt_autosave = 0

local options = {
	-- indent and wrap
	shiftwidth = 4,
	expandtab = false,
	tabstop = 4,
	smartindent = true,
	wrap = false,
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
	-- colorcolumn = '80',
	-- backup
	swapfile = false,
	backup = false,
	writebackup = false,
	-- cursor and scroll
	cursorline = false,
	scrolloff = 8,
	sidescrolloff = 8,
	-- splits
	splitbelow = true,
	splitright = true,
	-- misc
	termguicolors = true,
	updatetime = 100,
	fileencoding = 'utf-8',
	cmdheight = 1,
	clipboard = 'unnamedplus',
	showcmd = false,
	showmode = false,
	laststatus = 3,
	hidden = true,
	list = true,
	completeopt = 'noselect,noinsert,menu,menuone',
}


for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.listchars:append "tab:   "
vim.opt.listchars:append "trail: "
vim.opt.shortmess:append 'cI'
