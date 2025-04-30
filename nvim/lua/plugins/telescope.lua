return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      },
    },
    cmd = "Telescope",
    config = function()
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      local opts = {
        extensions = {
          live_grep_args = {
            mappings = {
              i = {
                ["<C-space>"] = lga_actions.to_fuzzy_refine,
              },
            },
          },
        },
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

      local telescope = require("telescope")

      telescope.setup(opts)

      telescope.load_extension("fzf")
      telescope.load_extension("live_grep_args")
    end,
    keys = {
      -- {
      --   "<C-P>",
      --   function()
      --     require("telescope.builtin").git_files()
      --   end,
      --   desc = "git files",
      -- },
      {
        "<C-P>",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "find files",
      },
      -- {
      --   "<C-F>",
      --   function()
      --     require("telescope.builtin").live_grep()
      --   end,
      --   desc = "`rg` with `vimgrep_arguments`",
      -- },
      {
        "<C-F>",
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
        "gu",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = "Telescope LSP references (usages)",
      },
    },
  },
}
