return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        ensure_installed = {
            "bash",
            "css",
            "diff",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "org",
            "printf",
            "python",
            "regex",
            "sql",
            "toml",
            "vim",
            "vimdoc",
            "vue",
            "xml",
            "yaml",
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
