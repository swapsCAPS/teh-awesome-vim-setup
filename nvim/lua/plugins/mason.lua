local language_servers = {
  "ansiblels",
  "bashls",
  "clangd",
  "docker_compose_language_service",
  "dockerls",
  "emmet_language_server",
  "gopls",
  "helm_ls",
  "jinja_lsp",
  "jsonls",
  "lua_ls",
  "marksman",
  "pylsp",
  "rust_analyzer",
  "ts_ls",
  "yamlls",
}

return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufEnter",
  opts = {
    ensure_installed = language_servers,
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
