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
  event = "VeryLazy",
  opts = {
    ensure_installed = language_servers,
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        -- Security: left unpinned, Mason refreshes this registry every 24h and
        -- ensure_installed silently re-resolves to whatever upstream published.
        -- Bump this string deliberately, the same way you bump lazy-lock.json.
        registries = { "github:mason-org/mason-registry@2026-10-27-human-horror" },
        -- socket.dev scanning for the npm/pypi/cargo install paths.
        firewall = { enabled = true },
      },
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        vim.lsp.config("yamlls", {
          settings = {
            yaml = {
              schemaStore = { enable = true },
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              },
            },
          },
        })

        vim.lsp.config("helm_ls", {
          settings = {
            ["helm-ls"] = {
              yamlls = {
                path = "yaml-language-server",
              },
            },
          },
        })

        return {}
      end,
    },
  },
}
