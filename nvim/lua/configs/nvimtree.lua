vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  view = {
    adaptive_size = true,
    side = 'right',
    cursorline = false,
  },
  renderer = {
    group_empty = false,
    indent_markers = {
      enable = false,
      inline_arrows = false,
    },
    highlight_git = false,
  },
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
    remove_file = {
      close_window = false,
    }
  },
})
