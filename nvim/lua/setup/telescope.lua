local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      vertical = { width = 0.9 }
    },
    mappings = {
      i = {
        ["<C-a>"] = actions.results_scrolling_left,
        ["<C-e>"] = actions.results_scrolling_right,
      }
    },
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    }

  }
})
