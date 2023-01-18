dofile(LockOn_Options.script_path.."PFD_Display/indicator/definitions.lua")

local PFD_dll_values = get_param_handle("PFD_dll_values")
local PFD_lua_values = false --Set to true if you want to run the PFD with lua code
if PFD_lua_values then
	PFD_dll_values:set(0.0)
else
	PFD_dll_values:set(1.0)
end

-- local update_time_step = 0.006 --EFM rate (0.006 s) or multible of 0.006 s (fastest), 0.012 s, 0.024 s, etc
-- make_default_activity(update_time_step)

-- function update()
-- end

-- function post_initialize()
-- end
