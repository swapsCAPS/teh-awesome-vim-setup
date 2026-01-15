local function open()
  require("neogit").open()
  is_open = false
end

return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  cmd = { "DiffviewFileHistory" },
  keys = {
    {
      "<leader>ng",
      open,
      desc = "Open NeoGit",
    },
    {
      "<F3>",
      open,
      desc = "Open NeoGit",
    },
  },
  opts = function()
    return {}
  end,
}
