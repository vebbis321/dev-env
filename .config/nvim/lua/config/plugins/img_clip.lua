return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		default = {
			file_name = "%y%m%d-%H%M%S",
			template = "![Image](./$FILE_PATH)",
			prompt_for_file_name = false,
			process_cmd = "convert - -set gamma 0.4545 -",
		},
	},
	keys = {
		-- suggested keymap
		{ "<C-p>", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
