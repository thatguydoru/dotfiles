vim.cmd([[
  augroup tsx_tabs
      autocmd!
      au BufRead,BufNewFile *.tsx setlocal shiftwidth=2
      au BufRead,BufNewFile *.tsx setlocal tabstop=2
  augroup END
]])
