vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.opt.termguicolors = true
vim.opt.filetype = "on"
vim.opt.clipboard = "unnamedplus"
vim.opt.showcmd = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.autowrite = true
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.foldlevel = 99
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop= 4
vim.opt.colorcolumn = "+120"
vim.opt.textwidth = 120
vim.opt.linebreak = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.wrap = true
-- vim.opt.listchars = { tab = '»', trail = '·' }
vim.opt.listchars = { trail = '·', tab = '» ' }

-- Cursor crosshair
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.cmd("colorscheme gruvbox-material")
