return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
        ensure_installed = {
            "bashls",
            "black",
            "cssls",
            "debugpy",
            "flake8",
            "html",
            "jsonls",
            "pyright",
            "ts_ls",
        },
        automatic_enable = true,
    },
    config = function()

        vim.lsp.config('intelephense', {
            filetypes = { 'php' }
        })

        vim.lsp.config('pyright', {
            filetypes = { 'python' },
        })

        local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'

        vim.lsp.config('ts_ls', {
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
        })

        vim.lsp.enable({
            'pyright',
            'ts_ls',
        })

    end,
}
