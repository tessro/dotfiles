local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

require("rust-tools").setup({
	-- rust-tools
	tools = {
		autoSetHints = true,
	},
	-- nvim-lspconfig
	server = {
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set('n', 'gr', vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
	-- vim.keymap.set('i', '<C-x><C-x>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.format, bufopts)
end

--
-- Go
--

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--
-- Lua
--

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

--
-- Prisma
--
lspconfig.prismals.setup({
	capabilities = capabilities,
})

--
-- Python
--

lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		python = {
			venvPath = "~/.pyenv/versions",
		},
	},
})

lspconfig.ruff_lsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--
-- Rust
--

lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--
-- TOML
--

lspconfig.taplo.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

--
-- TypeScript
--

lspconfig.eslint.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "gl", ":EslintFixAll<CR>", bufopts)

		on_attach(client, bufnr)
	end,
	root_dir = function(fname)
		return lspconfig.util.root_pattern(".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json")(fname)
	end,
})

local vtsls = require("vtsls")
-- set default server config, optional but recommended
require("lspconfig.configs").vtsls = vtsls.lspconfig

lspconfig.vtsls.setup({
	server = {
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "go", ":VtsExec add_missing_imports<CR>", bufopts)
			vim.keymap.set("n", "gO", ":VtsExec organize_imports<CR>", bufopts)
			vim.keymap.set("n", "gI", ":VtsExec rename_file<CR>", bufopts)

			on_attach(client, bufnr)
		end,
	},
})
