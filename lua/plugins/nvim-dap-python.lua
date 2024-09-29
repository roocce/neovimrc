return {
    'mfussenegger/nvim-dap-python',
    config = function()
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
                host = "127.0.0.1",
                port = 5678
            },
            pathMappings = {
                {
                    localRoot = local_root,
                    remoteRoot = ".",
                }
            };
        })
        table.insert(dap.configurations.python, {
            name = 'Remote Celery',
            type = 'python',
            request = 'attach',
            connect = {
                host = "127.0.0.1",
                port = 6678
            },
            pathMappings = {
                {
                    localRoot = local_root,
                    remoteRoot = ".",
                }
            };
        })
        table.insert(dap.configurations.python, {
            name = 'Pytest: Current File',
            type = 'python',
            request = 'launch',
            module = 'pytest',
            args = {
                "${file}",
                "-sv",
                "--log-cli-level=INFO",
                "--log-file=test_out.log",
                "--no-cov"
            },
            console = "integratedTerminal"
        })
    end
}
