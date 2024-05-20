local nvimTree = require('nvim-tree.api')
local telescope = require('telescope.builtin')
local neogit = require('neogit')

local function organizeTsImports()
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = { vim.fn.expand("%:p") }
  })
end

vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<F3>', neogit.open, {})
vim.keymap.set('n', '<F4>', nvimTree.tree.toggle, {})
vim.keymap.set('n', '<F5>', ':w <Enter>', {})
vim.keymap.set('n', '<F6>', ':set hlsearch!<Enter>', {})
vim.keymap.set('n', '<F10>', ':bd <Enter>', {})
vim.keymap.set('v', '<leader>=', ':EasyAlign=<Enter>', {})
vim.keymap.set('v', '<leader>:', ':EasyAlign:<Enter>', {})
vim.keymap.set('v', '<leader>,', ':EasyAlign*,<Enter>', {})

vim.keymap.set('i', 'jj', '<Esc>', {})

vim.keymap.set('n', '<leader>of', vim.diagnostic.open_float, {
  desc = [[Open float window (using <leader>ki since vscode uses cmd-k_cmd-i binding)]]
})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, {})

vim.keymap.set('n', '<leader>oi', organizeTsImports, {
  desc = "Organize TS imports"
})

vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>rg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})
