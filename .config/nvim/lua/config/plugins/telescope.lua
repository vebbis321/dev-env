return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.load_extension("fzf")
		telescope.setup({
			pickers = {
				live_grep = {
					file_ignore_patterns = { "node_modules", ".git", ".venv", ".DS_Store" },
					hidden = true,
				},
				find_files = {
					file_ignore_patterns = { "node_modules", ".git", ".venv", ".DS_Store" },
					hidden = true,
				},
			},
			extensions = {
				"fzf",
			},
			defaults = require("telescope.themes").get_dropdown({
				path_display = { "truncate " },
				layout_config = {
					anchor = "N",
					width = 99,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			}),
		})

		local key = vim.keymap
		key.set("n", "<leader>ff", builtin.find_files)
		key.set("n", "<leader>fh", builtin.help_tags)
		key.set("n", "<leader>fs", builtin.live_grep)
		key.set("n", "<leader>fd", builtin.diagnostics)
		key.set("n", "<leader>fm", builtin.man_pages)

		key.set("n", "<leader>fr", function()
			builtin.find_files({ cwd = "~/repos/", prompt_title = "repos" })
		end)
		key.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = "~/code/", prompt_title = "code" })
		end)
		key.set("n", "<leader>fw", function()
			builtin.find_files({ cwd = "~/wiki/", prompt_title = "wiki" })
		end)

		key.set("n", "<leader>fi", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzily search in current buffer" })
	end,
}
