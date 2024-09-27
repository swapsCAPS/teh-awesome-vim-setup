return {
  "mfussenegger/nvim-lint",
  lazy = true,
  opts = {
    linters_by_ft = {
      markdown = { "vale" },
      yaml = { "yamllint" },
      ghaction = { "actionlint" },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
      end,
    })
  end,
}
