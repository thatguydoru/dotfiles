vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local modules = {
    "defaults",
    "plugins",
}

for _, m in ipairs(modules) do
    pcall(require, m)
end
