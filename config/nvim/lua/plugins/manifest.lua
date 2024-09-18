return {
	-- Color schemes
	"arcticicestudio/nord-vim",
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
			require("gitsigns").setup()
		end,
	},

	-- Just
	"NoahTheDuke/vim-just",

	-- LSP
	"neovim/nvim-lspconfig",
	"yioneko/nvim-vtsls",
	"simrat39/rust-tools.nvim",

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

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		config = function()
			vim.defer_fn(function()
				require("plugins.copilot")
			end, 100)
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("plugins.copilot_cmp")
		end,
	},
}
