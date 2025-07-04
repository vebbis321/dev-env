return {
	"vimwiki/vimwiki",
	init = function()
		-- params wiki
		local wiki_default = {
			syntax = "markdown",
			ext = ".md",
			nested_syntaxes = {
				["c"] = "c",
				["rust"] = "rust",
				["python"] = "python",
				["lua"] = "lua",
				["js"] = "js",
				["bash"] = "bash",
				["c++"] = "cpp",
				["latex"] = "tex",
			},
		}

		-- notes
		local main_wiki = vim.deepcopy(wiki_default)
		main_wiki.name = "wiki"
		main_wiki.path = "~/wiki/"

		vim.g.vimwiki_list = { main_wiki }
		vim.g.vimwiki_ext2syntax = {
			[".md"] = "markdown",
			[".markdown"] = "markdown",
			[".mdown"] = "markdown",
		}
		vim.g.vimwiki_filetypes = { "markdown" }
		vim.g.vimwiki_hl_headers = 1 -- use alternating colours for different heading levels
		vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links

		local keymap = vim.keymap
		keymap.set("n", "<C-Space>", "<Plug>VimwikiToggleListItem<CR>0")

		local templates = require("config.plugins_custom.vimwiki_templates")

		vim.api.nvim_create_user_command("Diary", function()
			templates.open_diary()
		end, {})

		vim.api.nvim_create_user_command("Recall", function()
			templates.open_recall()
		end, {})

		keymap.set("n", "<Leader>w<leader>w", ":Diary<CR>", { noremap = true, silent = true })
		keymap.set("n", "<Leader>sp", ":e ~/wiki/scratchpad.md<CR>", { noremap = true, silent = true })
	end,
}
