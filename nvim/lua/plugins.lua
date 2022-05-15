return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'prettier/vim-prettier'
  use 'tpope/vim-fugitive'
  use 'fatih/vim-go'

  use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use "lukas-reineke/indent-blankline.nvim"

  use { 
    'windwp/nvim-autopairs', 
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use "folke/trouble.nvim"

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
end
)
