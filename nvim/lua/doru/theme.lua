vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    integrations = {
        neotree = true,
        telescope = true,
    }
})
vim.api.nvim_command "colorscheme catppuccin"
