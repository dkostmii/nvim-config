return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "black",
        "clang-format",
        "isort",
        "markdownlint",
        "prettier",
        "rustfmt",
        "sqlfmt",
        "stylua",
        "yamlfmt",
      },
      automatic_installation = true,
      handlers = {},
    })
    require("null-ls").setup({})
  end,
}
