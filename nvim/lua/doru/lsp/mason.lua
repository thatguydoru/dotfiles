require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "clangd", "gopls", "rust_analyzer", "pylsp" }
})
