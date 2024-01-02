return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.opt.background = "dark"
    vim.opt.termguicolors = true
    vim.cmd.colorscheme("solarized-osaka")

    require("plugins.colorscheme.colors")
    require("plugins.colorscheme.highlights")
  end,
}
