local lsp = require('lsp-zero').preset({
  name = 'recommended',
  float_border = 'solid',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  setup_servers_on_start = false,
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set({ 'n', 'x' }, 'gq', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)
end)

local servers = { 'clangd', 'gopls', 'hls', 'ocamllsp' }
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

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
  underline = false,
})
