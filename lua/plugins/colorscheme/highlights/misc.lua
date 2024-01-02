local colors = require("plugins.colorscheme.colors")
local theme_colors = colors.theme_colors

-- Override misc highlights

vim.api.nvim_set_hl(0, "FileTypeStatus", {
  ctermfg = "magenta",
  ctermbg = "black",
  fg = theme_colors.magenta,
  bg = theme_colors.bg,
})

vim.api.nvim_set_hl(0, "Modified", {
  bold = true,
  ctermbg = "red",
  ctermfg = "white",
  bg = theme_colors.red,
  fg = theme_colors.fg,
})
