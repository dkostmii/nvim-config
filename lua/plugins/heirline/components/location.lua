local utils = require("heirline.utils")

local createModeWrapper = require("plugins.heirline.components.mode").createModeWrapper
local breakpoints = require("plugins.heirline.components.shared").breakpoints

local location_caption = {
  provider = function(self)
    local win_width = vim.fn.winwidth(0)

    local textwidth_caption = vim.bo.textwidth

    if vim.bo.textwidth == 0 then
      textwidth_caption = "MAX"
    end

    if win_width < breakpoints.medium then
      return "%P"
    elseif win_width < breakpoints.large then
      return "L:%l/%L %P"
    end

    return "C:%c/" .. textwidth_caption .. " L:%l/%L %P"
  end,
}

local location_rect = createModeWrapper({
  utils.surround({ " ", " " }, nil, location_caption),
}, { inverse = false })

local location_head = createModeWrapper({
  provider = "",
}, { inverse = true })

return {
  location_head,
  location_rect,
}
