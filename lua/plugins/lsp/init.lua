local null_ls_spec = require("plugins.lsp.null_ls")

return {
  null_ls_spec,
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup({})
        end,
      },
      "neovim/nvim-lspconfig",
    },
    event = "BufEnter",
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {
          "astro",
          "biome",
          "clangd",
          "emmet_language_server",
          "jdtls",
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "tsserver",
          "vimls",
          "vuels",
        },
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = function(client, bufnr)
              if client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
              end
            end,
          })
        end,
      })

      require("plugins.lsp.keymaps")
    end,
  },
}
