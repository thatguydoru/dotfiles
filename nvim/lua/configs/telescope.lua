local noprev = function()
  return {
    theme = 'dropdown',
    previewer = false,
    prompt_title = false,
  }
end

local telescope = require('telescope')
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
      '--trim', -- add this value
    },
  },
  theme = 'dropdown',
  pickers = {
    find_files = noprev(),
    live_grep = noprev(),
    buffers = noprev(),
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
