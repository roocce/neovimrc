vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<leader>cn", vim.cmd.cnext)
vim.keymap.set("n", "<leader>cp", vim.cmd.cprevious)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move focus to the upper window' })
