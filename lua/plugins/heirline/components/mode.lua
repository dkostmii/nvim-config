local utils = require("heirline.utils")
-- local conditions = require("heirline.conditions")

local colors = require("plugins.colorscheme.colors")
local theme_colors = colors.theme_colors
local breakpoints = require("plugins.heirline.components.shared").breakpoints

local M = {}

local defaults = {
  bg = theme_colors.cursor_bg,
  fg = theme_colors.cursor_fg,
  bold = true,
}

local function startswith(longer, shorter)
  return longer:sub(1, #shorter) == shorter
end

local function getModeName(mode)
  if startswith(mode, "n") then
    return "NORMAL"
  elseif startswith(mode, "c") then
    return "COMMAND"
  elseif startswith(string.lower(mode), "v") then
    return "VISUAL"
  elseif startswith(mode, "^V") then
    return "VISUAL"
  elseif startswith(string.lower(mode), "s") then
    return "SELECT"
  elseif startswith(mode, "R") then
    return "REPLACE"
  elseif startswith(mode, "i") then
    return "INSERT"
  elseif startswith(mode, "r") then
    return "PROMPT"
  elseif startswith(mode, "!") then
    return "SHELL"
  elseif startswith(mode, "t") then
    return "TERMJOB"
  end

  return "UNKNOWN"
end

local keymap = {
  condition = function()
    return vim.bo.keymap ~= "" and (vim.bo.iminsert > 0 or vim.bo.imsearch > 0)
  end,
  provider = function()
    return " (" .. vim.b.keymap_name .. ")"
  end,
}

local mode_caption = {
  provider = function(self)
    local caption = self.mode_name

    if vim.fn.winwidth(0) < breakpoints.medium then
      caption = caption:sub(1, 1)
    end

    return " " .. caption
  end,
  hl = function(self)
    local colors_hl = self.mode_hls[self.mode_name]

    return vim.tbl_extend("error", colors_hl, { bold = defaults.bold })
  end,
  keymap,
}

M.createModeWrapper = function(child, opts)
  local mode_wrapper = {
    init = function(self)
      self.mode_name = getModeName(vim.fn.mode(1))
      self.inverse = opts.inverse == true
    end,
    static = {
      mode_hls = {
        ["UNKNOWN"] = { fg = defaults.fg, bg = defaults.bg },
        ["NORMAL"] = { fg = theme_colors.cursor_bg, bg = theme_colors.bg },
        ["COMMAND"] = { fg = theme_colors.bg, bg = theme_colors.yellow },
        ["VISUAL"] = { fg = theme_colors.bg, bg = theme_colors.green },
        ["SELECT"] = { fg = theme_colors.bg, bg = theme_colors.purple },
        ["REPLACE"] = { fg = theme_colors.bg, bg = theme_colors.red },
        ["INSERT"] = { fg = theme_colors.bg, bg = theme_colors.cyan },
      },
    },
    hl = function(self)
      local colors_hl = self.mode_hls[self.mode_name]

      if self.inverse then
        return { fg = colors_hl.bg, bold = defaults.bold, force = true }
      end

      return vim.tbl_extend("error", colors_hl, { bold = defaults.bold, force = true })
    end,
  }

  return utils.insert(mode_wrapper, child)
end

local mode_rect = M.createModeWrapper({
  utils.surround({ " ", " " }, nil, mode_caption),
}, { inverse = false })

local mode_tail = M.createModeWrapper({
  provider = "",
}, { inverse = true })

M.mode = {
  mode_rect,
  mode_tail,
}

return M
