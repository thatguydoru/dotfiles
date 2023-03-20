vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local modules = {
    "keymaps",
    "options",
    "plugins",
    "packer_conf",
}

for _, m in ipairs(modules) do
    pcall(require, m)
end
