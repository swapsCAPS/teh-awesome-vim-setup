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
          "--hidden",
          "--trim",
        },
      },
    }
  end,
  keys = {
    {
      "<C-P>",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "find files",
    },
    {
      "<C-F>",
      function()
        require("telescope.builtin").grep_string({ search = "" })
      end,
      desc = "Fuzzy find",
    },
    {
      "<C-B>",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope open buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope help tags",
    },
    {
      "gu",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "Telescope LSP references (usages)",
    },
  },
}
