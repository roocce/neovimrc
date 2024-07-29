return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {'<leader>pf', require('telescope.builtin').find_files},
        {'<leader>pg', require('telescope.builtin').live_grep},
        {'<leader>pb', require('telescope.builtin').buffers},
        {'<leader>ph', require('telescope.builtin').help_tags}
    },
    init = function()
        require('telescope').load_extension('fzf')
    end
}
