local debugger = {
  condition = function()
    local session = require("dap").session()
    return session ~= nil
  end,
  provider = function()
    local session = require("dap").session()
    local adapter_command = session.adapter.command
    local adapter_name = vim.fn.fnamemodify(adapter_command, ":t")

    return " " .. "[" .. adapter_name .. "]: " .. require("dap").status()
  end,
  hl = "Debug",
}

return debugger
