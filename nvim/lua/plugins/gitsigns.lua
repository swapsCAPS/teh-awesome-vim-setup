return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      delay = 100,
    },
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "]C", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Go to next hunk" })

      map("n", "[C", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Go to previous hunk" })

      -- Actions
      map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })

      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "Stage hunk" })
      end)

      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }, { desc = "Reset hunk" })
      end)

      map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })

      map("n", "<leader>gb", function()
        gitsigns.blame_line({ full = true })
      end, { desc = "Blame line with full details" })

      map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })

      map("n", "<leader>gD", function()
        gitsigns.diffthis("~")
      end)

      map("n", "<leader>gQ", function()
        gitsigns.setqflist("all")
      end, { desc = "Populate the quickfix list with all hunks" })
      map("n", "<leader>gq", gitsigns.setqflist, { desc = "Populate the quickfix list with hunks" })

      -- Toggles
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
      map("n", "<leader>tw", gitsigns.toggle_word_diff)

      -- Text object
      map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
    end,
  },
}
