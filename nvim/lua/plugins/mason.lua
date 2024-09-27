return {
  {
    "williamboman/mason.nvim",
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "emmet_language_server",
        "lua_ls",
        "helm_ls",
        "jdtls",
        "rust_analyzer",
        "tsserver",
        "marksman",
        "bashls",
        "volar",
        "docker_compose_language_service",
        "dockerls",
        "yamlls",
      },
    },
    lazy = true,
  },
}
