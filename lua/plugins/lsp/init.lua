local dap_spec = require("plugins.lsp.dap")
local null_ls_spec = require("plugins.lsp.null_ls")

return {
  dap_spec,
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
          "eslint",
          "jdtls",
          "jsonls",
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
        ["emmet_language_server"] = function()
          local package = require("mason-registry").get_package("emmet-language-server")
          local dir = package:get_install_path()
          local receipt = package:get_receipt():get()
          local bin = dir .. "/" .. receipt.links.bin["emmet-language-server"]

          require("lspconfig").emmet_ls.setup({
            filetypes = {
              "astro",
              "css",
              "eruby",
              "html",
              "htmldjango",
              "javascriptreact",
              "less",
              "pug",
              "sass",
              "scss",
              "svelte",
              "svg",
              "typescriptreact",
              "vue",
            },
            cmd = { bin, "--stdio" },
          })
        end,
      })

      require("plugins.lsp.keymaps").set_global_keymaps()

      local user_lsp_config_group = vim.api.nvim_create_augroup("UserLspConfig", {})

      vim.api.nvim_create_autocmd("LspAttach", {
        group = user_lsp_config_group,
        callback = require("plugins.lsp.handlers").lsp_attach,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = user_lsp_config_group,
        callback = require("plugins.lsp.handlers").lsp_detach,
      })
    end,
  },
}
