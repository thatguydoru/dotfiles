local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('doru_' .. name, { clear = true })
end

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])
-- don't auto comment on new lines
vim.cmd([[au BufEnter * set fo-=c fo-=o]])

autocmd('FileType', {
  group = augroup('double_space'),
  pattern = { 'markdown', 'ocaml', 'lua', 'vue' },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.tabstop = 2
    vim.opt.smartindent = true
    vim.opt.wrap = false
  end
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('wgsl'),
  pattern = { '*.wgsl' },
  callback = function()
    vim.opt.filetype = 'wgsl'
  end
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('typst'),
  pattern = { '*.typ' },
  callback = function()
    vim.opt.filetype = 'typst'
  end
})

-- Nvim Tree autocmds --
-- auto close nvimtree on exit
autocmd('QuitPre', {
  callback = function() vim.cmd('NvimTreeClose') end,
})
-- on nvim's start, set its cwd to the specified directory
autocmd('VimEnter', {
  group = augroup('tree_on_enter'),
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not directory and not no_name then return end

    if directory then
      vim.cmd.cd(data.file)
    end

    require('nvim-tree.api').tree.open()
  end
})
