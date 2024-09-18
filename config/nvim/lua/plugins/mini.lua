require("mini.pairs").setup({
	mappings = {
		-- support angle brackets
		["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
		[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },

		-- avoid pairing rust lifetimes (e.g. `&'a` or `<'a>`)
		["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\&<].", register = { cr = false } },
	},
})
require("mini.sessions").setup()
require("mini.surround").setup({
	mappings = {
		add = "S",
		delete = "ds",
		find = "",
		find_left = "",
		highlight = "",
		replace = "cs",
		update_n_lines = "",
	},
})
