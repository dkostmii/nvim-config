local M = {}

M.set_global_keymaps = function()
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
end

M.set_buffer_keymaps = function(ev)
  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end

M.remove_buffer_keymaps = function(ev)
  -- Remove buffer local mappings
  local opts = { buffer = ev.buf }

  vim.keymap.set("n", "gD", "<nop>", opts)
  vim.keymap.set("n", "gd", "<nop>", opts)
  vim.keymap.set("n", "K", "<nop>", opts)
  vim.keymap.set("n", "gi", "<nop>", opts)
  vim.keymap.set("n", "<C-k>", "<nop>", opts)
  vim.keymap.set("n", "<space>wa", "<nop>", opts)
  vim.keymap.set("n", "<space>wr", "<nop>", opts)
  vim.keymap.set("n", "<space>wl", "<nop>", opts)
  vim.keymap.set("n", "<space>D", "<nop>", opts)
  vim.keymap.set("n", "<space>rn", "<nop>", opts)
  vim.keymap.set({ "n", "v" }, "<space>ca", "<nop>", opts)
  vim.keymap.set("n", "gr", "<nop>", opts)
  vim.keymap.set("n", "<space>f", "<nop>", opts)
end

return M
