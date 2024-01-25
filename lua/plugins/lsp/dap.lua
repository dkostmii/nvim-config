return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = { "debugpy" },
      handlers = {
        function(config)
          -- all sources with no handler get passed here

          -- Keep original functionality
          require("mason-nvim-dap").default_setup(config)
        end,
        -- python = function(config)
        --   config.adapters = {
        --     type = "executable",
        --     command = "/usr/bin/python3",
        --     args = {
        --       "-m",
        --       "debugpy.adapter",
        --     },
        --   }
        --   require("mason-nvim-dap").default_setup(config) -- don't forget this!
        -- end,
      },
    })

    -- Debugger keymaps
    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, { desc = "Resume execution" })
    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, { desc = "Step over function or method" })
    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, { desc = "Step into function or method" })
    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, { desc = "Step out of function or method" })
    vim.keymap.set("n", "<Leader>b", function()
      require("dap").toggle_breakpoint()
    end, { desc = "Add or remove breakpoint at the current line" })
    vim.keymap.set("n", "<Leader>B", function()
      require("dap").set_breakpoint()
    end, { desc = "Add or overwrite breakpoint at the current line" })
    vim.keymap.set("n", "<Leader>lp", function()
      require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end)
    vim.keymap.set("n", "<Leader>dr", function()
      require("dap").repl.open()
    end, { desc = "Open a REPL / Debug-console" })
    vim.keymap.set("n", "<Leader>dl", function()
      require("dap").run_last()
    end, { desc = "Run the last DAP or config" })
    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      require("dap.ui.widgets").hover()
    end, { desc = "View the value under cursor in a floating window" })
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      require("dap.ui.widgets").preview()
    end, { desc = "View the value under cursor in a preview window" })
    vim.keymap.set("n", "<Leader>df", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set("n", "<Leader>ds", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end, { desc = "View the current scopes in a centered floating window" })
  end,
}
