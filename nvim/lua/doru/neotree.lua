require('neo-tree').setup({
    filesystem = {
        window = {
            mappings = {
                ["<F5>"] = "refresh",
                ["o"] = "open",
            },
            width = 30,
        },
    },
    default_component_configs = {
        icon = {
            folder_empty = ""
        }
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


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>e", ":NeoTreeFocusToggle<CR>", opts)
