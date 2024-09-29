return {
    "mfussenegger/nvim-dap",
    init = function()
        vim.fn.sign_define('DapBreakpoint', {text='●', texthl='', linehl='', numhl=''})
        vim.fn.sign_define('DapBreakpointCondition', {text='◉', texthl='', linehl='', numhl=''})
        vim.fn.sign_define('DapLogPoint', {text='◎', texthl='', linehl='', numhl=''})
        vim.fn.sign_define('DapStopped', {text='►', texthl='', linehl='', numhl=''})
        vim.fn.sign_define('DapBreakpointRejected', {text='◌', texthl='', linehl='', numhl=''})
    end,
    keys = {
        { "<F5>", function() require'dap'.continue() end, desc = "Launch debug sessions and resume execution" },
        { "<F10>", function() require'dap'.step_over() end, desc = "Step over" },
        { "<F9>", function() require'dap'.step_into() end, desc = "Step into function" },
        { "<F8>", function() require'dap'.step_out() end, desc = "Step out of function" },
        { "<F7>", function() require'dap'.step_back() end, desc = "Step back" },
        { "<Leader>b", function() require'dap'.toggle_breakpoint() end, desc = "Set breakpoint" },
        { "<Leader>bc", function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '), nil, nil) end, desc = "Set conditional breakpoint" },
        { "<Leader>lp", function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = "Set log point" },
        { "<Leader>ro", function() require'dap'.repl.open() end, desc = "Inspect the state via the built-in REPL" },
    }
}
