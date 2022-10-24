require "plugins.packer_conf"

local configs = {
    "nvimtree",
    "catppuccin",
    "blankline",
    "lualine",
    "treesitter",
    "autopairs",
    "lspconf",
    "cmp",
    "telescope",
}

for _, config in ipairs(configs) do
    require("plugins.configs."..config)
end
