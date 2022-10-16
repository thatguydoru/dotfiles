vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    integrations = {
        neotree = true,
        telescope = true,
        cmp = true,
        treesitter = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
        native_lsp = {
            enabled = true,
        }
    }
})
vim.api.nvim_command "colorscheme catppuccin"
