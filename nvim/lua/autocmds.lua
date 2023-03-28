local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
  return vim.api.nvim_create_augroup('doru_' .. name, { clear = true })
end

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])
-- don't auto comment on new lines
vim.cmd([[au BufEnter * set fo-=c fo-=o]])

local ftpatterns = {
  'lua',
  'typescript',
  'typescriptreact',
  'html',
  'css',
  'scss'
}
autocmd('FileType', {
  group = augroup('double_space'), pattern = ftpatterns,
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.expandtab =  true
    vim.opt.tabstop = 2
    vim.opt.smartindent = true
    vim.opt.wrap = false
  end
})

-- auto close nvimtree on exit
autocmd('QuitPre', {
  callback = function()
    vim.cmd('NvimTreeClose')
  end,
})
