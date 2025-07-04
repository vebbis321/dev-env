local function file_exists(path)
	return vim.loop.fs_stat(path) ~= nil
end

local function handle_file(path)
	local file, err = io.open(path, "r")
	if not file then
		print("Failed to open file: " .. err)
		return nil
	end
	return file
end

local function handle_create_file_with(path, template)
	local file, err = io.open(path, "w")
	if file then
		print("File created: " .. path)
		if template ~= nil then
			file:write(template)
		end
		file:close()
	else
		print("Failed to create file: " .. err)
	end
end

local seperation = "\n\n"

local diary = function()
	local date = os.date("%Y-%m-%d")
	local header = "# " .. date
	local physics = "## Physics:"
	local maths = "## Math:"
	local programming = "## Programming:"
	return header .. seperation .. physics .. seperation .. maths .. seperation .. programming
end

local today_config = {
	diary = { template = diary, path = "diary" },
	-- recall = { template = recall(), path = "recall" },
}

local function open_today_with(config)
	local date = os.date("%Y-%m-%d") -- get date at runtime
	local dir = vim.fn.expand("~") .. "/wiki/" .. config.path
	local filepath = dir .. "/" .. date .. ".md"

	if file_exists(filepath) then
		handle_file(filepath)
	else
		handle_create_file_with(filepath, config.template())
	end

	vim.cmd("edit " .. filepath)
end

local M = {}

function M.open_diary()
	return open_today_with(today_config.diary)
end

return M
