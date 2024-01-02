local colors = require("plugins.colorscheme.colors")
local theme_colors = colors.theme_colors

-- Status mode highlights

local defaults = {
  ctermbg = "white",
  ctermfg = "black",
  bg = theme_colors.cursor_bg,
  fg = theme_colors.cursor_fg,
  bold = true,
}

vim.api.nvim_set_hl(0, "ModeUnknown", {
  ctermbg = defaults.ctermbg,
  ctermfg = defaults.ctermfg,
  bg = defaults.bg,
  fg = defaults.fg,
  bold = defaults.bold,
})

vim.api.nvim_set_hl(0, "ModeNormal", {
  bg = theme_colors.blankline,
  fg = theme_colors.cursor_bg,
  ctermbg = "blue",
  ctermfg = "white",
  bold = defaults.bold,
})

vim.api.nvim_set_hl(0, "ModeCommand", {
  bg = theme_colors.yellow,
  fg = theme_colors.bg,
  ctermbg = "yellow",
  ctermfg = defaults.ctermfg,
  bold = defaults.bold,
})

vim.api.nvim_set_hl(0, "ModeVisual", {
  bg = theme_colors.green,
  fg = theme_colors.bg,
  ctermbg = "green",
  ctermfg = defaults.ctermfg,
  bold = defaults.bold,
})

vim.api.nvim_set_hl(0, "ModeSelect", {
  bg = theme_colors.purple,
  fg = defaults.fg,
  ctermbg = "magenta",
  ctermfg = defaults.ctermfg,
})

vim.api.nvim_set_hl(0, "ModeReplace", {
  bg = theme_colors.red,
  fg = theme_colors.bg,
  ctermbg = "red",
  ctermfg = "white",
  bold = defaults.bold,
})

vim.api.nvim_set_hl(0, "ModeInsert", {
  bg = theme_colors.cyan,
  fg = theme_colors.bg,
  ctermbg = "cyan",
  ctermfg = defaults.ctermfg,
  bold = defaults.bold,
})
