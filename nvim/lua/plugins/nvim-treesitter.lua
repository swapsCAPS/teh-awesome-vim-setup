-- nvim-treesitter wraps the Neovim treesitter API to provide functionalities
-- such as highlighting and incremental selection, and a command to easily
-- install parsers.
--
-- The docs state:
-- The goal of nvim-treesitter is both to provide a simple and easy way to use
-- the interface for tree-sitter in Neovim and to provide some basic
-- functionality such as highlighting based on it
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    opts = {
      ensure_installed = {
        "arduino",
        "bash",
        "bicep",
        "dockerfile",
        "editorconfig",
        "go",
        "graphql",
        "java",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonnet",
        "kotlin",
        "lua",
        "markdown",
        "markdown_inline",
        "powershell",
        "python",
        "properties",
        "query",
        "rust",
        "svelte",
        "terraform",
        "tmux",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      highlight = { enable = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
      separator = "─",
      max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    },
  },
}
