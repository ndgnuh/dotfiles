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
local ime = {
	command = "fcitx5-remote",
}

--- module states
ime.state = {
	previous_engine = "keyboard-us",
	default_engine = "lotus",
}

---Run fcitx shell command
---@param args string[] the list of fcitx5-remote arguments
---@param callback function? the callback for stdout
function ime.shell(args, callback)
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
			if callback then
				callback(data)
			end
		end
	end

	-- spawn and read stdout
	local stdio = { nil, stdout, nil }
	local options = { args = args, stdio = stdio, hide = true }
	handle, _ = uv.spawn(ime.command, options, on_exit)
	if stdout then
		uv.read_start(stdout, on_read)
	end
end

--- Switch ibus back to its previous engine
function ime.ime_on()
	ime.shell({ "-n" }, function(current_engine)
		-- If the engine is not English then use that engine
		if current_engine ~= ime.state.default_engine then
			ime.state.previous_engine = current_engine
		end

		-- switch to previous engine
		ime.shell({ "-s", ime.state.previous_engine })
	end)
end

--- Switch to the default engine and store the previous engine
function ime.ime_off()
	ime.shell({ "-n" }, function(current_engine)
		-- save previous engine
		ime.state.previous_engine = current_engine

		-- move to default engine
		ime.shell({ "-s", ime.state.default_engine })
	end)
end

-- Patch with pcall...
local ime_on = ime.ime_on
local ime_off = ime.ime_off
-- ibus.ibus_on = function() pcall(ibus_on) end
-- ibus.ibus_off = function() pcall(ibus_off) end

--- setup ibus module
---@param default_engine string: Name of the engine to be set when ibus is "off", default = 'xkb:us::eng'
function ime.setup(opts)
	-- if has_desktop() == false then return end
	-- set the default engine
	opts = opts or {}
	ime.state.default_engine = opts.default_engine or ime.state.default_engine

	local augroup = vim.api.nvim_create_augroup("IbusAutoSwitch", {})

	-- auto turn on ibus
	vim.api.nvim_create_autocmd("InsertEnter", {
		group = augroup,
		pattern = { "*" },
		callback = ime.ime_on,
	}) -- insert
	vim.api.nvim_create_autocmd("CmdLineEnter", {
		group = augroup,
		pattern = { "[/?]", "\\?", ":" },
		callback = ime.ime_on,
	}) -- search, backward search, command

	-- auto turn off ibus
	vim.api.nvim_create_autocmd("InsertLeave", {
		group = augroup,
		pattern = { "*" },
		callback = ime.ime_off,
	}) -- insert mode
	vim.api.nvim_create_autocmd("CmdLineLeave", {
		group = augroup,
		pattern = { "[/?]", "\\?", ":" },
		callback = ime.ime_off,
	}) -- search, backward search, command
end

return ime
