local lazy = require("lazy")

local plugins = {
  {
    'j-hui/fidget.nvim'
  },
  {
    'folke/neodev.nvim'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'folke/which-key.nvim'
  },
  {
    'windwp/nvim-ts-autotag'
  },
  {
    'windwp/nvim-autopairs'
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      local tree = require 'nvim-tree'

      tree.setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
    }
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip'
    }
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    }
  },
  {
    'nvimtools/none-ls.nvim'
  },
  {
    'nvim-lualine/lualine.nvim'
  }
}

lazy.setup(plugins)
