local modules = {
    "options",
    "keymaps",
}

for _, m in ipairs(modules) do
    --require("defaults."..m)
    pcall(require, "defaults."..m)
end
