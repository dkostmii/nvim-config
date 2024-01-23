local breakpoints = require("plugins.heirline.components.shared").breakpoints

local shiftwidth = {
  condition = function()
    return vim.bo.shiftwidth ~= vim.bo.tabstop
  end,
  provider = function()
    return " >> " .. vim.bo.shiftwidth
  end,
}

local indent = {
  condition = function()
    return vim.fn.winwidth(0) >= breakpoints.micro
  end,
  static = {
    labels = {
      short = {
        soft = "S-T",
        tabs = "T",
        spaces = "S",
      },
      long = {
        soft = "SOFT",
        tabs = "TABS",
        spaces = "SPCS",
      },
    },
  },
  provider = function(self)
    local labels = self.labels.long

    if vim.fn.winwidth(0) < breakpoints.small then
      labels = self.labels.short
    end

    local shiftwidth_value = vim.bo.shiftwidth

    if shiftwidth_value == 0 then
      shiftwidth_value = vim.bo.tabstop
    end

    if vim.bo.expandtab then
      return labels.spaces .. ": " .. vim.bo.tabstop
    elseif
      vim.bo.softtabstop ~= 0
      and not (vim.bo.softtabstop < 0 and (vim.bo.shiftwidth == 0 or vim.bo.shiftwidth == vim.bo.tabstop))
    then
      local softtabstop_value = shiftwidth_value

      if vim.bo.softtabstop > 0 then
        softtabstop_value = vim.bo.softtabstop
      end

      return labels.soft .. ": " .. vim.bo.tabstop .. "/" .. softtabstop_value
    end

    return labels.tabs .. ": " .. vim.bo.tabstop
  end,
  shiftwidth,
}

return indent
