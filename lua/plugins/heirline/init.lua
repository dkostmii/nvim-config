return {
  "rebelot/heirline.nvim",
  dependencies = {
    {
      "SmiteshP/nvim-navic",
      dependencies = {
        "neovim/nvim-lspconfig",
      },
    },
    "nvim-tree/nvim-web-devicons",
    "mfussenegger/nvim-dap",
  },
  config = function()
    local utils = require("heirline.utils")
    local conditions = require("heirline.conditions")
    local get_hl = require("plugins.colorscheme.utils").get_hl

    require("heirline").setup({
      statusline = {
        require("plugins.heirline.components.mode").mode,
        require("plugins.heirline.components.shared").alignment.space,
        require("plugins.heirline.components.filename"),
        require("plugins.heirline.components.shared").alignment.align,
        require("plugins.heirline.components.fileformat"),
        require("plugins.heirline.components.shared").alignment.space,
        require("plugins.heirline.components.filetype"),
        require("plugins.heirline.components.shared").alignment.space,
        require("plugins.heirline.components.lsp_ts"),
        require("plugins.heirline.components.shared").alignment.space,
        require("plugins.heirline.components.debugger"),
        require("plugins.heirline.components.shared").alignment.align,
        require("plugins.heirline.components.indent"),
        require("plugins.heirline.components.shared").alignment.space,
        require("plugins.heirline.components.location"),
        hl = { bg = get_hl("StatusLine").bg },
      },
      winbar = {
        require("plugins.heirline.components.navic"),
      },
      opts = {
        disable_winbar_cb = function(args)
          return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "fugitive", "Trouble", "dashboard" },
          }, args.buf)
        end,
        colors = {
          bright_bg = utils.get_highlight("Folded").bg,
          bright_fg = utils.get_highlight("Folded").fg,
          red = utils.get_highlight("DiagnosticError").fg,
          dark_red = utils.get_highlight("DiffDelete").bg,
          green = utils.get_highlight("String").fg,
          blue = utils.get_highlight("Function").fg,
          gray = utils.get_highlight("NonText").fg,
          orange = utils.get_highlight("Constant").fg,
          purple = utils.get_highlight("Statement").fg,
          cyan = utils.get_highlight("Special").fg,
          diag_warn = utils.get_highlight("DiagnosticWarn").fg,
          diag_error = utils.get_highlight("DiagnosticError").fg,
          diag_hint = utils.get_highlight("DiagnosticHint").fg,
          diag_info = utils.get_highlight("DiagnosticInfo").fg,
          git_del = utils.get_highlight("diffDeleted").fg,
          git_add = utils.get_highlight("diffAdded").fg,
          git_change = utils.get_highlight("diffChanged").fg,
        },
      },
    })
  end,
}
