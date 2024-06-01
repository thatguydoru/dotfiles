local lsp = require('lsp-zero').preset({
  name = 'recommended',
  float_border = 'solid',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  setup_servers_on_start = false,
})
local cmp = require('cmp')
local mason_registry = require('mason-registry')

cmp.setup({
  completion = {
    autocomplete = false,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set(
    { 'n', 'x' },
    'gq',
    function()
      vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end,
    opts
  )
end)

local servers = { 'clangd', 'ocamllsp', 'gdscript', 'gleam' }
local mason_servers = require('mason-lspconfig').get_installed_servers()
for _, s in ipairs(mason_servers) do
  table.insert(servers, s)
end

lsp.configure('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = { command = 'clippy' },
    },
  },
})

local vuels_package = mason_registry.get_package('vue-language-server')
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

lsp.setup_servers(servers)
lsp.setup()

vim.diagnostic.config({
  underline = false,
})
