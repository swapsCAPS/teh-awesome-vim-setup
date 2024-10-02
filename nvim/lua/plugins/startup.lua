return {
  "startup-nvim/startup.nvim",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = {},
  config = function()
    require("startup").setup()
  end,
}
