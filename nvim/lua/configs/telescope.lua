local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim',
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      previewer = false,
      prompt_title = false,
    },
    buffers = {
      theme = 'dropdown',
      previewer = false,
      prompt_title = false,
      mappings = {
        i = {
          ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
        },
      }
    },
    help_tags = {
      theme = 'dropdown',
      previewer = false,
      prompt_title = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

telescope.load_extension('fzf')
