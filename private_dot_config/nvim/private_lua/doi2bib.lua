local function get_bibentry(doi)
	local url = "https://api.crossref.org/works/" .. doi .. "/transform/application/x-bibtex"
	local cmd = "curl -s"
	local handle = assert(io.popen(cmd .. " " .. url, "r"))
	local result = handle:read("*a")
	handle:close()
	return result
end

vim.keymap.set("x", "gb", function()
	-- Get active visual selection boundaries
	local start_pos = vim.fn.getpos("v")
	local end_pos = vim.fn.getpos(".")

	local start_line = start_pos[2]
	local end_line = end_pos[2]

	-- Order lines correctly if selection was made bottom-to-top
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	local bufnr = vim.api.nvim_get_current_buf()
	-- Exit visual mode to prevent UI glitches during text replacement
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", true)

	-- CRITICAL: Loop BACKWARDS from bottom to top
	for i = end_line, start_line, -1 do
		-- API lines are 0-indexed and end-exclusive.
		-- Line number `i` maps to `i-1` for start index, and `i` for end index.
		local original_line = vim.api.nvim_buf_get_lines(bufnr, i - 1, i, false)[1]

		-- Run your custom transformation
		local new_lines = vim.split(get_bibentry(original_line), "\n")

		-- If the function returned a string instead of a table, wrap it in a table
		if type(new_lines) == "string" then
			new_lines = { new_lines }
		end

		-- Replace the single line (i-1 to i) with the new list of lines
		vim.api.nvim_buf_set_lines(bufnr, i - 1, i, false, new_lines)
	end
end, { desc = "Convert the word under current cursor to git (require curl)" })
