local keymaps = require("plugins.lsp.keymaps")

local M = {}

M.lsp_attach = function(ev)
  vim.b.lsp_attached = true
  -- Enable completion triggered by <c-x><c-o>
  vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
  keymaps.set_buffer_keymaps(ev)
end

M.lsp_detach = function(ev)
  local lsp_clients = vim.lsp.get_active_clients({ buffer = ev.buf })

  if #lsp_clients == 1 then
    vim.b.lsp_attached = false
    vim.bo[ev.buf].omnifunc = ""
    keymaps.remove_buffer_keymaps(ev)
  end
end

return M
