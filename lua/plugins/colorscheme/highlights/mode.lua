local colors = require("plugins.colorscheme.colors")
local theme_colors = colors.theme_colors
local get_hl = require("plugins.colorscheme.utils").get_hl

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
  bg = theme_colors.bg,
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

vim.api.nvim_set_hl(0, "ModeInvUnknown", {
  ctermfg = defaults.ctermbg,
  fg = defaults.bg,
  bg = get_hl("StatusLine").bg,
})

vim.api.nvim_set_hl(0, "ModeInvNormal", {
  fg = theme_colors.bg,
  bg = get_hl("StatusLine").bg,
  ctermfg = "blue",
})

vim.api.nvim_set_hl(0, "ModeInvCommand", {
  fg = theme_colors.yellow,
  bg = get_hl("StatusLine").bg,
  ctermfg = "yellow",
})

vim.api.nvim_set_hl(0, "ModeInvVisual", {
  fg = theme_colors.green,
  bg = get_hl("StatusLine").bg,
  ctermfg = "green",
})

vim.api.nvim_set_hl(0, "ModeInvSelect", {
  fg = theme_colors.purple,
  bg = get_hl("StatusLine").bg,
  ctermfg = "magenta",
})

vim.api.nvim_set_hl(0, "ModeInvReplace", {
  fg = theme_colors.red,
  bg = get_hl("StatusLine").bg,
  ctermfg = "red",
})

vim.api.nvim_set_hl(0, "ModeInvInsert", {
  fg = theme_colors.cyan,
  bg = get_hl("StatusLine").bg,
  ctermfg = "cyan",
})
