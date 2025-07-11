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

vim.keymap.set("n", "<leader>ip", ipython_init())

vim.keymap.set("n", "<leader>sp")
