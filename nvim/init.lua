vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local modules = {
  'plugins',
  'configs',
  'options',
  'keymaps',
  'autocmds',
}

for _, m in ipairs(modules) do
  if not pcall(require, m) then
    print('[ERR] Failed to load module: ' .. m)
  end
end
