vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

local job_id = 0
local function ipython_init()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("L")
	vim.api.nvim_win_set_width(0, 45)

	job_id = vim.bo.channel
	vim.fn.chansend(job_id, { "ipython\r\n" })
end

vim.keymap.set("n", "<leader>ip", ipython_init)

local function send_line_or_visual()
	local mode = vim.fn.mode()
	local bufnr = vim.api.nvim_get_current_buf()

	if mode == "v" or mode == "V" or mode == "" then
		-- Visual mode: get selection
		local start_pos = vim.fn.getpos("'<")
		local end_pos = vim.fn.getpos("'>")
		local lines = vim.api.nvim_buf_get_lines(bufnr, start_pos[2] - 1, end_pos[2], false)
		for _, line in ipairs(lines) do
			vim.fn.chansend(job_id, { line .. "\r\n" })
		end
	else
		-- Normal mode: send current line
		local line = vim.api.nvim_get_current_line()
		vim.fn.chansend(job_id, { line .. "\r\n" })
	end
end

local function send_block()
	local start = vim.fn.search("^\\s*$", "bnW") + 1
	local finish = vim.fn.search("^\\s*$", "nW") - 1
	local bufnr = vim.api.nvim_get_current_buf()

	if start == 0 then
		start = 1
	end
	if finish == -2 then
		finish = vim.api.nvim_buf_line_count(bufnr)
	end

	local lines = vim.api.nvim_buf_get_lines(bufnr, start - 1, finish, false)

	for _, line in ipairs(lines) do
		vim.fn.chansend(job_id, { line .. "\r\n" })
	end
end

vim.keymap.set({ "n", "v" }, "<leader>sc", send_line_or_visual)
vim.keymap.set({ "n", "v" }, "<leader>sb", send_block)
