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
            "intelephense",
            "jsonls",
            "lua_ls",
            "pyright",
            "ts_ls",
            "volar",
        },
        automatic_enable = true,
    },
    config = function()
        vim.lsp.config('luals', {
            filetypes = { 'lua' }
        })

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

        vim.lsp.config('volar', {})

        vim.lsp.enable({
            'intelephense',
            'luals',
            'pyright',
            'ts_ls',
            'volar'
        })

    end,
}
