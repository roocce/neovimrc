return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
        ensure_installed = {
            "bashls",
            "black",
            "cssls",
            "debugpy",
            -- "diff",
            -- "eslint",
            "flake8",
            "html",
            "intelephense",
            "jsonls",
            "lua_ls",
            -- "luadoc",
            -- "markdown",
            -- "markdown_inline",
            -- "phpactor",
            -- "printf",
            "pyright",
            -- "regex",
            -- "sql",
            -- "stimulus_ls",
            -- "toml",
            -- "vim",
            -- "vimdoc",
            "ts_ls",
            "volar",
            -- "xml",
            -- "yaml",
        },
        automatic_enable = true,
    },
    config = function()
        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup {
            filetypes = { 'lua' },
        }

        lspconfig.intelephense.setup {
            filetypes = { 'php' },
        }

        lspconfig.pyright.setup {
            filetypes = { 'python' },
        }

        local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'


        lspconfig.ts_ls.setup {
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
              },
            },
          },
          filetypes = { 'typescript', 'javascript', 'vue' },
        }

        lspconfig.volar.setup {}

    end,
}
