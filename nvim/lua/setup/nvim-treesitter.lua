require('nvim-treesitter.configs').setup({
  highlight = { enable = true }
})
require('treesitter-context').setup {
  mode = 'topline', -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = '─'
}
