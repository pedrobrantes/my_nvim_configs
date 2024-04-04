local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = { 'markdown', 'markdown_inline', 'lua', 'vimdoc' },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
