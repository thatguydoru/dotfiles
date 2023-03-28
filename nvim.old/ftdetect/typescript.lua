vim.cmd([[
  augroup ts_tabs
      autocmd!
      au BufRead,BufNewFile *.ts setlocal shiftwidth=2
      au BufRead,BufNewFile *.ts setlocal tabstop=2
  augroup END
]])
