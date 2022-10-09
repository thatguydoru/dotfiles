vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    integrations = {
        neotree = true,
        telescope = true,
        cmp = true,
    }
})
vim.api.nvim_command "colorscheme catppuccin"
