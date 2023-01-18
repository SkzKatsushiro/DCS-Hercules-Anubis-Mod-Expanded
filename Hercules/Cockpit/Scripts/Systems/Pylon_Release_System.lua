-- 

-- dofile(LockOn_Options.script_path.."command_defs.lua")
-- dofile(LockOn_Options.script_path.."devices.lua")

-- log("LogBookGui: Some helpfull text")
-- log("LogBookGui: Some variables:".. VAR .."x")



local ReleaseSystem = GetSelf()
local update_time_step = 0.006 --EFM rate (0.006 s) or multible of 0.006 s (fastest), 0.012 s, 0.024 s, etc
make_default_activity(update_time_step)

-- ReleaseSystem:listen_command(1390)--Cargo Trigger

-- function SetCommand(command,value)--SetCommand(selfid,command,value)
	-- if command == 1390 then
		-- ReleaseSystem:launch_station(0)
		-- print_message_to_user(string.format("Launch pylon 1: %d", command));
		-- -- print_message_to_user(string.format("get_station_info: %d", ReleaseSystem:get_station_info(0).weapon.level3));
		-- -- ReleaseSystem:emergency_jettison_rack(0)
		-- -- print_message_to_user(string.format("emergency_jettison_rack pylon 1: %d", command));
		-- -- ReleaseSystem:emergency_jettison(0)
		-- -- print_message_to_user(string.format("emergency_jettison pylon 1: %d", command));
	-- end
-- end

-- function SetEvent(event,params)
-- end

local CargoLoadFirstStep = get_param_handle("CargoLoadFirstStep")
ReleaseSystem:listen_event("WeaponRearmFirstStep")
local CargoLoadSingleStepComplete = 0
ReleaseSystem:listen_event("WeaponRearmSingleStepComplete")
local CargoLoadComplete = get_param_handle("CargoLoadComplete")

function CockpitEvent(event,params)
	if event == "WeaponRearmFirstStep" then
		CargoLoadFirstStep:set(1)
	end
	if event == "WeaponRearmSingleStepComplete" then
		CargoLoadSingleStepComplete = CargoLoadSingleStepComplete + 1
	end
end

local Cannon1_Release = get_param_handle("Cannon1_Release")

function Cannon1(Release, pylonNr)
	if Release > 0 then
		ReleaseSystem:launch_station(pylonNr - 1)
	end
end

local Cannon2_Release = get_param_handle("Cannon2_Release")

local ReleaseCannon2 = false
function Cannon2(Release, pylonNr)
	if Release > 0 then
		if ReleaseCannon2 == false then
			ReleaseSystem:launch_station(pylonNr - 1)
			ReleaseCannon2 = true
		end
	else
		ReleaseCannon2 = false
	end
end

local Cannon3_Release = get_param_handle("Cannon3_Release")

local ReleaseCannon3 = false
function Cannon3(Release, pylonNr)
	if Release > 0 then
		if ReleaseCannon3 == false then
			ReleaseSystem:launch_station(pylonNr - 1)
			ReleaseCannon3 = true
		end
	else
		ReleaseCannon3 = false
	end
end

local Pylon1_Release = get_param_handle("Pylon1_Release")
local Pylon2_Release = get_param_handle("Pylon2_Release")
local Pylon3_Release = get_param_handle("Pylon3_Release")
local Pylon4_Release = get_param_handle("Pylon4_Release")
local Pylons_Jettison_Switch_state = get_param_handle("Pylons_Jettison_Switch_state")

local ReleasePylon = false
function Pylon_Release(Release, pylonNr)
	if Release > 0 then
		if ReleasePylon == false then
			if Pylons_Jettison_Switch_state:get() == 0 then
				ReleaseSystem:launch_station(pylonNr - 1)
				ReleasePylon = true
			else
				ReleaseSystem:emergency_jettison(pylonNr - 1)
				ReleasePylon = true
			end
		end
	else
		ReleasePylon = false
	end
end

local CargoFWD_Release = get_param_handle("CargoFWD_Release")
local CargoMID_Release = get_param_handle("CargoMID_Release")
local CargoAFT_Release = get_param_handle("CargoAFT_Release")
local Weight_On_MainWheels = get_param_handle("Weight_On_MainWheels")

local ReleaseCargo = false
function Cargo_Release(Release, pylonNr)
	if Release > 0 then
		if ReleaseCargo == false then
			if ReleaseSystem:get_station_info(pylonNr - 1).weapon.level3 == 49 then--wsType_Bomb_Lighter
				ReleaseSystem:launch_station(pylonNr - 1)
				ReleaseCargo = true
			else
				if ReleaseSystem:get_station_info(pylonNr - 1).weapon.level3 == 9 then--wsType_Bomb_A
					if Weight_On_MainWheels:get() > 0 then
						ReleaseSystem:emergency_jettison(pylonNr - 1)
						ReleaseCargo = true
					else
						ReleaseSystem:launch_station(pylonNr - 1)
						ReleaseCargo = true
					end
				else
					ReleaseSystem:emergency_jettison(pylonNr - 1)
					ReleaseCargo = true
				end
			end
		end
	else
		ReleaseCargo = false
	end
end

-- Drop chaff / Flare
PlaneDropFlareOnce = 357
PlaneDropChaffOnce = 358
ReleaseSystem:listen_command(PlaneDropFlareOnce)
ReleaseSystem:listen_command(PlaneDropChaffOnce)
Chaff_count = 1
Flare_count  = 1
function SetCommand(command,value)
	if command == PlaneDropFlareOnce then
		for position=0,13 do
			ReleaseSystem:drop_flare(Flare_count, position)
		end
	else
		if command == PlaneDropChaffOnce then
			for position=0,13 do
				ReleaseSystem:drop_chaff(Chaff_count, position)
			end
		end
	end
end

local elapse = 0
local Paratrooper_Squad_Loaded_FWD = get_param_handle("Paratrooper_Squad_Loaded_FWD")
local Paratrooper_Squad_Loaded_FWD_Set = false
function update()
	----------------------------------------------------------------------
	if ReleaseSystem:get_station_info(11).CLSID == "Herc_Soldier_Squad"	then					
		if Paratrooper_Squad_Loaded_FWD_Set == false then
			Paratrooper_Squad_Loaded_FWD:set(1)
			Paratrooper_Squad_Loaded_FWD_Set = true
		end
	else
		if Paratrooper_Squad_Loaded_FWD_Set == true then
			Paratrooper_Squad_Loaded_FWD:set(0)
			Paratrooper_Squad_Loaded_FWD_Set = false
		end
	end
	----------------------------------------------------------------------
	if CargoLoadSingleStepComplete == 12 then
		CargoLoadFirstStep:set(0)
		CargoLoadComplete:set(1)
		if elapse < 1000 then					
			elapse = elapse + 1
		else
			CargoLoadComplete:set(0)
			CargoLoadSingleStepComplete = 0
			elapse = 0
		end
	end
	------------------------------------------------------------------------Cannon1
	Cannon1(Cannon1_Release:get(), 6)
	------------------------------------------------------------------------Cannon2
	Cannon2(Cannon2_Release:get(), 7)
	------------------------------------------------------------------------Cannon3
	Cannon3(Cannon3_Release:get(), 8)
	------------------------------------------------------------------------pylon 1
	Pylon_Release(Pylon1_Release:get(), 2)
	------------------------------------------------------------------------pylon 2
	Pylon_Release(Pylon2_Release:get(), 3)
	------------------------------------------------------------------------pylon 2
	Pylon_Release(Pylon3_Release:get(), 4)
	------------------------------------------------------------------------pylon 2
	Pylon_Release(Pylon4_Release:get(), 5)
	------------------------------------------------------------------------CargoFWD
	Cargo_Release(CargoFWD_Release:get(), 12)
	------------------------------------------------------------------------CargoMID
	Cargo_Release(CargoMID_Release:get(), 11)
	------------------------------------------------------------------------CargoAFT
	Cargo_Release(CargoAFT_Release:get(), 10)
	----------------------------------------------------------------------
end

-- function post_initialize()
-- end

-- print_message_to_user(string.format("draw_argument = %s", get_aircraft_draw_argument_value(1286)))
-- print_message_to_user(string.format("General device"))
-- print_message_to_user("tpod_tgt_hgt: "..string.format("%d",tpod_tgt_hgt.aaa))--table?
-- print_message_to_user(string.format("WeaponFire: %d", WeaponFire))
-- print_message_to_user(string.format("CompassRose_Rotate: %.2f", CompassRose_Rotate:get()))
	

--ReleaseSystem:get_station_info(i-1) where i = pylon nr
--ReleaseSystem:get_station_info(i-1).count
-- print_message_to_user(string.format("get_station_info: %s", ReleaseSystem:get_station_info(10).CLSID));
--ReleaseSystem:get_station_info(i-1).weapon.level2
--ReleaseSystem:get_station_info(i-1).weapon.level3
--ReleaseSystem:get_station_info(i-1).weapon.level4

--[[
GetDevice(devices.WEAPON_SYSTEM) metatable:
weapons meta["__index"] = {}
weapons meta["__index"]["get_station_info"] = function: 00000000CCCC5780
weapons meta["__index"]["listen_event"] = function: 00000000CCC8E000
weapons meta["__index"]["drop_flare"] = function: 000000003C14E208
weapons meta["__index"]["set_ECM_status"] = function: 00000000CCCC76E0
weapons meta["__index"]["performClickableAction"] = function: 00000000CCE957B0
weapons meta["__index"]["get_ECM_status"] = function: 00000000CCE37BC0
weapons meta["__index"]["launch_station"] = function: 00000000CCC36A30
weapons meta["__index"]["SetCommand"] = function: 00000000CCE52820
weapons meta["__index"]["get_chaff_count"] = function: 00000000CCBDD650
weapons meta["__index"]["emergency_jettison"] = function: 00000000CCC26810
weapons meta["__index"]["set_target_range"] = function: 000000003AB0FDD0
weapons meta["__index"]["set_target_span"] = function: 0000000027E4E970
weapons meta["__index"]["get_flare_count"] = function: 00000000CCCC57D0
weapons meta["__index"]["get_target_range"] = function: 00000000CCC26710
weapons meta["__index"]["get_target_span"] = function: 00000000CCCC7410
weapons meta["__index"]["SetDamage"] = function: 00000000CCC384B0
weapons meta["__index"]["drop_chaff"] = function: 00000000CCE37AA0
weapons meta["__index"]["select_station"] = function: 00000000CC5C26F0
weapons meta["__index"]["listen_command"] = function: 0000000038088060
weapons meta["__index"]["emergency_jettison_rack"] = function: 00000000720F15F0
--]]

