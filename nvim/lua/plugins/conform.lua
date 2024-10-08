return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "black" },
      -- Use a sub-list to run only the first available formatter
      javascript = function()
        -- TODO check for eslint config and use it if it exists
        return { "prettierd", "prettier", stop_after_first = true }
      end,
      typescript = function()
        -- TODO check for eslint config and use it if it exists
        return { "prettierd", "prettier", stop_after_first = true }
      end,
      vue = { "prettierd", "prettier", stop_after_first = true },
      -- xml = { "xmllint" },
      markdown = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
    -- log_level = vim.log.levels.DEBUG, -- Use `:ConformInfo` to see the location of the log file.
    formatters = {
      prettier = function()
        return {
          -- Only run formatter if prettier config is found in project
          require_cwd = true,

          cwd = require("conform.util").root_file({
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.js",
            -- Yes there are other rc file extensions available. I don't care.
          }),
        }
      end,
    },
  },
}
