return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local mason_registry = require("mason-registry")
    local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
      .. "/node_modules/@vue/language-server"

    lspconfig.clangd.setup({})

    lspconfig.jdtls.setup({})

    lspconfig.marksman.setup({})

    lspconfig.bashls.setup({})

    lspconfig.pylsp.setup({})

    lspconfig.emmet_language_server.setup({})

    lspconfig.docker_compose_language_service.setup({})

    lspconfig.jsonls.setup({})

    lspconfig.yamlls.setup({})

    lspconfig.dockerls.setup({})

    lspconfig.gopls.setup({})

    lspconfig.pylsp.setup({})

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

    lspconfig.volar.setup({})

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

    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
