local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.plantuml = {
  install_info = {
    url = vim.fn.stdpath("config") .. "/parsers/tree_sitter_plantuml",
    files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "plantuml", -- if filetype does not match the parser name
}

parser_config.mavka = {
  install_info = {
    url = vim.fn.stdpath("config") .. "/parsers/tree-sitter-mavka",
    files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "mavka", -- if filetype does not match the parser name
}
