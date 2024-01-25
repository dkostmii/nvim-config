local conditions = require("heirline.conditions")
local breakpoints = require("plugins.heirline.components.shared").breakpoints

local function null_ls_providers(filetype)
  local registered = {}
  -- try to load null-ls
  local sources_avail, sources = pcall(require, "null-ls.sources")
  if sources_avail then
    -- get the available sources of a given filetype
    for _, source in ipairs(sources.get_available(filetype)) do
      -- get each source name
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        table.insert(registered[method], source.name)
      end
    end
  end
  -- return the found null-ls sources
  return registered
end

--- Get the null-ls sources for a given null-ls method
---@param filetype string the filetype to search null-ls for
---@param method string the null-ls method (check null-ls documentation for available methods)
---@return string[] # the available sources for the given filetype and method
local function null_ls_sources(filetype, method)
  local methods_avail, methods = pcall(require, "null-ls.methods")
  return methods_avail and null_ls_providers(filetype)[methods.internal[method]] or {}
end

local lsp_list = {
  condition = function()
    return vim.b.lsp_attached and vim.fn.winwidth(0) >= breakpoints.large
  end,
  provider = function()
    local opts = { expand_null_ls = true }
    local names = {}

    for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
      if server.name == "null-ls" and opts.expand_null_ls then
        local sources = {}
        for _, type in ipairs({ "FORMATTING", "DIAGNOSTICS" }) do
          for _, source in ipairs(null_ls_sources(vim.bo.filetype, type)) do
            table.insert(sources, source)
          end
        end

        if #sources > 0 then
          local null_ls_entry = server.name .. " (" .. table.concat(sources, ", ") .. ")"
          table.insert(names, null_ls_entry)
        end
      else
        table.insert(names, server.name)
      end
    end

    return " [" .. table.concat(names, " ") .. "]"
  end,
}

local lsp = {
  condition = function()
    return vim.b.lsp_attached == true
  end,
  provider = "LSP",
  lsp_list,
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
