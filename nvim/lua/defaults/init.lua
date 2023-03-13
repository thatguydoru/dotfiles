local modules = {
    "options",
    "keymaps",
}

for _, m in ipairs(modules) do
    pcall(require, "defaults."..m)
end
