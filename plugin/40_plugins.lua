local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

now(function()
    -- Use other plugins with `add()`. It ensures plugin is available in current
    -- session (installs if absent)
    add({ source = 'williamboman/mason.nvim' })
    require('mason').setup({
        ui = {
            border = 'rounded',
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗'
            }
        }
    })

    add({
        source = 'neovim/nvim-lspconfig',
        -- Supply dependencies near target plugin
        depends = { 'williamboman/mason.nvim' },
    })
    add({ source = 'BurntSushi/ripgrep' })

    vim.lsp.config('intelephense', {
        filetypes = { 'php' }
    })

    vim.lsp.config('pyright', {
        filetypes = { 'python' },
    })

    local vue_language_server_path = vim.fn.expand '$MASON/packages' .. '/vue-language-server' .. '/node_modules/@vue/language-server'
    local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
    }
    local ts_ls_config = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
      filetypes = { 'typescript', 'javascript', 'vue' },
    }

    vim.lsp.config('ts_ls', ts_ls_config)
    vim.lsp.config('vue_ls', {})

    vim.lsp.enable({
        'bashls',
        'cssls',
        'html',
        'intelephense',
        'jsonls',
        'lua_ls',
        'pyright',
        'ts_ls',
        'vue_ls',
    })

end)

later(function()
    add({
        source = 'nvim-treesitter/nvim-treesitter',
        -- Use 'master' while monitoring updates in 'main'
        checkout = 'master',
        monitor = 'main',
        -- Perform action after every checkout
        hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
    })
    -- Possible to immediately execute code which depends on the added plugin
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'bash',
            'css',
            'diff',
            'html',
            'javascript',
            'jsdoc',
            'json',
            'lua',
            'luadoc',
            'markdown',
            'markdown_inline',
            'php',
            'printf',
            'python',
            'regex',
            'sql',
            'toml',
            'vim',
            'vimdoc',
            'vue',
            'xml',
            'yaml',
        },
        highlight = { enable = true },
        indent = { enable = true },
    })

    add({ source = 'mfussenegger/nvim-dap' })
    local dap = require('dap')
    dap.adapters.php = {
        type = 'executable',
        command = 'node',
        -- args = { table.concat({ vim.fn.stdpath('data'),  'mason', 'packages', 'php-debug-adapter', 'extension', 'out', 'phpDebug.js'}, '/'):gsub('//+', '/') },
        args = { os.getenv('HOME') .. '/Projects/vscode-php-debug/out/phpDebug.js' },
    }

    dap.configurations.php = {
        {
            type = 'php',
            request = 'launch',
            name = 'Listen for Xdebug',
            port = 9003
        },
    }
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = '@text.danger', linehl = '@text.danger', numhl =
    '@text.danger' })
    vim.fn.sign_define('DapBreakpointCondition',
        { text = '◉', texthl = '@text.warning', linehl = '@text.warning', numhl = '@text.warning' })
    vim.fn.sign_define('DapBreakpointRejected',
        { text = '◌', texthl = '@text.strike', linehl = '@text.strike', numhl = '@text.strike' })
    vim.fn.sign_define('DapLogPoint', { text = '◎', texthl = '@text.note', linehl = '@text.note', numhl = '@text.note' })
    vim.fn.sign_define('DapStopped', { text = '►', texthl = '@text.title', linehl = '@text.title', numhl = '@text.title' })

    add({ source = 'theHamsta/nvim-dap-virtual-text' })
    require('nvim-dap-virtual-text').setup()

    add({ source = 'nvim-neotest/nvim-nio' })
    -- require('nio').setup({})

    add({
        source = 'rcarriga/nvim-dap-ui',
        depends = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio'
        }
    })
    require('dapui').setup({
        controls = {
            element = 'watches',
            enabled = true,
            icons = {
                disconnect = '',
                pause = '',
                play = '',
                run_last = '',
                step_back = '',
                step_into = '',
                step_out = '',
                step_over = '',
                terminate = ''
            }
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            max_height = 480,
            max_width = 640,
            border = 'rounded',
            mappings = {
                close = { 'q', '<Esc>' }
            }
        },
        force_buffers = true,
        icons = {
            collapsed = '',
            current_frame = '',
            expanded = ''
        },
        layouts = { {
            elements = { {
                id = 'scopes',
                size = 1
            } },
            position = 'left',
            size = 80
        }, {
            elements = { {
                id = 'watches',
                size = 1
            } },
            position = 'bottom',
            size = 20
        } },
        mappings = {
            edit = 'e',
            expand = { '<CR>', '<2-LeftMouse>' },
            open = 'o',
            remove = 'd',
            repl = 'r',
            toggle = 't'
        },
        render = {
            indent = 1,
            max_value_lines = 100
        }
    })

    add({ source = 'mfussenegger/nvim-dap-python' })
    local dap_python = require('dap-python')
    local python_path = table.concat({ vim.fn.stdpath('data'),  'mason', 'packages', 'debugpy', 'venv', 'bin', 'python'}, '/'):gsub('//+', '/')
    dap_python.setup(python_path)

    local dap = require('dap')
    local_root = vim.fn.getcwd()
    table.insert(dap.configurations.python, {
        name = 'Remote Flask',
        type = 'python',
        request = 'attach',
        connect = {
            host = '127.0.0.1',
            port = 5678
        },
        pathMappings = {
            {
                localRoot = local_root,
                remoteRoot = '.',
            }
        };
    })
    table.insert(dap.configurations.python, {
        name = 'Remote Celery',
        type = 'python',
        request = 'attach',
        connect = {
            host = '127.0.0.1',
            port = 6678
        },
        pathMappings = {
            {
                localRoot = local_root,
                remoteRoot = '.',
            }
        };
    })
    table.insert(dap.configurations.python, {
        name = 'Pytest: Current File',
        type = 'python',
        request = 'launch',
        module = 'pytest',
        args = {
            '${file}',
            '-sv',
            '--log-cli-level=INFO',
            '--log-file=test_out.log',
            '--no-cov'
        },
        console = 'integratedTerminal'
    })
    table.insert(dap.configurations.python, {
        name = 'Uvicorn: Current File',
        type = 'python',
        request = 'launch',
        module = 'uvicorn',
        args = {
            'app.main:app',
            '--reload',
            '--host 127.0.0.1',
            '--port 8000'
        },
        pathMappings = {
            {
                localRoot = local_root,
                remoteRoot = '.',
            }
        };
    })

    add({ source = 'lewis6991/hover.nvim' })
    require('hover').setup({
        init = function()
            -- Require providers
            require('hover.providers.lsp')
            -- require('hover.providers.gh')
            -- require('hover.providers.gh_user')
            -- require('hover.providers.jira')
            -- require('hover.providers.dap')
            -- require('hover.providers.fold_preview')
            -- require('hover.providers.diagnostic')
            -- require('hover.providers.man')
            -- require('hover.providers.dictionary')
            -- require('hover.providers.highlight')
        end,
        preview_opts = {
            border = 'single'
        },
        -- Whether the contents of a currently open hover window should be moved
        -- to a :h preview-window when pressing the hover keymap.
        preview_window = false,
        title = true,
        mouse_providers = {
            'LSP'
        },
        mouse_delay = 1000
    })

    add({ source = 'folke/trouble.nvim' })
    require('trouble').setup()

    add({ source = 'lewis6991/gitsigns.nvim' })
    require('gitsigns').setup({
        signs                        = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged                 = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged_enable          = true,
        signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = true, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = true, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            follow_files = true
        },
        auto_attach                  = true,
        attach_to_untracked          = false,
        current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol',     -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
            use_focus = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
    })

    add({ source = 'tpope/vim-vinegar' })
    -- add({ source = 'mfussenegger/nvim-lint' })
    add({ source = 'github/copilot.vim' })

end)
