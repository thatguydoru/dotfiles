require "lualine".setup {
    options = {
        theme = "catppuccin",
        disabled_filetypes = {
            statusline = {
                "",
            },
        },
    },
    sections = {
        lualine_c = {
            {
                "buffers",
                symbols = { alternate_file = "", },
            },
        },
        lualine_x = {},
    },
}
