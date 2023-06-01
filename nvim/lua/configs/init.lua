local configs = {
  'catppuccin',
  'nvimtree',
  'telescope',
  'lualine',
  'treesitter',
  'lspzero',
  'gitsigns',
}

for _, c in ipairs(configs) do
  if not pcall(require, 'configs.' .. c) then
    print('[ERR] Failed to load config: ' .. c)
  end
end
