-- Install plugins
return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim' -- the manager itself

  use 'navarasu/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'rgarver/Kwbd.vim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocomplete
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
    },
  }

  use { 'mfussenegger/nvim-dap' }

  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }

  -- Language specifics
  use 'lervag/vimtex'

  use 'folke/which-key.nvim'


end)
