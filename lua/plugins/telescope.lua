return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-fzf-native.nvim" },
    init = function()
        require('telescope').setup{}
        require('telescope').load_extension('fzf')
        local wk = require('which-key')
        wk.add({
            {'<leader>p', group = 'Telescope'}
        })
    end,
    keys = {
        {'<leader>pf', '<cmd>Telescope find_files<cr>', desc = "find files"},
        {'<leader>pg', '<cmd>Telescope live_grep<cr>', desc = "live grep"},
        {'<leader>pb', '<cmd>Telescope buffers<cr>', desc = "buffers"},
        {'<leader>ph', '<cmd>Telescope help_tags<cr>', desc = "help tags"}
    },
}
