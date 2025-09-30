return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })

    local wk = require('which-key')
    wk.add({
        {'<leader>o', group = 'Orgmode'}
    })

    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'org',
        callback = function()
            vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
                silent = true,
                buffer = true,
            })
        end,
    })
  end,
}
