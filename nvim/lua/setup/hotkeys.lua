local nvimTree = require("nvim-tree.api")
local telescope = require("telescope.builtin")
local neogit = require("neogit")
local dapui = require("dapui")

vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<F3>", neogit.open, {})
vim.keymap.set("n", "<F4>", nvimTree.tree.toggle, {})
vim.keymap.set("n", "<F5>", ":w <Enter>", {})
vim.keymap.set("n", "<F6>", ":set hlsearch!<Enter>", {})
vim.keymap.set("n", "<F10>", ":bd <Enter>", {})
vim.keymap.set("v", "<leader>=", ":EasyAlign=<Enter>", {})
vim.keymap.set("v", "<leader>:", ":EasyAlign:<Enter>", {})
vim.keymap.set("v", "<leader>,", ":EasyAlign*,<Enter>", {})

vim.keymap.set("i", "jj", "<Esc>", {})

vim.keymap.set("n", "<leader>d", dapui.float_element, {})
vim.keymap.set("n", "<leader>D", dapui.toggle, {})

vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

vim.keymap.set("n", "<leader>ng", neogit.open, {})

vim.keymap.set("n", "<leader>fo", vim.lsp.buf.format, {})

vim.keymap.set("n", "<leader>oi", function()
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = { vim.fn.expand("%:p") },
  })
end, { desc = "Organize TS imports" })

vim.keymap.set("n", "<C-P>", telescope.find_files, {})
vim.keymap.set("n", "<C-F>", function()
  telescope.grep_string({ search = "" })
end, { desc = "Fuzzy find" })
vim.keymap.set("n", "<C-B>", telescope.buffers, {})
vim.keymap.set("n", "<leader>fh", telescope.help_tags, {})

vim.keymap.set("n", "]g", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, {})

vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
