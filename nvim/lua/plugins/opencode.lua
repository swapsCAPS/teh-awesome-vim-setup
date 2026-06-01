return {
  "simonwinther/opencode-tmux.nvim",
  name = "opencode-tmux",
  version = "*", -- use latest stable release (recommended)

  keys = {
    {
      "<leader>oo",
      function()
        require("opencode-tmux").tmux_toggle()
      end,
      mode = { "n", "v" },
      desc = "Toggle OpenCode pane",
    },
    {
      "go",
      function()
        require("opencode-tmux").send()
      end,
      mode = { "n", "v" },
      desc = "Send to OpenCode",
    },
    {
      "<leader>oB",
      function()
        require("opencode-tmux").send_buffer()
      end,
      desc = "Send buffer with prompt",
    },
    {
      "<leader>op",
      function()
        require("opencode-tmux").select_prompt()
      end,
      mode = { "n", "v" },
      desc = "Pick a prompt",
    },
    {
      "<leader>oa",
      function()
        require("opencode-tmux").ask({ submit = true })
      end,
      mode = { "n", "v" },
      desc = "Ask OpenCode",
    },
    {
      "<leader>os",
      function()
        require("opencode-tmux").submit_prompt()
      end,
      desc = "Submit OpenCode prompt",
    },
    {
      "<leader>oc",
      function()
        require("opencode-tmux").clear_prompt()
      end,
      desc = "Clear OpenCode prompt",
    },
  },

  config = function()
    require("opencode-tmux").setup({
      port = 4096,
      split = "h", -- "h" side-by-side, "v" stacked
      size = 40, -- pane size in %
      compact_context = false, -- skip code block fences to save tokens
      code_fence = "backticks", -- "backticks", "xml", or { open, close }
    })
  end,
}
