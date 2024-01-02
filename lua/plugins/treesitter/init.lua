return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  config = function()
    require("plugins.treesitter.custom")
    require("plugins.treesitter.config")

    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local ok, parsers = pcall(require, "nvim-treesitter.parsers")

        if ok then
          if parsers.has_parser() then
            vim.b.treesitter_available = true
          end
        end
      end,
    })
  end,
}
