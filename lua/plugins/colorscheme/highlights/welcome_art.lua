local colors = require("plugins.colorscheme.colors")
local theme_colors = colors.theme_colors
local theme_utils = colors.theme_utils

-- local darken_percent = 50

local welcome_screen_colors = {
  cyan = theme_colors.cyan,
  magenta = theme_colors.pink,
  yellow = theme_colors.yellow,
  cyan_dark = theme_colors.dark_cyan,
  magenta_dark = theme_colors.dark_magenta,
  yellow_dark = theme_colors.dark_yellow,
}

-- Welcome screen highlights

vim.api.nvim_set_hl(0, "WelcomeArt1", {
  fg = welcome_screen_colors.cyan,
  ctermfg = "cyan",
  bold = true,
})

vim.api.nvim_set_hl(0, "WelcomeArt2", {
  fg = welcome_screen_colors.magenta,
  ctermfg = "magenta",
  bold = true,
})

vim.api.nvim_set_hl(0, "WelcomeArt3", {
  fg = welcome_screen_colors.yellow,
  ctermfg = "yellow",
  bold = true,
})

vim.api.nvim_set_hl(0, "WelcomeArt4", {
  fg = welcome_screen_colors.cyan_dark,
  ctermfg = "darkcyan",
  bold = true,
})

vim.api.nvim_set_hl(0, "WelcomeArt5", {
  fg = welcome_screen_colors.magenta_dark,
  ctermfg = "darkmagenta",
  bold = true,
})

vim.api.nvim_set_hl(0, "WelcomeArt6", {
  fg = welcome_screen_colors.yellow_dark,
  ctermfg = "darkyellow",
  bold = true,
})

vim.api.nvim_set_hl(0, "Title", {
  fg = welcome_screen_colors.yellow,
  ctermfg = "yellow",
  bold = true,
})

vim.api.nvim_set_hl(0, "Subtitle", {
  fg = welcome_screen_colors.magenta,
  ctermfg = "magenta",
  italic = true,
})
