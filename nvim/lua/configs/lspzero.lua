local lsp = require('lsp-zero').preset({
	name = 'manual-setup',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
})
local cmp = require('cmp')

cmp.setup({
	completion = {
		autocomplete = false,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-k>'] = cmp.mapping.scroll_docs(-4),
		['<C-j>'] = cmp.mapping.scroll_docs(4),
	}),
})

lsp.on_attach(function(_, bufnr)
	vim.keymap.set(
		{ 'n', 'x' },
		'gq',
		function()
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end,
		{ buffer = bufnr }
	)
end)

local servers = { 'clangd', 'ocamllsp', 'gdscript', 'gleam', 'rust_analyzer', 'gopls' }
local mason_servers = require('mason-lspconfig').get_installed_servers()
for _, s in ipairs(mason_servers) do
	table.insert(servers, s)
end
lsp.setup_servers(servers)

lsp.configure('rust_analyzer', {
	settings = {
		['rust-analyzer'] = {
			checkOnSave = { command = 'clippy' },
		},
	},
})

local vuels_package = require('mason-registry').get_package('vue-language-server')
local vuels_path = vuels_package:get_install_path() .. '/node_modules/@vue/language-server'
lsp.configure('tsserver', {
	init_options = {
		plugins = {
			{
				name = '@vue/typescript-plugin',
				location = vuels_path,
				languages = { 'vue' },
			},
		},
	},
	filetypes = {
		'typescript',
		'javascript',
		'javascriptreact',
		'typescriptreact',
		'vue',
	},
})

vim.diagnostic.config({
	underline = false,
})

lsp.setup()
