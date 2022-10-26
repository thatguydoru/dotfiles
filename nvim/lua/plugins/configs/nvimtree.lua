local api = require "nvim-tree.api"
local Event = api.events.Event

api.events.subscribe(Event.FileCreated, function (data)
    vim.cmd(":e" .. data["fname"])
end)

require "nvim-tree".setup {
    view = {
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        highlight_git = true,
    },
    update_focused_file = {
        enable = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        debounce_delay = 50,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
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
}
