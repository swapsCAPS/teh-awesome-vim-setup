return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = function()
    local opts = {
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
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
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
    }
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })

    return opts
  end,
}
