require("telescope").setup {
    pickers = {
        find_files = {
            theme = "dropdown"
        },
        live_grep = {
            theme = "dropdown"
        },
        buffers = {
            theme = "dropdown"
        },
        help_tags = {
            theme = "dropdown"
        },
    }
}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local builtin = require("telescope.builtin")

-- Telescope binds
keymap("n", "ff", builtin.find_files, opts)
keymap("n", "fg", builtin.live_grep, opts)
keymap("n", "fb", builtin.buffers, opts)
keymap("n", "fh", builtin.help_tags, opts)
