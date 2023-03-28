local configs = {
  'nvimtree',
  'telescope',
  'lualine',
  'treesitter',
  'lspzero',
  'lspconf',
}

for _, c in ipairs(configs) do
  if not pcall(require, 'configs.' .. c) then
    print('[ERR] Failed to load config: ' .. c)
  end
end
