local main_available, main_module = pcall(require, "clojure.main")
local mapping_available, mapping = pcall(require, "clojure.mapping")

if main_available then
  main_module.main()
end

if mapping_available then
  mapping["on-filetype"]()
end

vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
