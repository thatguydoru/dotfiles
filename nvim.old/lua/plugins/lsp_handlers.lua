local capabilities = require "cmp_nvim_lsp".default_capabilities()
local lspconfig = require "lspconfig"

local keymap = vim.keymap.set
local on_attach = function(_, buffer)
    local bufopt = { noremap = true, silent = true, buffer = buffer }
    keymap("n", "<leader>p", vim.lsp.buf.hover, bufopt)
    keymap("n", "<leader>o", vim.lsp.buf.definition, bufopt)
    keymap("n", "<leader>i", vim.lsp.buf.rename, bufopt)
    keymap("n", "<leader>u", vim.lsp.buf.code_action, bufopt)
    keymap("n", "<leader>y", vim.lsp.buf.format, bufopt)
    --vim.cmd([[au BufWritePre * lua vim.lsp.buf.format()]])
end

local servers = {
    "zls",
    "clangd",
    "pylsp",
    "crystalline",
    "tsserver",
    "eslint",
    "cssls",
    "html",
    "emmet_ls",
    "ocamllsp"
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

lspconfig["lua_ls"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = { "vim" }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false
            }
        }
    }
}

-- TODO:
-- When you think it is time to switch to rust-tools for that
-- heavy goodness then install the plugin and replace barebones rust analyzer
lspconfig["rust_analyzer"].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importEnforceGranularity = true,
                importPrefix = "crate",
            },
            cargo = {
                allFeatures = true,
            },
            checkOnSave = {
                command = "clippy"
            },
            --inlayHints = {
            --    lifetimeElisionHints = {
            --        enable = true,
            --        useParameterNames = true,
            --    },
            --},
        },
    },
}

lspconfig['gopls'].setup {
    cmd = { 'gopls' },
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            staticcheck = true,
        },
    },
    init_options = {
        usePlaceholders = true,
    }
}

--lspconfig["emmet_ls"].setup()
