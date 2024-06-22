local modules = {
  'options',
  'plugins',
  'configs',
  'keymaps',
  'autocmds',
}

for _, m in ipairs(modules) do
  local success, err = pcall(require, m)
  if not success then
    print('[ERR] Failed to load module ' .. m .. 'due to: ' .. err)
  end
end
