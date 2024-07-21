-- file preview, vertical right
vim.g.netrw_preview = 1
vim.g.netrw_alto = 0
vim.g.netrw_banner = 0

vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- wait for mapped sequence
vim.opt.timeoutlen = 500

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- preview effects incrementally
vim.opt.inccommand = 'split'

vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- reduce cursorhold time
vim.opt.swapfile = false
vim.opt.updatetime = 250

vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
