require('neo-tree').setup({
    filesystem = {
        hijack_netrw_behavior = "open_current",
        window = {
            mappings = {
                ["<F5>"] = "refresh",
                ["o"] = "open",
            },
            width = 35,
        },
    },
    default_component_configs = {
        icon = {
            folder_empty = ""
        },
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                require("neo-tree").close_all()
            end
        },
    }
})
