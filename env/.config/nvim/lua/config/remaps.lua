vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- back to netrw
keymap.set("n", "<leader>jf", vim.cmd.Ex)

-- jump to previous file
keymap.set("n", "<C-b>", "<C-^>")

-- switching between buffers
keymap.set("n", "<c-j>", "<c-w><c-j>")
keymap.set("n", "<c-k>", "<c-w><c-k>")
keymap.set("n", "<c-l>", "<c-w><c-l>")
keymap.set("n", "<c-h>", "<c-w><c-h>")

-- is_increasing means increase from main position (top and left)
local function smart_resize(is_increasing, is_vertical)
	local win = vim.api.nvim_get_current_win()
	local pos = nil
	local cmd = nil
	if is_vertical then
		pos = vim.api.nvim_win_get_position(win)[1] -- row
		cmd = "resize"
	else
		pos = vim.api.nvim_win_get_position(win)[2] -- col
		cmd = "vertical resize"
	end

	-- top and pushing up
	-- left and pushing left
	if pos == 0 and is_increasing then
		vim.cmd(cmd .. "-2")

	-- top and pushing down
	-- left and pushing right
	elseif pos == 0 and not is_increasing then
		vim.cmd(cmd .. "+2")

	-- bottom and pushing up
	-- right and pushing left
	elseif pos ~= 0 and is_increasing then
		vim.cmd(cmd .. "+2")

	-- bottom and pushing down
	-- right and pushing right
	elseif pos ~= 0 and not is_increasing then
		vim.cmd(cmd .. "-2")
	end
end

keymap.set("n", "<M-k>", function()
	smart_resize(true, true)
end)
keymap.set("n", "<M-j>", function()
	smart_resize(false, true)
end)

keymap.set("n", "<M-h>", function()
	smart_resize(true, false)
end)
keymap.set("n", "<M-l>", function()
	smart_resize(false, false)
end)

-- let cursor stay in place after paste
keymap.set("n", "J", "mzJ`z")

-- let cursor stay in the middle when jumping half-pages
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- let cursor stay in the middle when searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- move blocks of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- find and replace all text
keymap.set("n", "<leader>cs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- paste over
keymap.set("x", "<leader>p", [["_dP]])

-- nope
keymap.set("n", "Q", "<nop>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
