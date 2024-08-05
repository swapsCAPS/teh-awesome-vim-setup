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
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.colorcolumn = '+1'
vim.opt.textwidth = 80
vim.opt.linebreak = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.wrap = true
vim.opt.listchars = { trail = '·', tab = '» ' }
vim.opt.spell = true
vim.opt.spelllang = { 'en', 'nl' }
vim.opt.foldlevel = 99
vim.opt.mousescroll = "ver:1,hor:1" -- TODO invert horizontal scrolling

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.filetype.add({
  pattern = {
    ['.*/.github/workflows/.*%.yml'] = 'yaml.ghaction',
    ['.*/.github/workflows/.*%.yaml'] = 'yaml.ghaction',
  }
})
