local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettierd", "prettier", stop_after_first = true },
		go = { "goimports", "gofmt" },
		lua = { "stylua" },
		python = { "black" },
		rust = { "rustfmt" },
	},

	default_format_opts = {
		lsp_format = "fallback",
	},

	format_on_save = {
		lsp_format = "fallback",
		timeout = 500,
	},

	notify_no_formatters = true,
})

--
-- Format command
--
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	conform.format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
