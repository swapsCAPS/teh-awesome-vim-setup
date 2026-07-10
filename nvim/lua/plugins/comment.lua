return {
  "nvim-mini/mini.comment",
  version = "*",
  keys = { { "<C-/>", mode = { "n", "v" } }, { "gc", mode = { "n", "v" } } },
  opts = {
    mappings = {
      comment_line = "<C-/>",
      comment_visual = "<C-/>",
    },
  },
}
