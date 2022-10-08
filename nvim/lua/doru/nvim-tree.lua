-- File tree with nvim-tree --

require('nvim-tree').setup {
    open_on_setup = true,
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
}
