require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "awk",
    "bash",
    "c",
    "cpp",
    "c_sharp",
    "csv",
    "css",
    "clojure",
    "dockerfile",
    "scss",
    "kotlin",
    "lua",
    "latex",
    "matlab",
    "markdown",
    "markdown_inline",
    "html",
    "java",
    "javascript",
    "json",
    "julia",
    "python",
    "rust",
    "scheme",
    "sql",
    "typescript",
    "tsx",
    "todotxt",
    "toml",
    "vim",
    "vimdoc",
    "yaml",
    "xml",
  },

  auto_install = true,
  highlight = {
    enable = true,
    additional_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})

-- vim.cmd[[TSUpdate]]
