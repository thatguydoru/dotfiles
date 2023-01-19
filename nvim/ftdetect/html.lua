vim.cmd([[
  augroup html_tabs
      autocmd!
      au BufRead,BufNewFile *.html setlocal shiftwidth=2
      au BufRead,BufNewFile *.html setlocal tabstop=2
  augroup END
]])
