return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'prettier/vim-prettier'
  use 'mhartington/formatter.nvim'
  use 'tpope/vim-fugitive'
  use 'fatih/vim-go'

  use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }
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

  use {
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
  }

  use 'mfussenegger/nvim-jdtls'
end
)
