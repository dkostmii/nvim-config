local theme_colors = require("plugins.colorscheme.colors").theme_colors

vim.api.nvim_set_hl(0, "Whitespace", { fg = theme_colors.dark_green, bg = theme_colors.none })
