return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
          require("telescope.builtin").git_files()
        end,
        desc = "git files",
      },
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({})
        end,
        desc = "find files",
      },
      {
        "<C-F>",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "`rg` with `vimgrep_arguments`",
      },
      {
        "<leader>fa",
        function()
          require("telescope.builtin").grep_string({ search = "" })
        end,
        desc = "Fuzzy find all",
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
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
    lazy = true,
    init = function()
      require("telescope").load_extension("fzf")
    end,
  },
}
