local language_servers = {
  "ansiblels",
  "bashls",
  "clangd",
  "docker_compose_language_service",
  "dockerls",
  "emmet_language_server",
  "gopls",
  "helm_ls",
  -- Note: Java stuff is installed using nvim-java
  "jinja_lsp",
  "jsonls",
  "lua_ls",
  "marksman",
  "pylsp",
  "rust_analyzer",
  "ts_ls",
  "volar",
  "yamlls",
}

return {
  "neovim/nvim-lspconfig",
  event = { "VeryLazy" },
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = language_servers,
      },
    },
    {
      "b0o/schemastore.nvim",
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local mason_registry = require("mason-registry")
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
      .. "/node_modules/@vue/language-server"

    for _, lsp_name in pairs(language_servers) do
      lspconfig[lsp_name].setup({})
    end

    lspconfig.jdtls.setup({})

    lspconfig.rust_analyzer.setup({
      settings = {
        ["rust-analyzer"] = {},
      },
    })

    lspconfig.ts_ls.setup({
      settings = {
        ["ts_ls"] = {},
      },
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vue_language_server_path,
            languages = { "vue" },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      capabilities = capabilities,
    })

    -- Note this is setup for Neovim Lua development
    lspconfig.lua_ls.setup({
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        })
      end,
      settings = {
        Lua = {},
      },
      capabilities = capabilities,
    })

    lspconfig.jsonls.setup({
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lspconfig.yamlls.setup({
      filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.ghaction" },
    })

    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
