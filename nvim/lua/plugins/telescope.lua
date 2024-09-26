return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },
  lazy = true,
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = { width = 0.9 },
        },
        mappings = {
          i = {
            ["<C-a>"] = actions.results_scrolling_left,
            ["<C-e>"] = actions.results_scrolling_right,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
      },
    }
  end,
}
