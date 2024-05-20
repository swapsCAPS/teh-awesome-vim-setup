-- nvim-treesitter wraps the Neovim treesitter API to provide functionalities
-- such as highlighting and incremental selection, and a command to easily
-- install parsers.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}
