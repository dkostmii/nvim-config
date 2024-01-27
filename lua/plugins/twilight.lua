return {
  "folke/twilight.nvim",
  config = function(opts)
    require("twilight").setup(opts)

    vim.keymap.set("n", "<leader>t", "<cmd>Twilight<cr>", {
      desc = "Toggles Twilight for focus",
    })
  end,
}
