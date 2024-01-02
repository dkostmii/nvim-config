local opts = {
  source_selector = {
    statusline = true,
    winbar = false,
  },
  window = {
    mappings = {
      ["h"] = "close_node",
      ["l"] = "open",
    },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup(opts)
  end,
}
