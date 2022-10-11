require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "clangd", "gopls", "rust-analyzer", "python-lsp-server" }
})
