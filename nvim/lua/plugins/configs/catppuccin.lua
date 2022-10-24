require "catppuccin".setup {
    flavour = "mocha",
    integrations = {
        cmp = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        indent_blankline = {
            enabled = true,
            colore_indent_levels = true,
        },
        native_lsp = {
            enabled = true,
        }
    }
}

vim.cmd "colorscheme catppuccin"
