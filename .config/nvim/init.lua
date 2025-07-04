require("config")

vim.lsp.enable({
	"lua_ls",
	"basedpyright",
})

vim.diagnostic.config({
	virtual_text = true,
})
