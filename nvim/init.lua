require("setup.before")
require("setup.lazy")
require("setup.filetypes")
require("setup.comment")
require("setup.conform")
require("setup.vimopts")
require("setup.nvim-dap-ui")
require("setup.nvim-lint")
require("setup.helpers")
require("setup.nvim-treesitter")
require("setup.mason")     -- Needs to be set up before lspconfig
require("setup.nvim-java") -- Needs to be set up before lspconfig
require("setup.neoconf")   -- Needs to be set up before lspconfig
require("setup.lspconfig")
require("setup.nvim-cmp")
require("setup.nvim-tree")
require("setup.telescope")
require("setup.hotkeys")

require("lualine").setup()

-- Plug 'vim-test/vim-test'
--
-- P:help nvim-tree.filters.excludelug 'sheerun/vim-polyglot'
