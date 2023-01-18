dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
local JSON = loadfile "Scripts\\JSON.lua"()
-- log("LogBookGui: Some helpfull text")
-- log("LogBookGui: Some variables:".. VAR .."x")

local General_system = GetSelf()
--will be called EFM rate (0.006 s) or multible of 0.006 s (fastest), 0.012 s, 0.024 s, etc
make_default_activity(0.006)--update_time_step
local sensor_data = get_base_data()

------------------------------------------------------------------------ NWS_Coupled_Separate_Input_Device
local NWS_Coupled_Separate_Input_Device = get_param_handle("NWS_Coupled_Separate_Input_Device")
if (get_plugin_option_value("Hercules","NWS_Coupled_Separate_Input_Device") == true) then
	NWS_Coupled_Separate_Input_Device:set(1.0)
else
	NWS_Coupled_Separate_Input_Device:set(0.0)
end
------------------------------------------------------------------------ Clock
local init_mission = get_param_handle("INIT_MISSION")
local mission_len = get_param_handle("MISSION_LEN")

-- local World_Volume = get_param_handle("World_Volume")
-- local Cockpit_Volume = get_param_handle("Cockpit_Volume")
-- local Headset_Volume = get_param_handle("Headset_Volume")
-- World_Volume:set(get_option_value("sound.world","local"))
-- Cockpit_Volume:set(get_option_value("sound.cockpit","local"))
-- Headset_Volume:set(get_option_value("sound.headphones","local"))

-- local current_HeadingTrue = get_param_handle("current_HeadingTrue")

------------------------------------------------------------------------ Units
local Units = get_param_handle("Units")
if get_option_value("difficulty.units","local") == "metric" then
	Units:set(1)
end

local self_latlong
local self_loc_x , own_alt, self_loc_z
local self_loc_x_old, self_loc_z_old

----------------------------------------------------------------- Flightplan route export to CNI-MU
local WaypointName = ""
local missionroute
local MissionrouteLenth = get_param_handle("MissionrouteLenth")

local GroundPower_param = get_param_handle("Ground_Power")
local GroundAir_param = get_param_handle("Ground_Air")
General_system:listen_event("GroundPowerOn")
General_system:listen_event("GroundPowerOff")
General_system:listen_event("GroundAirOn")
General_system:listen_event("GroundAirOff")

function CockpitEvent(event,params)
	if event == "GroundPowerOn" then
		GroundPower_param:set(1)
	end
	if event == "GroundPowerOff" then
		GroundPower_param:set(0)
	end
	if event == "GroundAirOn" then
		GroundAir_param:set(1)
	end
	if event == "GroundAirOff" then
		GroundAir_param:set(0)
	end
end

-- function SetEvent(event,params)
-- end

-- function listen_event()
	-- print_message_to_user("LISTEN_EVENT")
-- end


	----------------------------------------------------------------- NetCrewRequestControl
local NetCrewRequestControl = get_param_handle("NetCrewRequestControl")
	----------------------------------------------------------------- Position_Control
General_system:listen_command(General_Packet_Send.NetCrewRequestControl)
General_system:listen_command(Position_Control.Pilot_Seat)
General_system:listen_command(Position_Control.Copilot_Seat)
General_system:listen_command(Position_Control.Loadmaster_Station)
General_system:listen_command(Position_Control.Cannon_Target_Station)
General_system:listen_command(Position_Control.CargoRamp_Station)
-- General_system:listen_command(3001)
local VisitStation = false
function SetCommand(command,value)
	if command == Position_Control.Pilot_Seat then
		SetGlobalCommand(406)--iCommandViewSnapViewStop
		if VisitStation == true then
			dispatch_action(nil,1602,1)--iCommandViewCockpitChangeSeat Pilot
			VisitStation = false
		end
		SetGlobalCommand(36)--iCommandViewCenter
	end
	if command == Position_Control.Copilot_Seat then
		SetGlobalCommand(406)--iCommandViewSnapViewStop
		if VisitStation == true then
			dispatch_action(nil,1602,2)--iCommandViewCockpitChangeSeat Copilot
			VisitStation = false
		end
		SetGlobalCommand(36)--iCommandViewCenter
	end
	if command == Position_Control.Loadmaster_Station then
		SetGlobalCommand(406)--iCommandViewSnapViewStop
		SetGlobalCommand(127)--iCommandViewLeftMirrorOn
		SetGlobalCommand(7)--iCommandViewCockpit
		SetGlobalCommand(128)--iCommandViewLeftMirrorOff
	end
	if command == Position_Control.Cannon_Target_Station then
		SetGlobalCommand(405)--iCommandViewSnapView9
		VisitStation = true
	end
	if command == Position_Control.CargoRamp_Station then
		SetGlobalCommand(406)--iCommandViewSnapViewStop
		SetGlobalCommand(125)--iCommandViewRightMirrorOn
		SetGlobalCommand(7)--iCommandViewCockpit
		SetGlobalCommand(126)--iCommandViewRightMirrorOff
	end
	-- if command == 3001 then
		-- print_message_to_user(string.format("kneeboard command: %.2f", command))
		-- print_message_to_user(string.format("kneeboard value: %.2f", value))
	-- end
end

	-- print_message_to_user(string.format("General device"))
	-- print_message_to_user("tpod_tgt_hgt: "..string.format("%d",tpod_tgt_hgt.aaa))
	-- print_message_to_user(string.format("tpod_tgt_hgt = %s", tpod_tgt_hgt:get()))
	-- print_message_to_user(string.format("CompassRose_Rotate: %.2f", CompassRose_Rotate:get()))
	--print_message_to_user(tostring(dev:get_frequency()))
	-- local update_counter = 0 --for logging
function update()
	-- update_counter = update_counter + 1 --increment counter
    -- if update_counter % 20 == 0 then
		-- print_message_to_user(string.format("General device"))
	-- end

	----------------------------------------------------------------- Position_Control
	if (NetCrewRequestControl:get() == General_Packet_Send.NetCrewRequestControl) then
		-- print_message_to_user(string.format("NetCrewRequestControl"))
		SetGlobalCommand(1672)--iCommandNetCrewRequestControl
		NetCrewRequestControl:set(0)
	end
end

local qnh = get_param_handle("QNH")
function Tempmission()
	local status, result = pcall(
		function()
		local next = next
		if next(mission) ~= nil then
			qnh:set(mission.weather.qnh)
		end
	end) -- pcall
	if not status then
		qnh:set(760.0)
		print_message_to_user(string.format("Tempmission did not load"))
	else
		return result
	end
end

function post_initialize()
	----------------------------- for sunset/sunrise calculations
	local Birth_Lat = get_param_handle("Birth_Lat")
	local Birth_Long = get_param_handle("Birth_Long")
	local Birth_Year = get_param_handle("Birth_Year")
	local Birth_Month = get_param_handle("Birth_Month")
	local Birth_Day = get_param_handle("Birth_Day")
	local Birth_Time = get_param_handle("Birth_Time")
	local Birth_Map = get_param_handle("Birth_Map")
	local MapName = get_param_handle("MAP_NAME")
	missionroute = get_mission_route()

	local enc = JSON:encode_pretty(missionroute)

	local enc_len = enc:len()
	mission_len:set(enc_len)
	init_mission:set(enc)

	MissionrouteLenth:set(#missionroute)
	self_loc_x, own_alt, self_loc_z = sensor_data.getSelfCoordinates()
	self_latlong = lo_to_geo_coords(self_loc_x, self_loc_z)
	Birth_Lat:set(self_latlong.lat)
	Birth_Long:set(self_latlong.lon)
	Birth_Year:set(LockOn_Options.date.year)
	Birth_Month:set(LockOn_Options.date.month)
	Birth_Day:set(LockOn_Options.date.day)
	Birth_Time:set(get_absolute_model_time() / 3600.0)--time in hours

	------------"1234967890123496789"
	-- MapName:set("PersianGulfaaa")--max 14 characters allowed
	MapName:set(get_terrain_related_data("name"))
	-- print_message_to_user("MapName: "..string.format("%s",get_terrain_related_data("name")))

	if (get_terrain_related_data("name") == "Caucasus") then
		Birth_Map:set(1)
	else
		if (get_terrain_related_data("name") == "Normandy") then
			Birth_Map:set(2)
		else
			if (get_terrain_related_data("name") == "PersianGulf") then
				Birth_Map:set(3)
			else
				if (get_terrain_related_data("name") == "Nevada") then
					Birth_Map:set(4)
				else
					if (get_terrain_related_data("name") == "Syria") then
						Birth_Map:set(5)
					else
						Birth_Map:set(6)
					end
				end
			end
		end
	end
	dofile(LockOn_Options.script_path.."Tempmission.lua")
	load_Tempmission_file()
	Tempmission()
end

--".....function at line 385 [update()] has more than 60 upvalues"
-- local params = setmetatable({}, {
    -- __index = function(self, param_name)
        -- local handle = get_param_handle(param_name)
        -- self[param_name] = handle
        -- return handle
    -- end,
-- })
-- local params = ...
-- local _1 = params.whatever -- __index metamethod sets `params["whatever"] = get_param_handle("whatever")` and returns param handle so `_1` contains param handle
-- local _2 = params.whatever -- table has param handle in it so just a normal table access not going through the __index metamethod


-- get_aircraft_type
-- getAngleOfAttack
-- getAngleOfSlide
-- getBarometricAltitude
-- getCanopyPos
-- getCanopyState
-- getEngineLeftFuelConsumption
-- getEngineLeftRPM
-- getEngineLeftTemperatureBeforeTurbine
-- getEngineRightFuelConsumption
-- getEngineRightRPM
-- getEngineRightTemperatureBeforeTurbine
-- getFlapsPos
-- getFlapsRetracted
-- getHeading
-- getHelicopterCollective
-- getHelicopterCorrection
-- getHorizontalAcceleration
-- getIndicatedAirSpeed
-- getLandingGearHandlePos
-- getLateralAcceleration
-- getLeftMainLandingGearDown
-- getLeftMainLandingGearUp
-- getMachNumber
-- getMagneticHeading
-- getNoseLandingGearDown
-- getNoseLandingGearUp
-- getPitch
-- getRadarAltitude
-- getRateOfPitch
-- getRateOfRoll
-- getRateOfYaw
-- getRightMainLandingGearDown
-- getRightMainLandingGearUp
-- getRoll
-- getRudderPosition
-- getSelfAirspeed
-- getSelfCoordinates returns 3 values: x,alt,z (all in Meters)
-- getSelfVelocity
-- getSpeedBrakePos
-- getStickPitchPosition
-- getStickRollPosition
-- getThrottleLeftPosition
-- getThrottleRightPosition
-- getTotalFuelWeight
-- getTrueAirSpeed
-- getVerticalAcceleration
-- getVerticalVelocity
-- getWOW_LeftMainLandingGear
-- getWOW_NoseLandingGear
-- getWOW_RightMainLandingGear


-- {"change_color_when_parameter_equal_to_number", param_nr, number, red, green, blue}
-- {"text_using_parameter", param_nr, format_nr}
-- {"move_left_right_using_parameter", param_nr, gain}
-- {"move_up_down_using_parameter", param_nr, gain}
-- {"opacity_using_parameter", param_nr}
-- {"rotate_using_parameter", param_nr, gain}
-- {"compare_parameters", param1_nr, param2_nr} -- if param1 == param2 then visible
-- {"parameter_in_range", param_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < param < lessthanvalue then visible
-- {"parameter_compare_with_number", param_nr, number} -- if param == number then visible
-- {"draw_argument_in_range", arg_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < arg < lessthanvalue then visible
-- {"line_object_set_point_using_parameters", point_nr, param_x, param_y, gain_x, gain_y} -- applies to ceSimpleLineObject at least

-- output of dump("_G",_G) (some introspection into all global symbols available inside this avLuaDevice)
--[[
_G = {}
_G["SetGlobalCommand"] = function: 00000000282CBAD0
_G["get_aircraft_mission_data"] = function: 00000000282CAA60
_G["tostring"] = function: 00000000282BCFB0
_G["os"] = {}
_G["os"]["getpid"] = function: 00000000282C00D0
_G["os"]["date"] = function: 00000000282BE170
_G["os"]["getenv"] = function: 00000000282BC3A0
_G["os"]["difftime"] = function: 00000000282BFBA0
_G["os"]["remove"] = function: 00000000282C0030
_G["os"]["time"] = function: 00000000282BFF30
_G["os"]["clock"] = function: 00000000282BE0B0
_G["os"]["rename"] = function: 00000000282C0080
_G["os"]["execute"] = function: 00000000282BC890
_G["SetCommand"] = function: 00000000CD362C10
_G["USE_TERRAIN4"] = false
_G["list_cockpit_params"] = function: 00000000282CB3C0
_G["debug"] = {}
_G["debug"]["getupvalue"] = function: 00000000282C3250
_G["debug"]["debug"] = function: 00000000282C2F20
_G["debug"]["sethook"] = function: 00000000282C3340
_G["debug"]["getmetatable"] = function: 00000000282C3200
_G["debug"]["gethook"] = function: 00000000282C2FC0
_G["debug"]["setmetatable"] = function: 00000000282C3460
_G["debug"]["setlocal"] = function: 00000000282C33C0
_G["debug"]["traceback"] = function: 00000000282C3550
_G["debug"]["setfenv"] = function: 00000000282C32F0
_G["debug"]["getinfo"] = function: 00000000282C3040
_G["debug"]["setupvalue"] = function: 00000000282C34B0
_G["debug"]["getlocal"] = function: 00000000282C30C0
_G["debug"]["getregistry"] = function: 00000000282C3160
_G["debug"]["getfenv"] = function: 00000000282C2F70
_G["get_param_handle"] = function: 00000000282C9F20
_G["get_mission_route"] = function: 00000000282CA380
_G["get_random_orderly"] = function: 00000000282CA420
_G["get_input_devices"] = function: 00000000282C7150
_G["tonumber"] = function: 00000000282BCF10
_G["get_terrain_related_data"] = function: 00000000282C7A10
_G["UTF8_substring"] = function: 00000000282C7970
_G["elec_mon_primary_ac_ok"] = {}
_G["elec_mon_primary_ac_ok"]["session"] = 0
_G["elec_mon_primary_ac_ok"]["link"] = userdata: 00000000725A7160
_G["coroutine_create"] = function: 00000000282C49A0
_G["get_elec_mon_primary_ac_ok"] = function: 00000000282E9060
_G["set_aircraft_draw_argument_value"] = function: 00000000282CA6A0
_G["elec_primary_ac_ok"] = {}
_G["elec_primary_ac_ok"]["session"] = 0
_G["elec_primary_ac_ok"]["link"] = userdata: 00000000725A6EE0
_G["get_random_evenly"] = function: 00000000282CA4C0
_G["WMA"] = {}
_G["WMA"]["get_target_val"] = function: 00000000CD35A220
_G["WMA"]["get_WMA"] = function: 00000000282E00D0
_G["WMA"]["get_current_val"] = function: 00000000CD359FC0
_G["WMA"]["set_current_val"] = function: 00000000CD359F70
_G["WMA"]["__index"] = ->_G["WMA"]
_G["WMA"]["new"] = function: 00000000CD359E10
_G["_FINAL_VERSION"] = true
_G["coroutine"] = {}
_G["coroutine"]["resume"] = function: 00000000282BD630
_G["coroutine"]["yield"] = function: 00000000282BD830
_G["coroutine"]["status"] = function: 00000000282BD730
_G["coroutine"]["wrap"] = function: 00000000282BD7B0
_G["coroutine"]["create"] = function: 00000000282BC4D0
_G["coroutine"]["running"] = function: 00000000282BD6B0
_G["elec_26V_ac_ok"] = {}
_G["elec_26V_ac_ok"]["session"] = 0
_G["elec_26V_ac_ok"]["link"] = userdata: 00000000725A6FE0
_G["get_plugin_option_value"] = function: 00000000282CA100
_G["copy_to_mission_and_dofile"] = function: 00000000282C7510
_G["loadstring"] = function: 00000000282BC9B0
_G["dump"] = function: 00000000CD357B50
_G["string"] = {}
_G["string"]["sub"] = function: 00000000282C0CD0
_G["string"]["upper"] = function: 00000000282C0D50
_G["string"]["len"] = function: 00000000282C0A50
_G["string"]["gfind"] = function: 00000000282C0950
_G["string"]["rep"] = function: 00000000282C0BD0
_G["string"]["find"] = function: 00000000282C07D0
_G["string"]["match"] = function: 00000000282C0B50
_G["string"]["char"] = function: 00000000282BBA30
_G["string"]["dump"] = function: 00000000282BDD10
_G["string"]["gmatch"] = function: 00000000282C0950
_G["string"]["reverse"] = function: 00000000282C0C50
_G["string"]["byte"] = function: 00000000282BE540
_G["string"]["format"] = function: 00000000282C0850
_G["string"]["gsub"] = function: 00000000282C09D0
_G["string"]["lower"] = function: 00000000282C0AD0
_G["a_cockpit_lock_player_seat"] = function: 00000000282CB820
_G["mount_vfs_path_to_mount_point"] = function: 00000000282C9CA0
_G["print"] = function: 00000000282BD8B0
_G["get_option_value"] = function: 00000000282CA1A0
_G["a_cockpit_highlight_position"] = function: 00000000282CAC40
_G["table"] = {}
_G["table"]["setn"] = function: 00000000282BE9B0
_G["table"]["insert"] = function: 00000000282BE8B0
_G["table"]["getn"] = function: 00000000282BE7B0
_G["table"]["foreachi"] = function: 00000000282BE710
_G["table"]["maxn"] = function: 00000000282BE830
_G["table"]["foreach"] = function: 00000000282BE690
_G["table"]["concat"] = function: 00000000282BE610
_G["table"]["sort"] = function: 00000000282BEA30
_G["table"]["remove"] = function: 00000000282BE930
_G["round"] = function: 00000000CD357990
_G["_ARCHITECTURE"] = "x86_64"
_G["c_cockpit_param_equal_to"] = function: 00000000282CB1E0
_G["get_absolute_model_time"] = function: 00000000282CA2E0
_G["debug_print_electric_system"] = function: 00000000282EBA00
_G["_ED_VERSION"] = "DCS/1.5.5.58891 (x86_64; Windows/6.1.7601)"
_G["get_elec_primary_ac_ok"] = function: 00000000282E8ED0
_G["ipairs"] = function: 00000000282BD2A0
_G["get_elec_mon_dc_ok"] = function: 00000000282EB8C0
_G["collectgarbage"] = function: 00000000282BC5A0
_G["c_cockpit_param_in_range"] = function: 00000000282CB140
_G["dispatch_action"] = function: 00000000282C7470
_G["c_start_wait_for_user"] = function: 00000000282CB5A0
_G["track_is_reading"] = function: 00000000282C7650
_G["device_commands"] = {}
_G["device_commands"]["ias_index_button"] = 3036
_G["device_commands"]["radar_mode"] = 3059
_G["device_commands"]["arm_master"] = 3002
_G["device_commands"]["rudder_trim"] = 3076
_G["device_commands"]["radar_storage"] = 3053
_G["device_commands"]["master_test"] = 3035
_G["device_commands"]["Button_Test"] = 3000
_G["device_commands"]["radar_alt_switch"] = 3034
_G["device_commands"]["spoiler_cover"] = 3012
_G["device_commands"]["asn41_windspeed"] = 3045
_G["device_commands"]["extlight_anticoll"] = 3070
_G["device_commands"]["extlight_nav"] = 3073
_G["device_commands"]["AWRS_drop_interval"] = 3028
_G["device_commands"]["GunsightBrightness"] = 3026
_G["device_commands"]["speedbrake"] = 3020
_G["device_commands"]["radar_gain"] = 3056
_G["device_commands"]["stby_att_index_knob"] = 3039
_G["device_commands"]["GunsightDayNight"] = 3025
_G["device_commands"]["afcs_standby"] = 3077
_G["device_commands"]["extlight_master"] = 3067
_G["device_commands"]["dest_lat"] = 3049
_G["device_commands"]["emer_gear_release"] = 3032
_G["device_commands"]["Gear"] = 3016
_G["device_commands"]["afcs_engage"] = 3078
_G["device_commands"]["doppler_select"] = 3041
_G["device_commands"]["arm_gun"] = 3001
_G["device_commands"]["Hook"] = 3017
_G["device_commands"]["radar_range"] = 3052
_G["device_commands"]["ppos_lat"] = 3047
_G["device_commands"]["arm_station4"] = 3006
_G["device_commands"]["FuelGaugeExtButton"] = 3014
_G["device_commands"]["arm_station2"] = 3004
_G["device_commands"]["arm_station3"] = 3005
_G["device_commands"]["doppler_memory_test"] = 3042
_G["device_commands"]["tacan_mode"] = 3063
_G["device_commands"]["radar_alt_indexer"] = 3033
_G["device_commands"]["afcs_hdg_sel"] = 3079
_G["device_commands"]["ppos_lon"] = 3048
_G["device_commands"]["AltPressureKnob"] = 3015
_G["device_commands"]["flaps"] = 3011
_G["device_commands"]["AWRS_multiplier"] = 3029
_G["device_commands"]["asn41_winddir"] = 3046
_G["device_commands"]["afcs_hdg_set"] = 3081
_G["device_commands"]["afcs_ail_trim"] = 3083
_G["device_commands"]["AWRS_stepripple"] = 3030
_G["device_commands"]["nav_select"] = 3043
_G["device_commands"]["extlight_flashsteady"] = 3072
_G["device_commands"]["GunsightKnob"] = 3024
_G["device_commands"]["extlight_tail"] = 3074
_G["device_commands"]["afcs_alt"] = 3080
_G["device_commands"]["push_starter_switch"] = 3009
_G["device_commands"]["extlight_fuselage"] = 3071
_G["device_commands"]["tacan_ch_major"] = 3064
_G["device_commands"]["extlight_taxi"] = 3069
_G["device_commands"]["extlight_probe"] = 3068
_G["device_commands"]["tacan_volume"] = 3066
_G["device_commands"]["tacan_ch_minor"] = 3065
_G["device_commands"]["radar_filter"] = 3057
_G["device_commands"]["emer_gen_deploy"] = 3019
_G["device_commands"]["arm_station1"] = 3003
_G["device_commands"]["radar_planprofile"] = 3051
_G["device_commands"]["throttle"] = 3010
_G["device_commands"]["emer_bomb_release"] = 3023
_G["device_commands"]["arm_func_selector"] = 3008
_G["device_commands"]["radar_reticle"] = 3058
_G["device_commands"]["arm_emer_sel"] = 3021
_G["device_commands"]["radar_detail"] = 3055
_G["device_commands"]["afcs_stab_aug"] = 3082
_G["device_commands"]["ias_index_knob"] = 3037
_G["device_commands"]["AWRS_quantity"] = 3027
_G["device_commands"]["asn41_magvar"] = 3044
_G["device_commands"]["bdhi_mode"] = 3040
_G["device_commands"]["intlight_whiteflood"] = 3075
_G["device_commands"]["speedbrake_emer"] = 3031
_G["device_commands"]["radar_brilliance"] = 3054
_G["device_commands"]["dest_lon"] = 3050
_G["device_commands"]["arm_station5"] = 3007
_G["device_commands"]["stby_att_index_button"] = 3038
_G["device_commands"]["radar_angle"] = 3061
_G["device_commands"]["arm_bomb"] = 3022
_G["device_commands"]["radar_volume"] = 3062
_G["device_commands"]["emer_gen_bypass"] = 3018
_G["device_commands"]["spoiler_arm"] = 3013
_G["device_commands"]["radar_aoacomp"] = 3060
_G["devices"] = {}
_G["devices"]["WEAPON_SYSTEM"] = 2
_G["devices"]["AVIONICS"] = 19
_G["devices"]["ADI"] = 5
_G["devices"]["NAV"] = 18
_G["devices"]["ELECTRIC_SYSTEM"] = 3
_G["devices"]["EXTANIM"] = 7
_G["devices"]["GUNSIGHT"] = 17
_G["devices"]["HUD"] = 25
_G["devices"]["ENGINE"] = 16
_G["devices"]["HUFFER"] = 14
_G["devices"]["AFCS"] = 24
_G["devices"]["TRIM"] = 23
_G["devices"]["ILS"] = 20
_G["devices"]["SPOILERS"] = 12
_G["devices"]["CANOPY"] = 13
_G["devices"]["NAV_TERRAIN"] = 21
_G["devices"]["SLATS"] = 8
_G["devices"]["EXT_LIGHTS"] = 22
_G["devices"]["AIRBRAKES"] = 9
_G["devices"]["FLAPS"] = 10
_G["devices"]["CLOCK"] = 4
_G["devices"]["GEAR"] = 11
_G["devices"]["TEST"] = 1
_G["devices"]["RADARWARN"] = 15
_G["devices"]["RADAR"] = 6
_G["elec_mon_arms_dc_ok"] = {}
_G["elec_mon_arms_dc_ok"]["session"] = 0
_G["elec_mon_arms_dc_ok"]["link"] = userdata: 00000000725A7260
_G["jumpwheel"] = function: 00000000CD357AB0
_G["math"] = {}
_G["math"]["log"] = function: 00000000282C2310
_G["math"]["max"] = function: 00000000282C2390
_G["math"]["acos"] = function: 00000000282C1C10
_G["math"]["huge"] = 1.#INF
_G["math"]["ldexp"] = function: 00000000282C2210
_G["math"]["pi"] = 3.1415926535898
_G["math"]["cos"] = function: 00000000282C1F10
_G["math"]["tanh"] = function: 00000000282C28B0
_G["math"]["pow"] = function: 00000000282C2510
_G["math"]["deg"] = function: 00000000282C1F90
_G["math"]["tan"] = function: 00000000282C2930
_G["math"]["cosh"] = function: 00000000282C1E90
_G["math"]["sinh"] = function: 00000000282C2730
_G["math"]["random"] = function: 00000000282C2610
_G["math"]["randomseed"] = function: 00000000282C2690
_G["math"]["frexp"] = function: 00000000282C2190
_G["math"]["ceil"] = function: 00000000282C1E10
_G["math"]["floor"] = function: 00000000282C2090
_G["math"]["rad"] = function: 00000000282C2590
_G["math"]["abs"] = function: 00000000282C1B90
_G["math"]["sqrt"] = function: 00000000282C2830
_G["math"]["modf"] = function: 00000000282C2490
_G["math"]["asin"] = function: 00000000282C1C90
_G["math"]["min"] = function: 00000000282C2410
_G["math"]["mod"] = function: 00000000282C2110
_G["math"]["fmod"] = function: 00000000282C2110
_G["math"]["log10"] = function: 00000000282C2290
_G["math"]["atan2"] = function: 00000000282C1D10
_G["math"]["exp"] = function: 00000000282C2010
_G["math"]["sin"] = function: 00000000282C27B0
_G["math"]["atan"] = function: 00000000282C1D90
_G["pcall"] = function: 00000000282BCAD0
_G["type"] = function: 00000000282BD050
_G["a_cockpit_remove_highlight"] = function: 00000000282CAD80
_G["lfs"] = {}
_G["lfs"]["normpath"] = function: 00000000282BF8C0
_G["lfs"]["locations"] = function: 00000000282BF6E0
_G["lfs"]["dir"] = function: 00000000282BF420
_G["lfs"]["tempdir"] = function: 00000000282BF660
_G["lfs"]["realpath"] = function: 00000000282BF960
_G["lfs"]["writedir"] = function: 00000000282BF5C0
_G["lfs"]["mkdir"] = function: 00000000282BF320
_G["lfs"]["currentdir"] = function: 00000000282BF520
_G["lfs"]["add_location"] = function: 00000000282BF780
_G["lfs"]["attributes"] = function: 00000000282BF280
_G["lfs"]["create_lockfile"] = function: 00000000282BFA80
_G["lfs"]["md5sum"] = function: 00000000282BFA00
_G["lfs"]["del_location"] = function: 00000000282BF820
_G["lfs"]["chdir"] = function: 00000000282BF4A0
_G["lfs"]["rmdir"] = function: 00000000282BF3A0
_G["copy_to_mission_and_get_buffer"] = function: 00000000282C75B0
_G["get_elec_fwd_mon_ac_ok"] = function: 00000000282E9010
_G["get_model_time"] = function: 00000000282CA240
_G["loadfile"] = function: 00000000282BD900
_G["log"] = {}
_G["log"]["FULL"] = 7
_G["log"]["ALL"] = 255
_G["log"]["set_output"] = function: 00000000282C3760
_G["log"]["LEVEL"] = 2
_G["log"]["DEBUG"] = 128
_G["log"]["ALERT"] = 2
_G["log"]["warning"] = function: 00000000282C3A80
_G["log"]["debug"] = function: 00000000282C3FF0
_G["log"]["printf"] = function: 00000000282C3690
_G["log"]["MODULE"] = 4
_G["log"]["TIME"] = 1
_G["log"]["WARNING"] = 16
_G["log"]["INFO"] = 64
_G["log"]["error"] = function: 00000000282C3A00
_G["log"]["info"] = function: 00000000282C3F40
_G["log"]["ERROR"] = 8
_G["log"]["write"] = function: 00000000282C3710
_G["log"]["TRACE"] = 256
_G["log"]["alert"] = function: 00000000282C3950
_G["log"]["MESSAGE"] = 0
_G["elec_external_power"] = {}
_G["elec_external_power"]["session"] = 0
_G["elec_external_power"]["link"] = userdata: 00000000725A7360
_G["RoundToTens"] = function: 00000000CD3627B0
_G["gcinfo"] = function: 00000000282BC6F0
_G["LockOn_Options"] = {}
_G["LockOn_Options"]["script_path"] = "./Mods/aircraft/A-4E/Cockpit/Scripts/"
_G["LockOn_Options"]["cockpit_language"] = "russian"
_G["LockOn_Options"]["common_script_path"] = "Scripts/Aircrafts/_Common/Cockpit/"
_G["LockOn_Options"]["date"] = {}
_G["LockOn_Options"]["date"]["year"] = 2011
_G["LockOn_Options"]["date"]["day"] = 1
_G["LockOn_Options"]["date"]["month"] = 6
_G["LockOn_Options"]["flight"] = {}
_G["LockOn_Options"]["flight"]["unlimited_fuel"] = false
_G["LockOn_Options"]["flight"]["g_effects"] = "realistic"
_G["LockOn_Options"]["flight"]["radio_assist"] = false
_G["LockOn_Options"]["flight"]["unlimited_weapons"] = false
_G["LockOn_Options"]["flight"]["external_view"] = true
_G["LockOn_Options"]["flight"]["easy_radar"] = false
_G["LockOn_Options"]["flight"]["easy_flight"] = false
_G["LockOn_Options"]["flight"]["external_labels"] = false
_G["LockOn_Options"]["flight"]["crash_recovery"] = false
_G["LockOn_Options"]["flight"]["immortal"] = false
_G["LockOn_Options"]["flight"]["tool_tips_enable"] = true
_G["LockOn_Options"]["flight"]["padlock"] = false
_G["LockOn_Options"]["flight"]["aircraft_switching"] = true
_G["LockOn_Options"]["screen"] = {}
_G["LockOn_Options"]["screen"]["height"] = 1080
_G["LockOn_Options"]["screen"]["aspect"] = 1.7777777910233
_G["LockOn_Options"]["screen"]["width"] = 1920
_G["LockOn_Options"]["cockpit"] = {}
_G["LockOn_Options"]["cockpit"]["mirrors"] = false
_G["LockOn_Options"]["cockpit"]["reflections"] = false
_G["LockOn_Options"]["cockpit"]["use_nightvision_googles"] = false
_G["LockOn_Options"]["cockpit"]["render_target_resolution"] = 1024
_G["LockOn_Options"]["time"] = {}
_G["LockOn_Options"]["time"]["hours"] = 12
_G["LockOn_Options"]["time"]["seconds"] = 0
_G["LockOn_Options"]["time"]["minutes"] = 0
_G["LockOn_Options"]["avionics_language"] = "native"
_G["LockOn_Options"]["measurement_system"] = "metric"
_G["LockOn_Options"]["init_conditions"] = {}
_G["LockOn_Options"]["init_conditions"]["birth_place"] = "AIR_HOT"
_G["LockOn_Options"]["mission"] = {}
_G["LockOn_Options"]["mission"]["file_path"] = "stub"
_G["LockOn_Options"]["mission"]["description"] = "stub"
_G["LockOn_Options"]["mission"]["title"] = "stub"
_G["LockOn_Options"]["mission"]["campaign"] = ""
_G["Keys"] = {}
_G["Keys"]["ExtLightFlashSteady"] = 10090
_G["Keys"]["TacanChMajorInc"] = 10077
_G["Keys"]["NavSelectCW"] = 10055
_G["Keys"]["Station1"] = 10011
_G["Keys"]["PlaneHook"] = 10025
_G["Keys"]["BdhiModeNavComputer"] = 10057
_G["Keys"]["MasterArmToggle"] = 10009
_G["Keys"]["NavPPosLonDec"] = 10038
_G["Keys"]["GunsReadyToggle"] = 10010
_G["Keys"]["TacanVolumeDec"] = 10082
_G["Keys"]["PlaneHeadlightOnOff"] = 328
_G["Keys"]["NavPPosLatDec"] = 10036
_G["Keys"]["NavSelectOff"] = 10051
_G["Keys"]["NavILSNext"] = 10033
_G["Keys"]["PlaneAirBrakeOn"] = 147
_G["Keys"]["ArmsFuncSelectorCCW"] = 10016
_G["Keys"]["Station5"] = 10015
_G["Keys"]["PlaneChgTargetPrev"] = 1315
_G["Keys"]["Station3"] = 10013
_G["Keys"]["PlaneLightsOnOff"] = 175
_G["Keys"]["ExtLightTaxiToggle"] = 10093
_G["Keys"]["BdhiModeTacan"] = 10058
_G["Keys"]["RadarAoAComp"] = 10070
_G["Keys"]["PlaneFireOff"] = 10006
_G["Keys"]["NavSelectStandby"] = 10052
_G["Keys"]["PlaneFlapsOn"] = 145
_G["Keys"]["PickleOff"] = 10008
_G["Keys"]["Engine_Stop"] = 312
_G["Keys"]["TrimCancel"] = 10107
_G["Keys"]["NavDestLatDec"] = 10040
_G["Keys"]["ExtLightTail"] = 10088
_G["Keys"]["NavILSPrev"] = 10034
_G["Keys"]["NavDestLonInc"] = 10041
_G["Keys"]["NavSelectD1"] = 10053
_G["Keys"]["TrimLeft"] = 10102
_G["Keys"]["RadarVolume"] = 10068
_G["Keys"]["SpoilersArmOff"] = 10004
_G["Keys"]["ExtLightTaxi"] = 10085
_G["Keys"]["NavDopplerSea"] = 10046
_G["Keys"]["PickleOn"] = 10007
_G["Keys"]["PowerOnOff"] = 315
_G["Keys"]["PlaneAirBrake"] = 73
_G["Keys"]["NavDopplerTest"] = 10047
_G["Keys"]["NavPPosLatInc"] = 10035
_G["Keys"]["TacanVolumeInc"] = 10081
_G["Keys"]["PlaneModeGround"] = 111
_G["Keys"]["Engine_Start"] = 311
_G["Keys"]["PlaneAirBrakeOff"] = 148
_G["Keys"]["RadarAltWarningDown"] = 10023
_G["Keys"]["TacanModeREC"] = 10072
_G["Keys"]["IntLightWhiteFlood"] = 10099
_G["Keys"]["PlaneModeNAV"] = 105
_G["Keys"]["SpoilersArmToggle"] = 10002
_G["Keys"]["FuelGaugeExt"] = 10019
_G["Keys"]["Station2"] = 10012
_G["Keys"]["NavSelectTest"] = 10050
_G["Keys"]["NavDopplerOff"] = 10043
_G["Keys"]["ExtLightNavCycle"] = 10095
_G["Keys"]["PlaneFireOn"] = 10005
_G["Keys"]["PlaneFlapsStop"] = 10001
_G["Keys"]["ExtLightAnticollision"] = 10086
_G["Keys"]["NavNDBNext"] = 10031
_G["Keys"]["PlaneModeBVR"] = 106
_G["Keys"]["NavDopplerLand"] = 10045
_G["Keys"]["Station4"] = 10014
_G["Keys"]["TacanModeOFF"] = 10071
_G["Keys"]["Canopy"] = 71
_G["Keys"]["TacanModeTR"] = 10073
_G["Keys"]["AltPressureInc"] = 10021
_G["Keys"]["ExtLightMaster"] = 10083
_G["Keys"]["PlanePickleOn"] = 350
_G["Keys"]["NavDestLonDec"] = 10042
_G["Keys"]["RadarMode"] = 10065
_G["Keys"]["PlanePickleOff"] = 351
_G["Keys"]["SpoilersArmOn"] = 10003
_G["Keys"]["PlaneHookUp"] = 10026
_G["Keys"]["TacanChMinorInc"] = 10079
_G["Keys"]["RadarModeSearch"] = 10062
_G["Keys"]["BatteryPower"] = 1073
_G["Keys"]["PlaneGearDown"] = 431
_G["Keys"]["TacanModeDec"] = 10076
_G["Keys"]["NavDopplerCW"] = 10048
_G["Keys"]["PlaneChgTargetNext"] = 102
_G["Keys"]["PlaneGear"] = 68
_G["Keys"]["RadarAltWarningUp"] = 10024
_G["Keys"]["TrimStop"] = 10106
_G["Keys"]["NavSelectCCW"] = 10056
_G["Keys"]["NavReset"] = 10030
_G["Keys"]["TrimRightRudder"] = 10105
_G["Keys"]["NavSelectD2"] = 10054
_G["Keys"]["PowerGeneratorRight"] = 712
_G["Keys"]["TrimUp"] = 10100
_G["Keys"]["PlaneFlapsOff"] = 146
_G["Keys"]["NavDopplerCCW"] = 10049
_G["Keys"]["ExtLightNav"] = 10087
_G["Keys"]["TacanChMajorDec"] = 10078
_G["Keys"]["PowerGeneratorLeft"] = 711
_G["Keys"]["NavPPosLonInc"] = 10037
_G["Keys"]["TrimRight"] = 10103
_G["Keys"]["RadarAntennaAngle"] = 10069
_G["Keys"]["PlaneFlaps"] = 72
_G["Keys"]["ExtLightFlashSteadyToggle"] = 10098
_G["Keys"]["AltPressureDec"] = 10022
_G["Keys"]["ExtLightMasterToggle"] = 10091
_G["Keys"]["ExtLightTailCycle"] = 10096
_G["Keys"]["PlaneChgWeapon"] = 101
_G["Keys"]["ExtLightAnticollisionToggle"] = 10094
_G["Keys"]["ExtLightProbeCycle"] = 10092
_G["Keys"]["NavNDBPrev"] = 10032
_G["Keys"]["ExtLightProbe"] = 10084
_G["Keys"]["JettisonWeapons"] = 10028
_G["Keys"]["TacanChMinorDec"] = 10080
_G["Keys"]["JettisonWeaponsUp"] = 10029
_G["Keys"]["RadarTCPlanProfile"] = 10066
_G["Keys"]["TrimLeftRudder"] = 10104
_G["Keys"]["FuelGaugeInt"] = 10020
_G["Keys"]["TacanModeInc"] = 10075
_G["Keys"]["EngineStarterDown"] = 10018
_G["Keys"]["PlaneGearUp"] = 430
_G["Keys"]["RadarModeA2G"] = 10064
_G["Keys"]["TrimDown"] = 10101
_G["Keys"]["RadarRangeLongShort"] = 10067
_G["Keys"]["TacanModeAA"] = 10074
_G["Keys"]["RadarModeTC"] = 10063
_G["Keys"]["RadarModeSTBY"] = 10061
_G["Keys"]["RadarModeOFF"] = 10060
_G["Keys"]["BdhiModeNavPac"] = 10059
_G["Keys"]["NavDopplerStandby"] = 10044
_G["Keys"]["PlaneFlapsTakeoff"] = 10000
_G["Keys"]["NavDestLatInc"] = 10039
_G["Keys"]["ExtLightFuselage"] = 10089
_G["Keys"]["PlaneHookDown"] = 10027
_G["Keys"]["ExtLightFuselageCycle"] = 10097
_G["Keys"]["ArmsFuncSelectorCW"] = 10017
_G["mount_vfs_model_path"] = function: 00000000282C7BF0
_G["getfenv"] = function: 00000000282BC770
_G["start_command"] = 3000
_G["get_elec_mon_arms_dc_ok"] = function: 00000000282EB910
_G["a_cockpit_unlock_player_seat"] = function: 00000000282CB8C0
_G["dbg_print"] = function: 00000000282C71F0
_G["c_indication_txt_equal_to"] = function: 00000000282CB500
_G["get_elec_external_power"] = function: 00000000282EB9B0
_G["module"] = function: 00000000282BE3F0
_G["_G"] = ->_G
_G["geo_to_lo_coords"] = function: 00000000282C9DE0
_G["WMA_wrap"] = {}
_G["WMA_wrap"]["set_current_val"] = function: 00000000CD35A4F0
_G["WMA_wrap"]["get_current_val"] = function: 00000000CD35A540
_G["WMA_wrap"]["new"] = function: 00000000CD35A400
_G["strsplit"] = function: 00000000282E0030
_G["create_sound_host"] = function: 00000000282CBD50
_G["track_is_writing"] = function: 00000000282C76F0
_G["require"] = function: 00000000282BE470
_G["c_argument_in_range"] = function: 00000000282CB0A0
_G["elec_mon_dc_ok"]["session"] = 0
_G["xpcall"] = function: 00000000282BD150
_G["elec_aft_mon_ac_ok"]["session"] = 0
_G["package"] = {}
_G["package"]["loadlib"] = function: 00000000282BDDA0
_G["package"]["loaded"]["string"] = ->_G["string"]
_G["package"]["loaded"]["lfs"] = ->_G["lfs"]
_G["package"]["loaded"]["io"] = {}
_G["package"]["loaded"]["io"]["write"] = function: 00000000282BF040
_G["package"]["loaded"]["io"]["lines"] = function: 00000000282BF0E0
_G["package"]["loaded"]["io"]["open"] = function: 00000000282BEF50
_G["package"]["loaded"]["os"] = ->_G["os"]
_G["package"]["loaded"]["math"] = ->_G["math"]
_G["package"]["loaded"]["coroutine"] = ->_G["coroutine"]
_G["package"]["loaders"] = {}
_G["package"]["loaders"][2] = function: 00000000282BE4F0
_G["package"]["loaders"][4] = function: 00000000282BE030
_G["package"]["config"] = "\\\
00171.663?\
00171.663-"
_G["package"]["seeall"] = function: 00000000282BDE20
_G["elec_fwd_mon_ac_ok"]["session"] = 0
_G["_VERSION"] = "Lua 5.1"
_G["c_cockpit_param_is_equal_to_another"] = function: 00000000282CB280
_G["get_aircraft_property"] = function: 00000000282CA9C0
_G["get_elec_26V_ac_ok"] = function: 00000000282E8F70
_G["get_plugin_option"] = function: 00000000282CA060
_G["get_cockpit_draw_argument_value"] = function: 00000000282CA740
_G["setmetatable"] = function: 00000000282BCE70
_G["pairs"] = function: 00000000282BD370
_G["io"] = ->_G["package"]["loaded"]["io"]
_G["a_cockpit_param_save_as"] = function: 00000000282CB320
_G["rawequal"] = function: 00000000282BCBD0
_G["load"] = function: 00000000282BC930
_G["getmetatable"] = function: 00000000282BC7F0
_G["a_cockpit_highlight_indication"] = function: 00000000282CACE0
_G["GetSelf"] = function: 00000000282CBA50
_G["a_cockpit_push_actor"] = function: 00000000282CB6E0
_G["get_dcs_plugin_path"] = function: 00000000282CA7E0
_G["get_base_data"] = function: 00000000282C9FC0
_G["save_to_mission"] = function: 00000000282C73D0
_G["c_stop_wait_for_user"] = function: 00000000282CB640
_G["a_cockpit_perform_clickable_action"] = function: 00000000282CB000
_G["get_clickable_element_reference"] = function: 00000000282CA880
_G["get_multimonitor_preset_name"] = function: 00000000282C7790
_G["do_mission_file"] = function: 00000000282C7290
_G["rawget"] = function: 00000000282BCC70
_G["a_start_listen_command"] = function: 00000000282CAEC0
_G["elec_primary_dc_ok"]["session"] = 0
_G["setfenv"] = function: 00000000282BCDF0
_G["GetDevice"] = function: 00000000282CB9B0
--]]

--[[
Interesting items in list_cockpit_params:
WS_GUN_PIPER_AVAILABLE:1.000000
WS_GUN_PIPER_AZIMUTH:-0.000553
WS_GUN_PIPER_ELEVATION:-0.057762
WS_GUN_PIPER_SPAN:0.015000
WS_TARGET_RANGE:1000.000000
WS_TARGET_SPAN:15.000000
WS_ROCKET_PIPER_AVAILABLE:0.000000
WS_ROCKET_PIPER_AZIMUTH:0.000000
WS_DLZ_MIN:-1.000000
WS_DLZ_MAX:-1.000000
WS_IR_MISSILE_LOCK:0.000000
WS_IR_MISSILE_TARGET_AZIMUTH:0.000000
WS_IR_MISSILE_TARGET_ELEVATION:0.000000
WS_IR_MISSILE_SEEKER_DESIRED_AZIMUTH:0.000000
WS_IR_MISSILE_SEEKER_DESIRED_ELEVATION:0.000000
--]]

--[[
dump of: local Terrain = require('terrain')
Terrain["GetSurfaceType"] = function: 00000000265464B0
Terrain["task_results"] = function: 00000000CE6D7390
Terrain["GetTerrainConfig"] = function: 000000003BC9AC60
Terrain["getStandList"] = function: 00000000CE9976B0
Terrain["getBeacons"] = function: 00000000CE711A30
Terrain["getRadio"] = function: 00000000CE7150E0
Terrain["getRunwayList"] = function: 00000000CE997660
Terrain["isVisible"] = function: 00000000CE7365E0
Terrain["Init"] = function: 00000000CE44A610
Terrain["Create"] = function: 00000000CE44A540
Terrain["getTechSkinByDate"] = function: 00000000CE736590
Terrain["convertLatLonToMeters"] = function: 00000000CE715230
Terrain["GetHeight"] = function: 00000000CE44A660
Terrain["FindOptimalPath"] = function: 0000000026543650
Terrain["convertMetersToLatLon"] = function: 00000000CE715090
Terrain["Release"] = function: 00000000CE44A6E0
Terrain["GetMGRScoordinates"] = function: 00000000CE6D7310
Terrain["getRunwayHeading"] = function: 00000000CE6D71D0
Terrain["FindNearestPoint"] = function: 0000000026543560

--]]

--[[
GetSelf() metatable:
GetSelf meta["__index"] = {}
GetSelf meta["__index"]["performClickableAction"] = function: 00000000282D4E28
GetSelf meta["__index"]["SetDamage"] = function: 00000000282D4F68
GetSelf meta["__index"]["listen_event"] = function: 00000000282D4EC8
GetSelf meta["__index"]["listen_command"] = function: 00000000282D4D88
GetSelf meta["__index"]["SetCommand"] = function: 00000000282D4D38
--]]
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

--[[
get_clickable_element_reference("POINT_NAME") -- see point name in clickabledata.lua, index of elements

click meta = {}
click meta["__index"] = {}
click meta["__index"]["set_hint"] = function: 00000000270C59A0
click meta["__index"]["update"] = function: 000000003F624D80
click meta["__index"]["hide"] = function: 00000000CBF6BCF0
--]]

--[[
get_mission_route()
route = {}
route[1] = {}
route[1]["speed_locked"] = true
route[1]["type"] = "Turning Point"
route[1]["action"] = "Turning Point"
route[1]["alt_type"] = "BARO"
route[1]["properties"] = {}
route[1]["properties"]["vnav"] = 1
route[1]["properties"]["scale"] = 0
route[1]["properties"]["vangle"] = 0
route[1]["properties"]["angle"] = 0
route[1]["properties"]["steer"] = 2
route[1]["ETA"] = 0
route[1]["y"] = 625382.00000003
route[1]["x"] = -296357.71428572
route[1]["name"] = "DictKey_WptName_7"
route[1]["formation_template"] = ""
route[1]["speed"] = 138.88888888889
route[1]["ETA_locked"] = true
route[1]["task"] = {}
route[1]["task"]["id"] = "ComboTask"
route[1]["task"]["params"] = {}
route[1]["task"]["params"]["tasks"] = {}
route[1]["task"]["params"]["tasks"][1] = {}
route[1]["task"]["params"]["tasks"][1]["number"] = 1
route[1]["task"]["params"]["tasks"][1]["key"] = "CAS"
route[1]["task"]["params"]["tasks"][1]["id"] = "EngageTargets"
route[1]["task"]["params"]["tasks"][1]["enabled"] = true
route[1]["task"]["params"]["tasks"][1]["auto"] = true
route[1]["task"]["params"]["tasks"][1]["params"] = {}
route[1]["task"]["params"]["tasks"][1]["params"]["targetTypes"] = {}
route[1]["task"]["params"]["tasks"][1]["params"]["targetTypes"][1] = "Helicopters"
route[1]["task"]["params"]["tasks"][1]["params"]["targetTypes"][2] = "Ground Units"
route[1]["task"]["params"]["tasks"][1]["params"]["targetTypes"][3] = "Light armed ships"
route[1]["task"]["params"]["tasks"][1]["params"]["priority"] = 0
... for each waypoint
--]]

--[[
get_aircraft_mission_data("Radio")
data = {}
data[1] = {}
data[1]["channels"] = {}
data[1]["channels"][1] = 254
data[1]["channels"][2] = 265
data[1]["channels"][3] = 256
data[1]["channels"][4] = 254
data[1]["channels"][5] = 250
data[1]["channels"][6] = 270
data[1]["channels"][7] = 257
data[1]["channels"][8] = 258
data[1]["channels"][9] = 262
data[1]["channels"][10] = 259
data[1]["channels"][11] = 268
data[1]["channels"][12] = 269
data[1]["channels"][13] = 260
data[1]["channels"][14] = 263
data[1]["channels"][15] = 261
data[1]["channels"][16] = 267
data[1]["channels"][18] = 253
data[1]["channels"][19] = 266
data[1]["channels"][17] = 251
data[1]["channels"][20] = 252
--]]

-- function basicSerialize(var)
	-- if var == nil then
		-- return "\"\""
	-- else
		-- if ((type(var) == 'number') or
				-- (type(var) == 'boolean') or
				-- (type(var) == 'function') or
				-- (type(var) == 'table') or
				-- (type(var) == 'userdata') ) then
			-- return print_message_to_user(tostring(var))
		-- else
			-- if type(var) == 'string' then
				-- var = print_message_to_user(string.format('%q', var))
				-- return var
			-- end
		-- end
	-- end
-- end
	
-- function tableShow(tbl, loc, indent, tableshow_tbls) --based on serialize_slmod, this is a _G serialization
	-- tableshow_tbls = tableshow_tbls or {} --create table of tables
	-- loc = loc or ""
	-- indent = indent or ""
	-- if type(tbl) == 'table' then --function only works for tables!
		-- tableshow_tbls[tbl] = loc
		-- local tbl_str = {}
		-- tbl_str[#tbl_str + 1] = indent .. '{\n'
		-- for ind,val in pairs(tbl) do -- serialize its fields
			-- if type(ind) == "number" then
				-- tbl_str[#tbl_str + 1] = indent
				-- tbl_str[#tbl_str + 1] = loc .. '['
				-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(ind))
				-- tbl_str[#tbl_str + 1] = '] = '
			-- else
				-- tbl_str[#tbl_str + 1] = indent
				-- tbl_str[#tbl_str + 1] = loc .. '['
				-- tbl_str[#tbl_str + 1] = basicSerialize(ind)
				-- tbl_str[#tbl_str + 1] = '] = '
			-- end
			-- if ((type(val) == 'number') or (type(val) == 'boolean')) then
				-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(val))
				-- tbl_str[#tbl_str + 1] = ',\n'
			-- elseif type(val) == 'string' then
				-- tbl_str[#tbl_str + 1] = basicSerialize(val)
				-- tbl_str[#tbl_str + 1] = ',\n'
			-- elseif type(val) == 'nil' then -- won't ever happen, right?
				-- tbl_str[#tbl_str + 1] = 'nil,\n'
			-- elseif type(val) == 'table' then
				-- if tableshow_tbls[val] then
					-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(val) .. ' already defined: ' .. tableshow_tbls[val] .. ',\n')
				-- else
					-- tableshow_tbls[val] = loc ..	'[' .. basicSerialize(ind) .. ']'
					-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(val) .. ' ')
					-- tbl_str[#tbl_str + 1] = tableShow(val,	loc .. '[' .. basicSerialize(ind).. ']', indent .. '		', tableshow_tbls)
					-- tbl_str[#tbl_str + 1] = ',\n'
				-- end
			-- elseif type(val) == 'function' then
				-- if debug and debug.getinfo then
					-- local fcnname = print_message_to_user(tostring(val))
					-- local info = debug.getinfo(val, "S")
					-- if info.what == "C" then
						-- tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', C function') .. ',\n'
					-- else
						-- if (string.sub(info.source, 1, 2) == [[./]]) then
							-- tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')' .. info.source) ..',\n'
						-- else
							-- tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')') ..',\n'
						-- end
					-- end
				-- else
					-- tbl_str[#tbl_str + 1] = 'a function,\n'
				-- end
			-- else
				-- tbl_str[#tbl_str + 1] = 'unable to serialize value type ' .. basicSerialize(type(val)) .. ' at index ' .. print_message_to_user(tostring(ind))
			-- end
		-- end
		-- tbl_str[#tbl_str + 1] = indent .. '}'
		-- return table.concat(tbl_str)
	-- end
-- end
