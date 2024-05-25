vim.opt.filetype = 'on'
vim.opt.clipboard = 'unnamedplus'
vim.opt.signcolumn = 'yes'
vim.opt.showcmd = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop= 4
vim.opt.colorcolumn = '+1'
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.wrap = true
vim.opt.listchars = { trail = '·', tab = '» ' }
-- vim.opt.spell = true
-- vim.opt.spelllang = {'en_us', "nl"}
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99

-- Cursor crosshair
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.cmd('colorscheme tokyonight')
