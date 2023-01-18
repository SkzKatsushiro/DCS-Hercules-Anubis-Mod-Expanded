--=============================================================================
-- Updates click spots so they move with animations
--=============================================================================

-- local updateanim = GetSelf()

dt = 0.006 -- Run 10 times per second
make_default_activity(dt)

local GEAR_CON = nil
local flap_lever_CON = nil
local Rocket_Assist_Guard_CON = nil
local Rocket_Assist_Switch_CON = nil
local Guard_Master_Arm_CON = nil
local Master_Arm_CON = nil
local Left_Dump_Switch_Guard_CON = nil
local Left_Dump_Switch_CON = nil
local Right_Dump_Switch_Guard_CON = nil
local Right_Dump_Switch_CON = nil
local Cargo_Jett_Locks_FWD_Switch_Guard_CON = nil
local Cargo_Jett_Locks_FWD_Switch_CON = nil
local Cargo_Jett_Locks_MID_Switch_Guard_CON = nil
local Cargo_Jett_Locks_MID_Switch_CON = nil
local Cargo_Jett_Locks_AFT_Switch_Guard_CON = nil
local Cargo_Jett_Locks_AFT_Switch_CON = nil
local Bell_Alarm_Switch_Guard_CON = nil
local Bell_Alarm_Switch_CON = nil
local Chute_Release_Guard_CON = nil
local Chute_Release_Trigger_CON = nil
local Paratroop_Door_Port_CON = nil
local Paratroop_Door_Starboard_CON = nil
local Flightdeck_Pilot_Window_Handle_CON = nil
local Flightdeck_Copilot_Window_Handle_CON = nil
local Pylons_Jettison_Switch_Guard_CON = nil
local Pylons_Jettison_Switch_CON = nil
local Airdrop_Drogue_Switch_Guard_CON = nil
local Airdrop_Drogue_Switch_CON = nil
-- local Throttle1_CON = nil
-- local Throttle2_CON = nil
-- local Throttle3_CON = nil
-- local Throttle4_CON = nil

function post_initialize()
	GEAR_CON = get_clickable_element_reference("GEAR_CON")
	flap_lever_CON = get_clickable_element_reference("flap_lever_CON")
	Rocket_Assist_Guard_CON = get_clickable_element_reference("Rocket_Assist_Guard_CON")
	Rocket_Assist_Switch_CON = get_clickable_element_reference("Rocket_Assist_Switch_CON")
	Master_Arm_Guard_CON = get_clickable_element_reference("Master_Arm_Guard_CON")
	Master_Arm_Switch_CON = get_clickable_element_reference("Master_Arm_Switch_CON")
	Left_Dump_Switch_Guard_CON = get_clickable_element_reference("Left_Dump_Switch_Guard_CON")
	Left_Dump_Switch_CON = get_clickable_element_reference("Left_Dump_Switch_CON")
	Right_Dump_Switch_Guard_CON = get_clickable_element_reference("Right_Dump_Switch_Guard_CON")
	Right_Dump_Switch_CON = get_clickable_element_reference("Right_Dump_Switch_CON")
	Cargo_Jett_Locks_FWD_Switch_Guard_CON = get_clickable_element_reference("Cargo_Jett_Locks_FWD_Switch_Guard_CON")
	Cargo_Jett_Locks_FWD_Switch_CON = get_clickable_element_reference("Cargo_Jett_Locks_FWD_Switch_CON")
	Cargo_Jett_Locks_MID_Switch_Guard_CON = get_clickable_element_reference("Cargo_Jett_Locks_MID_Switch_Guard_CON")
	Cargo_Jett_Locks_MID_Switch_CON = get_clickable_element_reference("Cargo_Jett_Locks_MID_Switch_CON")
	Cargo_Jett_Locks_AFT_Switch_Guard_CON = get_clickable_element_reference("Cargo_Jett_Locks_AFT_Switch_Guard_CON")
	Cargo_Jett_Locks_AFT_Switch_CON = get_clickable_element_reference("Cargo_Jett_Locks_AFT_Switch_CON")
	Bell_Alarm_Switch_Guard_CON = get_clickable_element_reference("Bell_Alarm_Switch_Guard_CON")
	Bell_Alarm_Switch_CON = get_clickable_element_reference("Bell_Alarm_Switch_CON")
	Chute_Release_Guard_CON = get_clickable_element_reference("Chute_Release_Guard_CON")
	Chute_Release_Trigger_CON = get_clickable_element_reference("Chute_Release_Trigger_CON")
	Paratroop_Door_Port_CON = get_clickable_element_reference("Paratroop_Door_Port_CON")
	Paratroop_Door_Starboard_CON = get_clickable_element_reference("Paratroop_Door_Starboard_CON")
	Flightdeck_Pilot_Window_Handle_CON = get_clickable_element_reference("Flightdeck_Pilot_Window_Handle_CON")
	Flightdeck_Copilot_Window_Handle_CON = get_clickable_element_reference("Flightdeck_Copilot_Window_Handle_CON")
	Pylons_Jettison_Switch_Guard_CON = get_clickable_element_reference("Pylons_Jettison_Switch_Guard_CON")
	Pylons_Jettison_Switch_CON = get_clickable_element_reference("Pylons_Jettison_Switch_CON")
	Airdrop_Drogue_Switch_Guard_CON = get_clickable_element_reference("Airdrop_Drogue_Switch_Guard_CON")
	Airdrop_Drogue_Switch_CON = get_clickable_element_reference("Airdrop_Drogue_Switch_CON")
	-- Throttle1_CON = get_clickable_element_reference("Throttle1_CON")
	-- Throttle2_CON = get_clickable_element_reference("Throttle2_CON")
	-- Throttle3_CON = get_clickable_element_reference("Throttle3_CON")
	-- Throttle4_CON = get_clickable_element_reference("Throttle4_CON")
end



-- local General_Update = false
function update()
	-- print_message_to_user(string.format("General update"))
	-- if (General_Update == false) then
		-- General_Update = true
	-- end
	if GEAR_CON then
		GEAR_CON:update()
	end 
	if flap_lever_CON then
		flap_lever_CON:update()
	end 
	if Rocket_Assist_Guard_CON then
		Rocket_Assist_Guard_CON:update()
	end 
	if Rocket_Assist_Switch_CON then
		Rocket_Assist_Switch_CON:update()
	end 
	if Master_Arm_Guard_CON then
		Master_Arm_Guard_CON:update()
	end 
	if Master_Arm_Switch_CON then
		Master_Arm_Switch_CON:update()
	end 
	if Left_Dump_Switch_Guard_CON then
		Left_Dump_Switch_Guard_CON:update()
	end 
	if Left_Dump_Switch_CON then
		Left_Dump_Switch_CON:update()
	end 
	if Right_Dump_Switch_Guard_CON then
		Right_Dump_Switch_Guard_CON:update()
	end 
	if Right_Dump_Switch_CON then
		Right_Dump_Switch_CON:update()
	end
	if Cargo_Jett_Locks_FWD_Switch_Guard_CON then
		Cargo_Jett_Locks_FWD_Switch_Guard_CON:update()
	end 
	if Cargo_Jett_Locks_FWD_Switch_CON then
		Cargo_Jett_Locks_FWD_Switch_CON:update()
	end
	if Cargo_Jett_Locks_MID_Switch_Guard_CON then
		Cargo_Jett_Locks_MID_Switch_Guard_CON:update()
	end 
	if Cargo_Jett_Locks_MID_Switch_CON then
		Cargo_Jett_Locks_MID_Switch_CON:update()
	end
	if Cargo_Jett_Locks_AFT_Switch_Guard_CON then
		Cargo_Jett_Locks_AFT_Switch_Guard_CON:update()
	end 
	if Cargo_Jett_Locks_AFT_Switch_CON then
		Cargo_Jett_Locks_AFT_Switch_CON:update()
	end
	if Bell_Alarm_Switch_Guard_CON then
		Bell_Alarm_Switch_Guard_CON:update()
	end 
	if Bell_Alarm_Switch_CON then
		Bell_Alarm_Switch_CON:update()
	end
	if Chute_Release_Guard_CON then
		Chute_Release_Guard_CON:update()
	end 
	if Chute_Release_Trigger_CON then
		Chute_Release_Trigger_CON:update()
	end
	if Paratroop_Door_Port_CON then
		Paratroop_Door_Port_CON:update()
	end
	if Paratroop_Door_Starboard_CON then
		Paratroop_Door_Starboard_CON:update()
	end
	if Flightdeck_Pilot_Window_Handle_CON then
		Flightdeck_Pilot_Window_Handle_CON:update()
	end
	if Flightdeck_Copilot_Window_Handle_CON then
		Flightdeck_Copilot_Window_Handle_CON:update()
	end
	if Pylons_Jettison_Switch_Guard_CON then
		Pylons_Jettison_Switch_Guard_CON:update()
	end 
	if Pylons_Jettison_Switch_CON then
		Pylons_Jettison_Switch_CON:update()
	end 
	if Airdrop_Drogue_Switch_Guard_CON then
		Airdrop_Drogue_Switch_Guard_CON:update()
	end 
	if Airdrop_Drogue_Switch_CON then
		Airdrop_Drogue_Switch_CON:update()
	end 
	-- if Throttle1_CON then
		-- Throttle1_CON:update()
	-- end
	-- if Throttle2_CON then
		-- Throttle2_CON:update()
	-- end
	-- if Throttle3_CON then
		-- Throttle3_CON:update()
	-- end
	-- if Throttle4_CON then
		-- Throttle4_CON:update()
	-- end

	-- end
		-- GEAR_COMMAND = get_aircraft_draw_argument_value(500)
	-- set_aircraft_draw_argument_value(501, BRAKE_COMMAND)
		-- updateanim:performClickableAction(device_commands.Button_110, (Flap_Commanded:get() / 100) + 0.25)--Flaps
end

	-- set_hint
	-- update
	-- hide

	-- set_hint updates the mouseover text of the clickable element dynamically (pass a string as an argument),
	-- hide takes a boolean as argument and changes whether the element is clickable or not
	-- (useful if you want elements to not be clickable under certain logic conditions),
	-- and update (takes no arguments) is useful to get a clickable element to update its connector position
	-- (this is useful if you have changed the cockpit draw argument of a clickable item
	-- (e.g. via a parameter gauge) instead of using the clickable animations
	-- (which are sometimes problematic since they only emit the command after the animation has completed,
	-- and you might want to employ some logic as soon as it is clicked before it starts animating) ).
	
    -- if prev_retraction_release_airborne ~= retraction_release_airborne then
        -- local gear_clickable_ref = get_clickable_element_reference("CON_8") -- gear lever
        -- prev_retraction_release_airborne = retraction_release_airborne
        -- gear_clickable_ref:hide(not retraction_release_airborne)  -- make non-clickable if not airborne, and clickable when airborne
    -- end
	
	
	