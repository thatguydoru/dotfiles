require "plugins.packer_conf"

local configs = {
    "nvimtree",
    "catppuccin",
    -- "blankline",
    "lualine",
    "treesitter",
    "autopairs",
    "lsp.lspconf",
    "lsp.handlers",
    "cmp",
    "telescope",
    "trouble",
}

for _, config in ipairs(configs) do
    --require("plugins.configs."..config)
    pcall(require, "plugins.configs."..config)
end
