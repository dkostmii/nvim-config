local utils = require("heirline.utils")
local breakpoints = require("plugins.heirline.components.shared").breakpoints
local theme_colors = require("plugins.colorscheme.colors").theme_colors

local filetype = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = theme_colors.magenta, bg = theme_colors.bg },
}

filetype = {
  condition = function()
    return vim.fn.winwidth(0) >= breakpoints.micro and string.len(vim.bo.filetype) > 0
  end,
  utils.surround({ "", "" }, theme_colors.bg, filetype),
}

return filetype
