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
  cmd = { "NvimTree", "NvimTreeFindFile" },
  keys = {
    {
      "<F4>",
      function()
        require("nvim-tree.api").tree.toggle({ find_file = true })
      end,
      desc = "Toggle file tree",
    },
  },
}
