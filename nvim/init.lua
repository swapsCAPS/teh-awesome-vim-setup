require("setup.before")
require("setup.lazy")
require("setup.comment")
require("setup.conform")
require("setup.vimopts")
require("setup.hotkeys")
require("setup.helpers")
require("setup.nvim-treesitter")
require("setup.neoconf") -- Needs to be set up before lspconfig
require("setup.nvim-lspconfig")
require("setup.nvim-cmp")
require("setup.nvim-tree")
require("setup.telescope")

require("lualine").setup()

-- Plug 'vim-test/vim-test'
--
-- P:help nvim-tree.filters.excludelug 'sheerun/vim-polyglot'
