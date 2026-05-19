MiniDeps.add("nvim-mini/mini.pick")
MiniDeps.add("nvim-mini/mini.extra")
MiniDeps.add("nvim-mini/mini.icons")

local window_config = function()
	local height = math.floor(0.95 * vim.o.lines)
	local width = math.floor(0.95 * vim.o.columns)
	return {
		anchor = "NW",
		height = height,
		width = width,
		row = math.floor(0.5 * (vim.o.lines - height)),
		col = math.floor(0.5 * (vim.o.columns - width)),
		border = "double",
	}
end

require("mini.extra").setup()
require("mini.icons").setup()
require("mini.pick").setup({
	window = { config = window_config },
})

local function get_relative_path(path_a, path_b)
	-- Normalize both paths
	local modifiers = ":~"
	path_a = vim.fn.fnamemodify(path_a, modifiers)
	path_b = vim.fn.fnamemodify(path_b, modifiers)

	-- Check if path_a is a file, if it is a file then get
	-- the directory containing it, the :h does this
	if vim.fn.isdirectory(path_a) == 0 then
		path_a = vim.fn.fnamemodify(path_a, ":h")
	end

	-- Split paths into components
	local parts_a = vim.split(path_a, "/")
	local parts_b = vim.split(path_b, "/")

	-- Find common prefix length
	local common_length = 0
	for i = 1, math.min(#parts_a, #parts_b) do
		if parts_a[i] == parts_b[i] then
			common_length = i
		else
			break
		end
	end

	-- Build relative path
	local relative_parts = {}

	-- Add ".." for each remaining component in path_a
	for _ = common_length + 1, #parts_a do
		table.insert(relative_parts, "..")
	end

	-- Append remaining components from path_b
	for i = common_length + 1, #parts_b do
		table.insert(relative_parts, parts_b[i])
	end

	-- Handle case where paths are identical
	if #relative_parts == 0 then
		return "."
	end

	-- Join components
	return table.concat(relative_parts, "/")
end

-- Pick file to paste into current cursor
local function pick_and_paste()
	local minipick = require("mini.pick")
	local buf_path = vim.api.nvim_buf_get_name(0)

	local choose_callback = function(picked_file)
		local state = MiniPick.get_picker_state() or {}

		-- Close everything
		if state.buffers.main then
			vim.api.nvim_buf_delete(state.buffers.main, {})
		end
		if state.buffers.preview then
			vim.api.nvim_buf_delete(state.buffers.preview, {})
		end
		if state.buffers.info then
			vim.api.nvim_buf_delete(state.buffers.info, {})
		end

		-- paste the relative path
		local relative_path = get_relative_path(buf_path, picked_file)
		-- local modifiers = ":~"
		-- picked_file = vim.fn.fnamemodify(picked_file, modifiers)
		-- buf_path = vim.fn.fnamemodify(buf_path, modifiers)
		vim.api.nvim_put({ relative_path }, "c", true, true)
		-- vim.api.nvim_put({buf_path}, "l", true, true)
		-- vim.api.nvim_put({picked_file}, "l", true, true)
	end

	minipick.builtin.files({ tool = "fallback" }, {
		source = { choose = choose_callback },
	})
end

vim.keymap.set("n", "<leader>d", [[<cmd>Pick lsp scope="document_symbol"<cr>]])
vim.keymap.set("n", "<leader>g", "<cmd>Pick grep_live<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>Pick help<cr>")
vim.keymap.set("n", "<C-p>", [[<cmd>Pick files<cr>]])
vim.keymap.set("n", "<C-A-p>", function()
	MiniPick.builtin.files({ tool = "fallback" })
end)
vim.keymap.set("n", "<leader>pf", pick_and_paste)
vim.keymap.set("i", "<C-x><C-m>", pick_and_paste)
vim.keymap.set("n", "<leader>pd", function()
	MiniExtra.pickers.diagnostic()
end)
