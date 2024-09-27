return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  keys = {
    {
      "<leader>ng",
      function()
        require("neogit").open()
      end,
      desc = "Open NeoGit",
    },
  },
  config = function()
    require("neogit").setup({})
  end,
}
