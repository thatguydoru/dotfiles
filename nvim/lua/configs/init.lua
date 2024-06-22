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
	local success, err = pcall(require, 'configs.' .. c)
	if not success then
		print('[ERR] Failed to load config: ' .. c .. ': ' .. err)
	end
end
