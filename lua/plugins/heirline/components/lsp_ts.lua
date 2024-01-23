local breakpoints = require("plugins.heirline.components.shared").breakpoints

local lsp = {
  condition = function()
    return vim.b.lsp_attached == true
  end,
  provider = "LSP",
}

local ts = {
  condition = function()
    return vim.b.treesitter_available == true
  end,
  provider = "TS",
}

local lsp_ts = {
  condition = function()
    return vim.fn.winwidth(0) >= breakpoints.small
  end,
  hl = { fg = "green", bold = true },
  lsp,
  {
    condition = function()
      return vim.b.lsp_attached == true
    end,
    provider = " ",
  },
  ts,
}

return lsp_ts
