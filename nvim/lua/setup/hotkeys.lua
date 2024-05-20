local nvimTree = require('nvim-tree.api')
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<F4>', nvimTree.tree.toggle, { noremap = true })
vim.keymap.set('n', '<F5>', ':w <Enter>', { noremap = true })
vim.keymap.set('n', '<F6>', ':set hlsearch!<Enter>', { noremap = true })
vim.keymap.set('n', '<F10>', ':bd <Enter>', { noremap = true })
vim.keymap.set('n', '<leader>ki', vim.diagnostic.open_float, { noremap = true, desc = "Open float window (using <leader>ki since vscode uses cmd-k_cmd-i binding)" })
vim.keymap.set('v', '<leader>=', ':EasyAlign=<Enter>', { noremap = true })
vim.keymap.set('v', '<leader>:', ':EasyAlign:<Enter>', { noremap = true })
vim.keymap.set('v', '<leader>,', ':EasyAlign*,<Enter>', { noremap = true })

vim.keymap.set('i', 'jj', '<Esc>', { noremap = true })

vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, { noremap = true })

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>rg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
