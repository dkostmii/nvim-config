local colors = require("solarized-osaka.colors").default
local hslutil = require("solarized-osaka.hsl")
local hsl = hslutil.hslToHex

local M = {}

M.theme_colors = {
  bg = colors.bg,
  fg = colors.fg,
  dark_black = hsl(22, 22, 22),
  dark_red = colors.red900,
  dark_green = colors.green900,
  dark_yellow = colors.yellow900,
  dark_blue = colors.blue900,
  dark_magenta = colors.magenta900,
  dark_cyan = colors.cyan900,
  dark_white = hsl(169, 169, 169),
  black = hsl(44, 44, 44),
  red = colors.red,
  green = colors.green,
  yellow = colors.yellow,
  blue = colors.blue,
  magenta = colors.magenta,
  cyan = colors.cyan,
  white = hsl(192, 192, 192),
  bright_black = hsl(56, 56, 56),
  bright_red = colors.red100,
  bright_green = colors.green100,
  bright_yellow = colors.yellow100,
  bright_blue = colors.blue100,
  bright_magenta = colors.magenta100,
  bright_cyan = colors.cyan100,
  bright_white = hsl(244, 244, 244),
  -- Auxiliary colors
  blankline = colors.none,
  cursor_bg = colors.fg,
  cursor_fg = colors.bg,
  purple = colors.violet,
  none = colors.none,
}

M.theme_utils = require("plugins.colorscheme.utils")

return M
