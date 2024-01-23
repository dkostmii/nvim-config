local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local breakpoints = require("plugins.heirline.components.shared").breakpoints

local filename_block = {
  condition = function()
    return not conditions.buffer_matches({ filetype = { "alpha" } })
  end,
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local filename = {
  provider = function(self)
    local win_width = vim.fn.winwidth(0)
    -- use tilda instead of /home/$USER
    local shortened_filename = self.filename

    if shortened_filename == "" then
      return "[No name]"
    end

    if win_width < breakpoints.small then
      -- only tail
      shortened_filename = vim.fn.expand("%:t")
    elseif win_width < breakpoints.large then
      -- same, but shorten path
      shortened_filename = vim.fn.expand("%:~:.")
      shortened_filename = vim.fn.pathshorten(shortened_filename)
    else
      shortened_filename = vim.fn.expand("%:~")
    end

    return shortened_filename
  end,
  hl = { fg = utils.get_highlight("Directory").fg },
}

local filename_modifier = {
  hl = function()
    if vim.bo.modified then
      return { fg = "yellow", bold = true, force = true }
    elseif not vim.bo.modifiable or vim.bo.readonly then
      return { fg = "gray", force = true }
    end
  end,
}

local file_flags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "*",
    hl = { fg = "yellow", bold = true },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = { fg = "gray" },
  },
}

local file_icon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")

    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

filename_block =
  utils.insert(filename_block, file_icon, utils.insert(filename_modifier, filename), file_flags, { provider = "%<" })

return filename_block
