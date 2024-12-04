return {
  "mfussenegger/nvim-lint",
  event = "BufEnter",
  config = function()
    local lint = require("lint")

    -- Bit weird, but it seems you can't pass this to opts : /
    lint.linters_by_ft = {
      markdown = { "vale" },
      yaml = { "yamllint" },
      ghaction = { "actionlint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
      end,
    })
  end,
}
