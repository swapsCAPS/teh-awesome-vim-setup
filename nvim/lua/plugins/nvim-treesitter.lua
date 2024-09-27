-- nvim-treesitter wraps the Neovim treesitter API to provide functionalities
-- such as highlighting and incremental selection, and a command to easily
-- install parsers.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    init = function()
      return {
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
      }
    end,
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
    },
  },
}
