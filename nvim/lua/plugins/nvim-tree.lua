return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  opts = {
    view = {
      width = {
        min = 30,
        max = 42,
      },
    },
    renderer = {
      group_empty = true,
    },
  },
  keys = {
    {
      "<F4>",
      function()
        require("nvim-tree").tree.toggle()
      end,
      desc = "Toggle file tree",
    },
  },
}
