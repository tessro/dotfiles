-- Autocommand that resyncs plugins whenever this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)
  -- Packer can manage itself!
  use 'wbthomason/packer.nvim'

  -- Color schemes
  use 'arcticicestudio/nord-vim'
  use 'rose-pine/neovim'

  -- Many utilities
  use {
    'echasnovski/mini.nvim',
    config = function()
      require('plugins.mini')
    end,
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    },
    config = function()
      require('plugins.cmp')
    end,
  }

  -- Fuzzy find
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      config = function()
        require('plugins.telescope')
      end,
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      config = function()
        require('telescope').load_extension('frecency')
      end,
      requires = { 'tami5/sqlite.lua' },
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
  }

  -- Git
  use 'airblade/vim-gitgutter'

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    {
      'jose-elias-alvarez/null-ls.nvim',
      requires = 'nvim-lua/plenary.nvim',
    },
    {
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      requires = 'nvim-lua/plenary.nvim',
    },
    {
      'simrat39/rust-tools.nvim',
      requires = 'nvim-lua/plenary.nvim',
    },
  }

  -- Snippets
  use 'hrsh7th/vim-vsnip'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end
  }
end)
