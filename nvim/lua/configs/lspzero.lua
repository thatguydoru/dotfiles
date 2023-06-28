local lsp = require('lsp-zero').preset({
  name = 'recommended',
  float_border = 'solid',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  setup_servers_on_start = false,
})

lsp.setup_servers({
  'zls',
  'lua_ls',
  'gopls',
  'hls',
  'jedi_language_server',
  'html',
  'rust_analyzer',
  'typst_lsp',
  'wgsl_analyzer',
  'cssls',
  'clangd',
  'tsserver',
  'volar',
  'sourcekit',
  'ocamllsp',
})


lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set({ 'n', 'x' }, 'gq', function()
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)
end)

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
