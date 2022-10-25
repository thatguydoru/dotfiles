local cmp = require "cmp"
local lspkind = require "lspkind"
local luasnip = require "luasnip"

if cmp == nil then
    print("cmp seems to not be installed")
    return
end

function leave_snippet()
    if ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
        and luasnip.session.current_nodes[vim.api.nvim_get_current_buf()]
        and not luasnip.session.jump_active
    then
        luasnip.unlink_current()
    end
end

vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])

cmp.setup {
    snippet = {
        expand = function(args)
            require "luasnip".lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-z>"] = cmp.mapping.scroll_docs(-4),
        ["<C-x>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-c>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function (fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" })
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua"},
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
    }),
    view = {
        entries = "custom",
    },
    formatting = {
        format = lspkind.cmp_format {
            mode = "symbol_text",
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                path = "[Path]",
            }
        }
    },
    experimental = {
        ghost_text = true,
    },
    enabled = function ()
        local context = require "cmp.config.context"
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end
}
