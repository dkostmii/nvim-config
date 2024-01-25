vim.filetype.add({
  extension = {
    mavka = 'mavka',
    pu = 'plantuml',
    puml = 'plantuml',
    plantuml = 'plantuml',
  },
  pattern = {
    [".*\\.мавка"] = 'mavka',
    [".*\\.м"] = 'mavka',
  }
})

local filetype_config_group = vim.api.nvim_create_augroup("UserFileTypeConfig", {})

local function configure_filetype(pattern, opts)
  vim.api.nvim_create_autocmd("FileType", {
    group = filetype_config_group,
    pattern = pattern,
    callback = function()
      if opts.callback ~= nil then
        opts.callback()
      end

      if opts.tabstop ~= nil then
        vim.bo.tabstop = opts.tabstop
      end

      if opts.shiftwidth ~= nil then
        vim.bo.shiftwidth = opts.shiftwidth
      end

      if opts.softtabstop ~= nil then
        vim.bo.softtabstop = opts.softtabstop
      end

      if opts.expandtab ~= nil then
        vim.bo.expandtab = opts.expandtab
      end
    end,
  })
end

configure_filetype("clojure", {
  callback = function()
    local main_available, main_module = pcall(require, "clojure.main")
    local mapping_available, mapping = pcall(require, "clojure.mapping")

    if main_available then
      main_module.main()
    end

    if mapping_available then
      mapping["on-filetype"]()
    end
  end,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
})

configure_filetype("css", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
})

configure_filetype("fish", {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
})

configure_filetype("html", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
})

configure_filetype("java", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
})

configure_filetype("javascript", {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
})

configure_filetype("javascriptreact", {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
})

configure_filetype("json", {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
})

configure_filetype("matlab", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
})

configure_filetype("mavka", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
})

configure_filetype("sass", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
})

configure_filetype("scss", {
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
  expandtab = true,
})

configure_filetype("typescript", {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
})

configure_filetype("typescriptreact", {
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  expandtab = true,
})
