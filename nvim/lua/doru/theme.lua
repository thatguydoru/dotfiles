vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
    integrations = {
        neotree = true,
    }
})
vim.api.nvim_command "colorscheme catppuccin"
