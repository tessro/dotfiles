return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Many utilities
  use 'echasnovski/mini.nvim'

  -- Fuzzy find
  -- Optional
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'tami5/sqlite.lua'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-frecency.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  -- Git
  use 'airblade/vim-gitgutter'

  -- Collection of common configurations for the Nvim LSP client
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- TypeScript
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  -- Completion framework
  use 'hrsh7th/nvim-cmp'

  -- LSP completion source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippet completion source for nvim-cmp
  use 'hrsh7th/cmp-vsnip'

  -- Other useful completion sources
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'

  -- See hrsh7th's other plugins for more completion sources!

  -- To enable more of the features of rust-analyzer, such as inlay hints and more!
  use 'simrat39/rust-tools.nvim'

  -- Snippet engine
  use 'hrsh7th/vim-vsnip'

  -- Color scheme used in the GIFs!
  use 'arcticicestudio/nord-vim'
end)
