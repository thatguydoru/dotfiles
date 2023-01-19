vim.cmd([[
  augroup css_tabs
      autocmd!
      au BufRead,BufNewFile *.css setlocal shiftwidth=2
      au BufRead,BufNewFile *.css setlocal tabstop=2
  augroup END
]])
