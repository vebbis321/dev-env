return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({})
		require("mason-lspconfig").setup({
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"basedpyright",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"ruff", -- python linter + formatter
			},
		})
	end,
}
