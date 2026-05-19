local lgi = require("lgi")
local FcitxG = lgi.FcitxG
local GLib = lgi.GLib

local m = {}

-- Initialize the controller
local client = FcitxG.Client.new()

-- 1. Get current input method
-- Note: This requires a GLib main loop running to fetch asynchronously via DBus.
-- Once connected, you can read the property:
client.on_current_im:connect(function(self, name, unique_name, lang_code)
	-- local args = { client, name, unique_name, lang_code }
	m.current_ime = {
		name = name,
		unique_name = unique_name,
		lang_code = lang_code,
	}

	print("Current IM: " .. name)
end)

function PrintFcitxInfo()
	print(m.current_ime)
end
