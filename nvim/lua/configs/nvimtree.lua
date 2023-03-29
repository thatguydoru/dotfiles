local api = require('nvim-tree.api')

local Event = api.events.Event
api.events.subscribe(Event.FileCreated, function(data)
  vim.cmd(':e' .. data['fname'])
end)

require('nvim-tree').setup({
  hijack_unnamed_buffer_when_opening = true,
  view = {
    adaptive_size = true,
    side = 'right',
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
      close_window = true
    }
  },
})
