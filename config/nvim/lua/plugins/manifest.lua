return {
  -- Color schemes
  "arcticicestudio/nord-vim",
  "catppuccin/nvim",
  "rose-pine/neovim",

  -- Many utilities
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      require("plugins.mini")
    end,
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
    },
    config = function()
      require("plugins.cmp")
    end,
  },

  -- Debugging
  "mfussenegger/nvim-dap",
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("plugins.dap-go")
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    config = function()
      require("plugins.conform")
    end,
  },

  -- Fuzzy find
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      },
    },
    config = function()
      require("plugins.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugins.toggleterm")
    end,
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
  },
  {
    "FabijanZulj/blame.nvim",
    config = function()
      require("blame").setup()
    end,
  },

  -- Just
  "NoahTheDuke/vim-just",

  -- LSP
  "neovim/nvim-lspconfig",
  "yioneko/nvim-vtsls",

  -- Snippets
  "hrsh7th/vim-vsnip",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },
}
