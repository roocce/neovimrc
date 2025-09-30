return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    opts = {
        controls = {
            element = "watches",
            enabled = true,
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = ""
            }
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
            max_height = 480,
            max_width = 640,
            border = "rounded",
            mappings = {
                close = { "q", "<Esc>" }
            }
        },
        force_buffers = true,
        icons = {
            collapsed = "",
            current_frame = "",
            expanded = ""
        },
        layouts = { {
            elements = { {
                id = "scopes",
                size = 1
            } },
            position = "left",
            size = 80
        }, {
            elements = { {
                id = "watches",
                size = 1
            } },
            position = "bottom",
            size = 20
        } },
        mappings = {
            edit = "e",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t"
        },
        render = {
            indent = 1,
            max_value_lines = 100
        }
    },
    keys = {
        { "<leader>dt", function() require'dapui'.toggle() end, desc = "Toggle Debugger UI" },
        { "<leader>dc", function() require'dapui'.float_element("console", { width = 640, height = 480, enter = true }) end, desc = "Open a floating console" },
        { "<leader>dh", function() require'dapui'.float_element("breakpoints", { width = 640, height = 480, enter = true }) end, desc = "Open a floating breakpoints" },
        { "<leader>dl", function() require'dapui'.float_element("stacks", { width = 640, height = 480, enter = true }) end, desc = "Open a floating stacks" },
        { "<leader>dg", function() require'dapui'.float_element("repl", { width = 640, height = 480, enter = true }) end, desc = "Open a floating REPL" },
    }
}
