-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'pylsp', 'gopls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
end

lspconfig.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importEnforceGranularity = true,
                importPrefix = "crate"
            },
            cargo = {
                allFeatures = true
            },
            checkOnSave = {
                -- default: `cargo check`
                command = "clippy"
            },
            inlayHints = {
                lifetimeElisionHints = {
                enable = true,
                useParameterNames = true
                },
            },
        }
    },
    capabilities = capabilities,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
