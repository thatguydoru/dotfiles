local modules = {
    "options",
    "keymaps",
}

for _, m in ipairs(modules) do
    require("defaults."..m)
end
