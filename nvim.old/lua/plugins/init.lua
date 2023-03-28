local modules = {
      "autopairs",
      "catppuccin",
      "cmp",
      "lsp_handlers",
      "lspconf",
      "lualine",
      "nvimtree",
      "telescope",
      "treesitter",
      "trouble",
}

for _, m in ipairs(modules) do
    pcall(require, "plugins." .. m)
end
