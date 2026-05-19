--- this module enables automatic switching between ibus and non-ibus
-- when working with Vim.
--
--  Features:
--  - automatic turns on ibus when enter insert mode, searching or typing command, returns to previous engine
--  - automatic turns off ibus when enter normal mode
--
--  Usage:
--  - require("ibus").setup()
local uv = vim.loop
local ibus = {}

--- module states
ibus.state = {
	previous_engine = "xkb:us::eng",
	default_engine = "xkb:us::eng",
}

function ibus.ibus(args, callback)
	-- stdout only when there is callback
	local stdout
	local handle
	if callback then
		-- we don't need IPC
		stdout = uv.new_pipe(false)
	end

	-- callback on process exit
	local on_exit = function(code, signal)
		if stdout then
			uv.read_stop(stdout)
			uv.close(stdout)
		end
		uv.close(handle)
	end

	-- callback on stdout data
	local data = ""
	local on_read = function(_, chunk)
		if chunk then
			data = data .. chunk
		else
			-- data must be trimmed because of the new-line character
			data = vim.trim(data)
			callback(data)
		end
	end

	-- spawn and read stdout
	local stdio = { nil, stdout, nil }
	local options = { args = args, stdio = stdio, hide = true }
	handle, _ = uv.spawn("ibus", options, on_exit)
	if stdout then
		uv.read_start(stdout, on_read)
	end
end

--- Switch ibus back to its previous engine
function ibus.ibus_on()
	ibus.ibus({ "engine" }, function(current_engine)
		-- If the engine is not English then use that engine
		if current_engine ~= ibus.state.default_engine then
			ibus.state.previous_engine = current_engine
		end

		-- switch to previous engine
		ibus.ibus({ "engine", ibus.state.previous_engine })
	end)
end

--- Switch to the default engine and store the previous engine
function ibus.ibus_off()
	ibus.ibus({ "engine" }, function(current_engine)
		-- save previous engine
		ibus.state.previous_engine = current_engine

		-- move to default engine
		ibus.ibus({ "engine", ibus.state.default_engine })
	end)
end

-- Patch with pcall...
local ibus_on = ibus.ibus_on
local ibus_off = ibus.ibus_off
-- ibus.ibus_on = function() pcall(ibus_on) end
-- ibus.ibus_off = function() pcall(ibus_off) end

--- setup ibus module
---@param default_engine string: Name of the engine to be set when ibus is "off", default = 'xkb:us::eng'
function ibus.setup(opts)
	-- if has_desktop() == false then return end
	-- set the default engine
	opts = opts or {}
	ibus.state.default_engine = opts.default_engine or ibus.state.default_engine

	local augroup = vim.api.nvim_create_augroup("IbusAutoSwitch", {})

	-- auto turn on ibus
	vim.api.nvim_create_autocmd("InsertEnter", {
		group = augroup,
		pattern = { "*" },
		callback = ibus.ibus_on,
	}) -- insert
	vim.api.nvim_create_autocmd("CmdLineEnter", {
		group = augroup,
		pattern = { "[/?]", "\\?", ":" },
		callback = ibus.ibus_on,
	}) -- search, backward search, command

	-- auto turn off ibus
	vim.api.nvim_create_autocmd("InsertLeave", {
		group = augroup,
		pattern = { "*" },
		callback = ibus.ibus_off,
	}) -- insert mode
	vim.api.nvim_create_autocmd("CmdLineLeave", {
		group = augroup,
		pattern = { "[/?]", "\\?", ":" },
		callback = ibus.ibus_off,
	}) -- search, backward search, command
end

return ibus
