return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_filetypes = {
            ['*'] = false,
            ['javascript'] = true,
            ['typescript'] = true,
            ['php'] = true,
            ['python'] = true,
            ['vue'] = true,
        }
        vim.keymap.set('i', '<C-S>', 'copilot#Accept("\\<CR>")', {
            expr = true,
            replace_keycodes = false
        })
        vim.g.copilot_no_tab_map = true
    end,
}
