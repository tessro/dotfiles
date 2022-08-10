-- Autocommand that resyncs plugins whenever this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)
  -- Packer can manage itself!
  use 'wbthomason/packer.nvim'

  -- Many utilities
  use 'echasnovski/mini.nvim'

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

  -- Collection of common configurations for the Nvim LSP client
  use 'neovim/nvim-lspconfig'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- TypeScript
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
    }
  }

  -- To enable more of the features of rust-analyzer, such as inlay hints and more!
  use 'simrat39/rust-tools.nvim'

  -- Snippet engine
  use 'hrsh7th/vim-vsnip'

  -- Color scheme used in the GIFs!
  use 'arcticicestudio/nord-vim'
end)
