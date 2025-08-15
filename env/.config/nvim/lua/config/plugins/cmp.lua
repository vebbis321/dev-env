return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	enabled = true,
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",

			["<C-p>"] = {},
			["<C-n>"] = {},
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			["<C-y>"] = {},
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
