-- Options --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.zig_fmt_autosave = 0
vim.g.mapleader = " "
vim.g.localleader = " "

vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.wrap = false
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.cursorline = false
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.cmdheight = 1
vim.o.clipboard = "unnamedplus"
vim.o.showcmd = false
vim.o.showmode = false
vim.o.laststatus = 3
vim.o.hidden = true
vim.o.list = true
vim.o.completeopt = "noselect,noinsert,menu,menuone"

vim.opt.listchars:append("tab:   ")
vim.opt.listchars:append("trail: ")
vim.opt.shortmess:append("cI")

vim.diagnostic.config({
    underline = false,
    virtual_text = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "⚑",
        },
    },
    float = { border = "rounded" },
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = "rounded" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = "rounded" }
)

-- Keymaps --
local keymap_opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", keymap_opts)
keymap("n", "<A-h>", "<C-w>h", keymap_opts)
keymap("n", "<A-j>", "<C-w>j", keymap_opts)
keymap("n", "<A-k>", "<C-w>k", keymap_opts)
keymap("n", "<A-l>", "<C-w>l", keymap_opts)
keymap("n", "<S-l>", ":bnext<CR>", keymap_opts)
keymap("n", "<S-h>", ":bprev<CR>", keymap_opts)
keymap("n", "<C-k>", ":resize -2<CR>", keymap_opts)
keymap("n", "<C-j>", ":resize +2<CR>", keymap_opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", keymap_opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", keymap_opts)
keymap("v", "<", "<gv", keymap_opts)
keymap("v", ">", ">gv", keymap_opts)

-- Plugins --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    { "lewis6991/gitsigns.nvim" },
    { "neovim/nvim-lspconfig" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
})

-- Plugin Configs --
keymap("n", "<leader>l", "<cmd>Lazy<cr>", keymap_opts)

require("catppuccin").setup({
    flavor = "mocha",
    integrations = { mason = true }
})
vim.cmd.colorscheme("catppuccin")

require("lualine").setup({
    options = {
        theme = "catppuccin",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_b = {
            "branch",
            "diff",
            {
                "diagnostics",
                symbols = {
                    error = "✘",
                    warn = "▲",
                    hint = "⚑",
                    info = "",
                },
            },
        },
    },
})

local telescope = require("telescope")
local telescope_actions = require("telescope.actions")
local telescope_builtin = require("telescope.builtin")
telescope.setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
        },
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
            prompt_title = false,
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
            prompt_title = false,
            mappings = {
                i = { ["<c-d>"] = telescope_actions.delete_buffer + telescope_actions.move_to_top },
            }
        },
        help_tags = {
            theme = "dropdown",
            previewer = false,
            prompt_title = false,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})
telescope.load_extension("fzf")
keymap("n", "<leader>ff", telescope_builtin.find_files, keymap_opts)
keymap("n", "<leader>fg", telescope_builtin.live_grep, keymap_opts)
keymap("n", "<leader>fb", telescope_builtin.buffers, keymap_opts)
keymap("n", "<leader>fh", telescope_builtin.help_tags, keymap_opts)
keymap("n", "<leader>fd", telescope_builtin.diagnostics, keymap_opts)
keymap("n", "<leader>fa", telescope_builtin.builtin, keymap_opts)

require("nvim-tree").setup({
    view = {
        adaptive_size = true,
        side = "right",
        cursorline = false,
    },
    renderer = {
        group_empty = false,
        indent_markers = {
            enable = false,
            inline_arrows = false,
        },
        highlight_git = false,
    },
    update_focused_file = { enable = true },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = { dotfiles = true },
    actions = {
        open_file = { quit_on_open = true },
        remove_file = { close_window = false }
    },
})
keymap("n", "<leader><Tab>", "<cmd>NvimTreeToggle<cr>", keymap_opts)

require("gitsigns").setup({
    attach_to_untracked = false,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk)
        map("n", "<leader>hr", gs.reset_hunk)
        map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end)
        map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end)
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hb", function() gs.blame_line { full = true } end)
        map("n", "<leader>tb", gs.toggle_current_line_blame)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function() gs.diffthis("~") end)
        map("n", "<leader>td", gs.toggle_deleted)

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end
})

require("nvim-treesitter.configs").setup({
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})

local luasnip = require("luasnip")
local cmp = require("cmp")
cmp.setup({
    completion = { autocomplete = false },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
    }),
})

local lspconfig = require("lspconfig")

local function lsp_on_attach(_, bufnr)
    local function lsp_keymap(mode, l, r)
        local lsp_opts = { noremap = true, silent = true, buffer = bufnr }
        keymap(mode, l, "<cmd>lua " .. r .. "<cr>", lsp_opts)
    end
    lsp_keymap("n", "K", "vim.lsp.buf.hover()")
    lsp_keymap("n", "gd", "vim.lsp.buf.definition()")
    lsp_keymap("n", "gD", "vim.lsp.buf.declaration()")
    lsp_keymap("n", "gi", "vim.lsp.buf.implementation()")
    lsp_keymap("n", "go", "vim.lsp.buf.type_definition()")
    lsp_keymap("n", "gr", "vim.lsp.buf.references()")
    lsp_keymap("n", "gs", "vim.lsp.buf.signature_help()")
    lsp_keymap("n", "gq", "vim.lsp.buf.format({ async = false, timeout_ms = 10000 })")
    lsp_keymap("n", "<F2>", "vim.lsp.buf.rename()")
    lsp_keymap("n", "<F4>", "vim.lsp.buf.code_action()")
    lsp_keymap("n", "gl", "vim.diagnostic.open_float()")
end

local function lsp_with_defaults(additional)
    local defaults = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = lsp_on_attach,
    }
    return vim.tbl_extend("force", defaults, additional or {})
end

local sys_servers = { "clangd", "ocamllsp", "gdscript", "gopls", "gleam" }
for _, server in ipairs(sys_servers) do
    lspconfig[server].setup(lsp_with_defaults())
end

lspconfig.rust_analyzer.setup(lsp_with_defaults({
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" }
        },
    },
}))

require("mason").setup({})
require("mason-lspconfig").setup({
    handlers = {
        function(server_name)
            lspconfig[server_name].setup(lsp_with_defaults())
        end,

        html = function()
            lspconfig.html.setup(lsp_with_defaults({
                filetypes = { "html", "htmldjango", "templ" },
            }))
        end,

        volar = function()
            lspconfig.volar.setup(lsp_with_defaults({
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
                init_options = {
                    vue = {
                        hybridMode = false,
                    },
                },
            }))
        end,
    },
})

-- Autocommands --
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])
vim.cmd([[au BufEnter * set fo-=c fo-=o]])

local function filetype_autocmd(ext)
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = { "*." .. ext },
        callback = function()
            vim.opt.filetype = ext
        end
    })
end

filetype_autocmd("wgsl")
filetype_autocmd("typst")
filetype_autocmd("kage")
