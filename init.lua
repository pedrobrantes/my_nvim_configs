require('hello')
require('mappings')
require('options')
require('autocmd')
require('lazy_installer')
require('plugin_manager')

-- Load Vim-Plug
vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')
]]

-- List of plugins
-- Add your plugins below using the syntax: Plug 'author_name/plugin_name'

-- Example:
-- vim.cmd [[Plug 'preservim/nerdtree']]

-- End of the list of plugins
vim.cmd [[
  call plug#end()
]]

-- Enable Vim Plug
vim.cmd [[
  call plug#begin('~/.config/nvim/plugged')
]]

-- Plugin for the Gruvbox Material theme
vim.cmd [[
  Plug 'sainnhe/gruvbox-material'
]]

-- End the plugin block
vim.cmd [[
  call plug#end()
]]

-- Configure the theme
vim.cmd('colorscheme gruvbox-material')
