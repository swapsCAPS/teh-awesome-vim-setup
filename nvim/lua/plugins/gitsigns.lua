return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  opts = {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      delay = 500,
    },
  },
}
