vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { desc = "Rename symbol using LSP" })
vim.keymap.set("n", "<F5>", ":w <Enter>", { desc = "Jesus quick saves" })
vim.keymap.set("n", "<F6>", ":set hlsearch!<Enter>", { desc = "Toggle search highlighting" })
vim.keymap.set("n", "<F10>", ":bd <Enter>", { desc = "Delete buffer" })
vim.keymap.set("v", "<leader>=", ":EasyAlign=<Enter>", { desc = "EasyAlign =" })
vim.keymap.set("v", "<leader>:", ":EasyAlign:<Enter>", { desc = "EasyAlign :" })
vim.keymap.set("v", "<leader>,", ":EasyAlign*,<Enter>", { desc = "EasyAlign *" })

vim.keymap.set("i", "jj", "<Esc>", {})

vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, { desc = "vim.diagnostic.open_float" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "vim.lsp.buf.code_action" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP go to definition", noremap = true, silent = true })
vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, { desc = "Format buffer using LSP" })

vim.keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = { vim.fn.expand("%:p") },
  })
end, { desc = "Organize TS imports" })

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Go to parent", silent = true })
