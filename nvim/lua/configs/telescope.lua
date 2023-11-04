local telescope = require('telescope')
local actions = require('telescope.actions')

local function noprev()
  return {
    theme = 'dropdown',
    previewer = false,
    prompt_title = false,
  }
end

local buffers = noprev()
buffers.mappings = {
  i = {
    ['<c-d>'] = actions.delete_buffer + actions.move_to_top,
  },
}

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
    find_files = noprev(),
    buffers = buffers,
    help_tags = noprev(),
    builtin = noprev(),
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
