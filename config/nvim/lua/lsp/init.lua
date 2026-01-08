-- Global capabilities from cmp_nvim_lsp
vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Keymaps via LspAttach autocmd
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
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

		-- Server-specific keymaps
		if client and client.name == "eslint" then
			vim.keymap.set("n", "gl", ":EslintFixAll<CR>", bufopts)
		elseif client and client.name == "vtsls" then
			vim.keymap.set("n", "go", ":VtsExec add_missing_imports<CR>", bufopts)
			vim.keymap.set("n", "gO", ":VtsExec organize_imports<CR>", bufopts)
			vim.keymap.set("n", "gI", ":VtsExec rename_file<CR>", bufopts)
		end
	end,
})

--
-- Lua
--
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

--
-- Python
--
vim.lsp.config("pyright", {
	settings = {
		python = {
			venvPath = "~/.pyenv/versions",
		},
	},
})

--
-- Rust
--
vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

-- Enable all servers
vim.lsp.enable({
	"gopls",
	"lua_ls",
	"prismals",
	"pyright",
	"ruff",
	"rust_analyzer",
	"taplo",
	"eslint",
	"vtsls",
})
