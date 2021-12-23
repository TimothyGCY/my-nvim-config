if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = false,
    disable = {}
  },
  ensure_installed = {
    "tsx",
    "toml",
    "php",
    "json",
    "yaml",
    "html",
    "scss"
  },
}

require('nvim-treesitter.install').prefer_git = true
require('nvim-treesitter.install').compilers = { "clang", "gcc" }

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF

