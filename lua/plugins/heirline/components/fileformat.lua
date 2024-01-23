local breakpoints = require("plugins.heirline.components.shared").breakpoints

local function join(tbl, sep)
  local result = ""
  for _, p in ipairs(tbl) do
    if string.len(p) > 0 then
      if string.len(result) > 0 then
        result = result .. sep
      end

      result = result .. p
    end
  end

  return result
end

local fileformat = {
  condition = function()
    return vim.fn.winwidth(0) >= breakpoints.micro
  end,
  provider = function()
    local fileencoding = ""
    local fileformat = ""
    local endoffile = ""

    if vim.bo.fileencoding ~= "utf-8" then
      fileencoding = string.upper(vim.bo.fileencoding)
    end

    if vim.bo.fileformat ~= "unix" then
      fileformat = string.upper(vim.bo.fileformat)
    end

    if vim.bo.endoffile then
      endoffile = "EOF"
    end

    return join({ fileencoding, fileformat, endoffile }, " ")
  end,
}

return fileformat
