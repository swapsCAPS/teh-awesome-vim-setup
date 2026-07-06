return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  -- event = {
  --   "BufEnter *.md",
  --   "BufEnter *.lua",
  --   "BufEnter *.ts",
  --   "BufEnter *.py",
  --   "BufEnter *.rs",
  --   "BufEnter *.go",
  --   "BufEnter *.rb",
  --   "BufEnter *.json",
  --   "BufEnter *.yaml",
  --   "BufEnter *.yml",
  --   "BufEnter *.conf",
  -- },
  opts = {
    mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = "─",
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  },
}
