return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require('dap')
        dap.adapters.php = {
            type = 'executable',
            command = 'node',
            -- args = { table.concat({ vim.fn.stdpath('data'),  'mason', 'packages', 'php-debug-adapter', 'extension', 'out', 'phpDebug.js'}, '/'):gsub('//+', '/') },
            args = { os.getenv("HOME") .. "/Projects/vscode-php-debug/out/phpDebug.js" },
        }

        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9003
            },
            -- {
            --     type = 'php',
            --     request = 'attach',
            --     name = 'Attach to PHP process',
            --     port = 9003
            -- }
        }
    end,
    init = function()
        vim.fn.sign_define('DapBreakpoint', {text='●', texthl='@text.danger', linehl='@text.danger', numhl='@text.danger'})
        vim.fn.sign_define('DapBreakpointCondition', {text='◉', texthl='@text.warning', linehl='@text.warning', numhl='@text.warning'})
        vim.fn.sign_define('DapBreakpointRejected', {text='◌', texthl='@text.strike', linehl='@text.strike', numhl='@text.strike'})
        vim.fn.sign_define('DapLogPoint', {text='◎', texthl='@text.note', linehl='@text.note', numhl='@text.note'})
        vim.fn.sign_define('DapStopped', {text='►', texthl='@text.title', linehl='@text.title', numhl='@text.title'})
    end,
    keys = {
        { "<F5>", function() require'dap'.continue() end, desc = "Launch debug sessions and resume execution" },
        { "<F10>", function() require'dap'.step_over() end, desc = "Step over" },
        { "<F9>", function() require'dap'.step_into() end, desc = "Step into function" },
        { "<F8>", function() require'dap'.step_out() end, desc = "Step out of function" },
        { "<F7>", function() require'dap'.step_back() end, desc = "Step back" },
        { "<Leader>b", function() require'dap'.toggle_breakpoint() end, desc = "Toggle breakpoint" },
        { "<Leader>bc", function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '), nil, nil) end, desc = "Set conditional breakpoint" },
        { "<Leader>lp", function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "Set log point" },
        { "<Leader>ro", function() require'dap'.repl.open() end, desc = "Inspect the state via the built-in REPL" },
    }
}
