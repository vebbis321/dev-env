vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight on yank",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- auto sync file changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "VimResume", "CursorHold" }, {
	group = vim.api.nvim_create_augroup("auto-sync-files", { clear = true }),
	pattern = "*",
	command = "silent! checktime",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("user-lsp-config", { clear = true }),
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
	end,
})
