return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "vim", "vimdoc", "lua", "luadoc",
            "gitcommit", "bash", "diff", "markdown",
        },
        sync_install = false,
        auto_install = true,
        indent = { enable = true },
        highlight = {
            enabled = true,
            additional_vim_regex_highlighting = { "markdown" },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.install").prefer_git = true
        require("nvim-treesitter.configs").setup(opts)
    end,
}
