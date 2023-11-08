local vim = _G.vim
local api = vim.api
local lsp_formatter = {}

-- Schema:
-- 1: filetype
-- 2: formatter types
-- 3: formatter command
local formatters = {
	python = { cmd = "black %f", is_inplace = true },
	tex = { cmd = "latexindent %f", is_inplace = false },
	lua = lsp_formatter,
}

local state = {
	formatters = {},
	is_on = true,
}

local function toggle(hint)
	if hint == nil then
		state.is_on = not state.is_on
	else
		state.is_on = hint
	end
end

local format_current_buffer = function()
	local filetype = vim.bo.filetype
	local format_opt = formatters[filetype]

	-- no formatter
	if format_opt == nil then
		return
	end

	-- lsp formatter
	if format_opt == lsp_formatter then
		vim.lsp.buf.format()
		vim.api.nvim_command("echo 'Formatted with LSP Formatter'")
		return
	end

	-- the command based formatter
	local current_path = vim.fn.expand("%")
	local cmd = format_opt.cmd:gsub("%%f", current_path)

	-- formatted contents
	local stdout = vim.fn.system(cmd)
	if not format_opt.is_inplace then
		local file = io.open(current_path)
		if file ~= nil then
			file:write(stdout)
			file:close()
		else
			print("Failed to format file")
		end
	end
	vim.api.nvim_command("e!")
end

_G.custom = {}
_G.custom.format = format_current_buffer
vim.api.nvim_create_user_command("MyAutoFormat", "lua _G.custom.format()", {})
vim.api.nvim_create_autocmd("BufWrite", { buffer = 0, callback = format_current_buffer })

return {
	format = format_current_buffer,
	lsp_formatter = lsp_formatter,
}
