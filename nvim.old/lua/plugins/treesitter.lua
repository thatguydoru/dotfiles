require "nvim-treesitter.configs".setup {
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "rust",
        "lua",
        "go",
    },
    sync_install = true,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}
