dofile(LockOn_Options.script_path.."devices.lua")

local dev = GetSelf()
local elec_ptr = get_param_handle("THIS_ELEC_PTR")
local electric_system
local ac_ok = get_param_handle("AC_OK")

local update_time_step = 0.02 --EFM rate (0.006 s) or multible of 0.006 s (fastest), 0.012 s, 0.024 s, etc
make_default_activity(update_time_step)

function update()
  if electric_system:get_AC_Bus_1_voltage()>0 then
		ac_ok:set(1)
	else
		ac_ok:set(0)
	end
end

function post_initialize()
	str_ptr = string.sub(tostring(dev.link),10)
	elec_ptr:set(str_ptr)
	electric_system = GetDevice(devices.Electric_System)
	electric_system:AC_Generator_1_on(true) -- A-4E generator is automatic and cannot be controlled by switches
	electric_system:AC_Generator_2_on(true) -- A-4E doesn't have a 2nd generator (since no second engine)
	electric_system:DC_Battery_on(true) -- A-4E doesn't have a battery
end

function SetCommand(command,value)
end

need_to_be_closed = false -- close lua state after initialization

