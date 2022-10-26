local no_preview = function()
    return {
        theme = "dropdown",
        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
            results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        },
        width = 0.8,
        previewer = false,
        prompt_title = false
    }
end

require "telescope".setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim" -- add this value
        },
        theme = "dropdown",
        borderchars = {
            { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            results = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
        },
    },
    pickers = {
        find_files = no_preview(),
        live_grep = no_preview(),
        buffers = no_preview(),
        help_tags = no_preview(),
        builtin = no_preview()
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
}

require "telescope".load_extension("fzf")
