-- function external_profile(t)
    -- return {keyCommands = {}, axisCommands = {}}
-- end
-- function join(t1, t2)
    -- for i=1,#t2 do
        -- t1[#t1+1] = t2[i]
    -- end
    -- return t1
-- end

dofile(folder.."../../Cockpit/Scripts/command_defs.lua")
-- local base = external_profile("Config/Input/Aircrafts/commonoard_binding.lua")

-- ignore_features(base.keyCommands,{
-- "F1 Cockpit view",
-- "F2 Aircraft view",
-- "F3 Fly-By view"
-- })
local kneeboard_id = 100
if devices and devices.KNEEBOARD then
   kneeboard_id = devices.KNEEBOARD
end

return {
keyCommands = {


--Station Control
{combos = {{key = 'J'}}, down = General_Packet_Send.NetCrewRequestControl,	name = _('Request Aircraft Control'),	category = _('Station Control')},
{combos = {{key = '1'}}, down = iCommandViewCockpitChangeSeat, value_down = 1, up = Position_Control.Pilot_Seat, name = _('Pilot Seat'),	category = _('Station Control')},
{combos = {{key = '2'}}, down = iCommandViewCockpitChangeSeat, value_down = 2, up = Position_Control.Copilot_Seat, name = _('Copilot Seat'),	category = _('Station Control')},
{combos = {{key = '3'}}, down = Position_Control.Loadmaster_Station, name = _('Loadmaster Station'),	category = _('Station Control')},
{combos = {{key = '4'}}, down = Position_Control.CargoRamp_Station, name = _('Cargo Ramp Station'),	category = _('Station Control')},
{combos = {{key = '5'}}, down = Position_Control.Cannon_Target_Station, name = _('Cannon Target Station'),	category = _('Station Control')},

--Cargo Hold
{combos = {{key = 'C', reformers = {'LCtrl'}}}, down = MISCELLANEOUS.CargoDoorRampClose, name = _('Cargo Door/Ramp Close'), category = _('Cargo Hold')},
{combos = {{key = 'C', reformers = {'LShift'}}}, down = MISCELLANEOUS.CargoDoorRampOpen, name = _('Cargo Door/Ramp Open'), category = _('Cargo Hold')},
{combos = {{key = 'D', reformers = {'LCtrl'}}}, down = MISCELLANEOUS.Crew_Entrance_Door_Toggle, name = _('Crew Entrance Door Open/Close'), category = _('Cargo Hold')},
{combos = {{key = 'D', reformers = {'LAlt'}}}, down = MISCELLANEOUS.Paratroop_Doors_Toggle, name = _('Paratroop Doors Open/Close'), category = _('Cargo Hold')},
{combos = {{key = 'V', reformers = {'LAlt'}}}, down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_Locks_Release_Keyb, name = _('Cargo Deploy ALL (Jettison Locks Release)'), category = _('Cargo Hold')},
{combos = {{key = 'V', reformers = {'RShift'}}}, down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_FWD_Locks_Release_Keyb, name = _('Cargo Deploy FWD (Jettison Lock Release)'), category = _('Cargo Hold')},
{combos = {{key = 'V', reformers = {'RAlt'}}}, down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_MID_Locks_Release_Keyb, name = _('Cargo Deploy MID (Jettison Lock Release)'), category = _('Cargo Hold')},
{combos = {{key = 'V', reformers = {'RCtrl'}}}, down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_AFT_Locks_Release_Keyb, name = _('Cargo Deploy AFT (Jettison Lock Release)'), category = _('Cargo Hold')},

-- Rocket Assist
{combos = {{key = 'R', reformers = {'LAlt'}}}, down = MISCELLANEOUS.RocketAssistTakeoff, name = _('Trigger Rocket Assisted Takeoff'), category = _('Rocket Assist')},

-- Flightdeck
{combos = {{key = 'D', reformers = {'LShift'}}}, down = MISCELLANEOUS.Flightdeck_Windows_Toggle, name = _('Flightdeck Windows Toggle Open/Close'), category = _('Flightdeck')},
{combos = {{key = 'S', reformers = {'LShift'}}}, down = ICS_PANEL.ICS_Silence_Keyb, name = _('Silence Alarms Toggle'), category = _('Flightdeck')},

-- Ground Control
{combos = {{key = 'W'}}, down = MISCELLANEOUS.BrakesBothOn, up = MISCELLANEOUS.BrakesBothOff, name = _('Left and Right Toe Brakes On/Off'), category = _('Ground Control')},
{combos = {{key = 'Left', reformers = {'RCtrl'}}}, pressed = MISCELLANEOUS.NWSLeft, up = MISCELLANEOUS.NWSLeftCenter, name = _('Nose Wheel Steering Left'), category = _('Ground Control')},
{combos = {{key = 'Right', reformers = {'RCtrl'}}}, pressed = MISCELLANEOUS.NWSRight, up = MISCELLANEOUS.NWSRightCenter, name = _('Nose Wheel Steering Right'), category = _('Ground Control')},
{combos = {{key = 'W', reformers = {'LShift'}}}, down = MISCELLANEOUS.Park_Brake_Toggle, name = _('Park Brake Toggle'), category = _('Ground Control')},
{combos = {{key = 'G'}}, down = LANDING_GEAR_LIGHTS_PANEL.GearToggle, name = _('Landing Gear Toggle'), category = _('Ground Control')},
{combos = {{key = 'G', reformers = {'LAlt'}}}, down = LANDING_GEAR_LIGHTS_PANEL.GearUp, name = _('Landing Gear Up'), category = _('Ground Control')},
{combos = {{key = 'G', reformers = {'LCtrl'}}}, down = LANDING_GEAR_LIGHTS_PANEL.GearDown, name = _('Landing Gear Down'), category = _('Ground Control')},

--Engine Control Panel
-- {combos = {{key = 'Home', reformers = {'RAlt'}}}, down = ENGINE_START_PANEL.Engine1_Start, name = _('Engines 1 Start'), category = _('Engine Control Panel')},
-- {combos = {{key = 'End', reformers = {'RAlt'}}}, down = ENGINE_START_PANEL.Engine1_Stop, name = _('Engine 1 Stop'), category = _('Engine Control Panel')},
-- {combos = {{key = 'Home', reformers = {'RCtrl'}}}, down = ENGINE_START_PANEL.Engine2_Start, name = _('Engines 2 Start'), category = _('Engine Control Panel')},
-- {combos = {{key = 'End', reformers = {'RCtrl'}}}, down = ENGINE_START_PANEL.Engine2_Stop, name = _('Engine 2 Stop'), category = _('Engine Control Panel')},
-- {combos = {{key = 'Home', reformers = {'RAlt','RCtrl'}}}, down = ENGINE_START_PANEL.Engine3_Start, name = _('Engine 3 Start'), category = _('Engine Control Panel')},
-- {combos = {{key = 'End', reformers = {'RAlt','RCtrl'}}}, down = ENGINE_START_PANEL.Engine3_Stop, name = _('Engine 3 Stop'), category = _('Engine Control Panel')},
-- {combos = {{key = 'Home', reformers = {'RAlt','RShift'}}}, down = ENGINE_START_PANEL.Engine4_Start, name = _('Engine 4 Start'), category = _('Engine Control Panel')},
-- {combos = {{key = 'End', reformers = {'RAlt','RShift'}}}, down = ENGINE_START_PANEL.Engine4_Stop, name = _('Engine 4 Stop'), category = _('Engine Control Panel')},

--APU
-- {down = APU_PANEL.APU_Start, name = _('APU Start'), category = _('APU Panel')},
-- {down = APU_PANEL.APU_Stop, name = _('APU Stop'), category = _('APU Panel')},

-- Navigation
--Cursor
{combos = {{key = 'U', reformers = {'RAlt'}}}, down = CURSOR.Manual_Cursor, name = _('Manual Cursor'), category = _('Common Cursor Control')},
{combos = {{key = 'U', reformers = {'RShift','RAlt'}}}, down = CURSOR.Cursor_Reset, name = _('Cursor Reset'), category = _('Common Cursor Control')},
{combos = {{key = 'G', reformers = {'RAlt'}}}, down = CURSOR.Ground_Cursor, name = _('Ground Cursor'), category = _('Common Cursor Control')},
{combos = {{key = 'H', reformers = {'RAlt'}}}, down = CURSOR.Computer_Cursor, name = _('Computer Cursor'), category = _('Common Cursor Control')},
{combos = {{key = ';', reformers = {'RAlt'}}}, pressed = CURSOR.Cursor_Forward, up = CURSOR.Cursor_Release, name = _('Cursor Forward'), category = _('Common Cursor Control')},
{combos = {{key = '.', reformers = {'RAlt'}}}, pressed = CURSOR.Cursor_Aft, up = CURSOR.Cursor_Release, name = _('Cursor Aft'), category = _('Common Cursor Control')},
{combos = {{key = ',', reformers = {'RAlt'}}}, pressed = CURSOR.Cursor_Left, up = CURSOR.Cursor_Release, name = _('Cursor Left'), category = _('Common Cursor Control')},
{combos = {{key = '/', reformers = {'RAlt'}}}, pressed = CURSOR.Cursor_Right, up = CURSOR.Cursor_Release, name = _('Cursor Right'), category = _('Common Cursor Control')},
{combos = {{key = 'T', reformers = {'RAlt'}}}, down = CURSOR.Cursor_Next_Target, name = _('Cursor Next Target'), category = _('Common Cursor Control')},
{combos = {{key = 'R', reformers = {'RAlt'}}}, down = CURSOR.Cursor_Previous_Target, name = _('Cursor Previous Target'), category = _('Common Cursor Control')},
{combos = {{key = 'I', reformers = {'RAlt'}}}, down = CURSOR.Cursor_Insert, name = _('Cursor Insert/Update'), category = _('Common Cursor Control')},

-- Radio
{combos = {{key = '\\', reformers = {'RCtrl'}}}, down = ICS_PANEL.Radio_PTT_Keyb, name = _('Radio Push to Talk (PTT)'), category = _('Radio')},

-- Autopilot
{combos = {{key = 'A'}}, down = Automatic_Flight_Control_System_Panel.AFCS_Autopilot_On, name = _('AP Engage (not realistic)') , category = _('Autopilot')},
{combos = {{key = 'A', reformers = {'LShift'}}}, down = Automatic_Flight_Control_System_Panel.AFCS_Autopilot_Off, name = _('AP: 1st press - disengage, 2nd press - AP DSNG annunciation off') , category = _('Autopilot')},
{combos = {{key = 'A', reformers = {'LAlt'}}}, pressed = Automatic_Flight_Control_System_Panel.AFCS_Vert_Ref_Sync_Control_On, up = Automatic_Flight_Control_System_Panel.AFCS_Vert_Ref_Sync_Control_Off, name = _('Vertical Reference Synchronization Control') , category = _('Autopilot')},

-- Flight Control
{combos = {{key = '.', reformers = {'RCtrl'}}}, pressed = TRIM.Up, up = TRIM.Stop, name = _('Trim: Nose Up'), category = _('Flight Control')},
{combos = {{key = ';', reformers = {'RCtrl'}}}, pressed = TRIM.Down, up = TRIM.Stop, name = _('Trim: Nose Down'), category = _('Flight Control')},
{combos = {{key = ',', reformers = {'RCtrl'}}}, pressed = TRIM.Left, up = TRIM.Stop, name = _('Trim: Left Wing Down'), category = _('Flight Control')},
{combos = {{key = '/', reformers = {'RCtrl'}}}, pressed = TRIM.Right, up = TRIM.Stop, name = _('Trim: Right Wing Down'), category = _('Flight Control')},
{combos = {{key = 'N', reformers = {'RAlt'}}}, pressed = TRIM.RudderLeft, up = TRIM.Stop, name = _('Trim: Rudder Left'), category = _('Flight Control')},
{combos = {{key = 'M', reformers = {'RAlt'}}}, pressed = TRIM.RudderRight, up = TRIM.Stop, name = _('Trim: Rudder Right'), category = _('Flight Control')},
{combos = {{key = 'O'}}, down = AERIAL_DELIVERY_PANEL.Air_Deflector_Toggle, name = _('Paratroop Air Deflector Toggle'), category = _('Flight Control')},
{combos = {{key = 'O', reformers = {'RAlt'}}}, down = AERIAL_DELIVERY_PANEL.Air_Deflector_Extend, name = _('Paratroop Air Deflector Extend'), category = _('Flight Control')},
{combos = {{key = 'O', reformers = {'RCtrl'}}}, down = AERIAL_DELIVERY_PANEL.Air_Deflector_Retract, name = _('Paratroop Air Deflector Retract'), category = _('Flight Control')},
{combos = {{key = 'Up'}}, pressed = FLIGHT_CONTROL.PlaneUpStart, up = FLIGHT_CONTROL.PlaneUpStop, name = _('Aircraft Pitch Up'), category = _('Flight Control')},
{combos = {{key = 'Down'}}, pressed = FLIGHT_CONTROL.PlaneDownStart, up = FLIGHT_CONTROL.PlaneDownStop, name = _('Aircraft Pitch Down'), category = _('Flight Control')},
{combos = {{key = 'Left'}}, pressed = FLIGHT_CONTROL.PlaneLeftStart, up = FLIGHT_CONTROL.PlaneLeftStop, name = _('Aircraft Bank Left'), category = _('Flight Control')},
{combos = {{key = 'Right'}}, pressed = FLIGHT_CONTROL.PlaneRightStart, up = FLIGHT_CONTROL.PlaneRightStop, name = _('Aircraft Bank Right'), category = _('Flight Control')},
{combos = {{key = 'Z'}}, pressed = FLIGHT_CONTROL.PlaneLeftRudderStart, up = FLIGHT_CONTROL.PlaneLeftRudderStop, name = _('Aircraft Rudder Left'), category = _('Flight Control')},
{combos = {{key = 'X'}}, pressed = FLIGHT_CONTROL.PlaneRightRudderStart, up = FLIGHT_CONTROL.PlaneRightRudderStop, name = _('Aircraft Rudder Right'), category = _('Flight Control')},
{combos = {{key = 'F'}}, down = FLAPS.Down, name = _('Flaps Increment Down'), category = _('Flight Control')},
{combos = {{key = 'F', reformers = {'LShift'}}}, down = FLAPS.Up, name = _('Flaps Increment Up'), category = _('Flight Control')},
{combos = {{key = 'F', reformers = {'LCtrl'}}}, down = FLAPS.Zero_percent, name = _('Flaps 0%'), category = _('Flight Control')},
{combos = {{key = 'F', reformers = {'LAlt'}}}, down = FLAPS.Fifty_percent, name = _('Flaps 50%'), category = _('Flight Control')},
{combos = {{key = 'F', reformers = {'LCtrl', 'LAlt'}}}, down = FLAPS.Hunderd_percent, name = _('Flaps 100%'), category = _('Flight Control')},

-- Throttle Control
{combos = {{key = 'B'}}, down = THROTTLES.Beta, name = _('Throttles Beta Mode'), category = _('Throttle Control')},
{combos = {{key = 'B', reformers = {'RAlt'}}}, down = THROTTLES.Beta_Reverse, name = _('Throttles Beta Reverse'), category = _('Throttle Control')},
{combos = {{key = 'B', reformers = {'RShift'}}}, down = THROTTLES.Full_Reverse, name = _('Throttles Flight to Beta Full Reverse'), category = _('Throttle Control')},
{combos = {{key = 'P'}}, down = THROTTLES.TO_Power_Toggle, name = _('Throttles Take-off power Toggle On/Off'), category = _('Throttle Control')},
{combos = {{key = 'P', reformers = {'RAlt'}}}, down = THROTTLES.TO_Power_On, name = _('Throttles Take-off power On'), category = _('Throttle Control')},
{combos = {{key = 'P', reformers = {'RCtrl'}}}, down = THROTTLES.TO_Power_Off, name = _('Throttles Take-off power Off'), category = _('Throttle Control')},
{combos = {{key = 'T', reformers = {'LAlt'}}}, down = THROTTLES.ATCS_Autothrottle_Disengage, name = _('ATCS - Autothrottle disengage') , category = _('Throttle Control')},
{combos = {{key = 'P', reformers = {'RShift'}}}, down = THROTTLES.Throttles_To_Idle, name = _('Throttles to Idle') , category = _('Throttle Control')},
{combos = {{key = 'PageUp'}}, pressed = THROTTLES.ThrottlesIncrease, name = _('Throttles all Up'), category = _('Throttle Control')},
{combos = {{key = 'PageDown'}}, pressed = THROTTLES.ThrottlesDecrease, name = _('Throttles all Down'), category = _('Throttle Control')},
{combos = {{key = 'PageUp', reformers = {'LCtrl','LWin'}}}, pressed = THROTTLES.Throttles12Increase, name = _('Throttles 1 and 2 Up'), category = _('Throttle Control')},
{combos = {{key = 'PageDown', reformers = {'LCtrl','LWin'}}} , pressed = THROTTLES.Throttles12Decrease, name = _('Throttles 1 and 2 Down'), category = _('Throttle Control')},
{combos = {{key = 'PageUp', reformers = {'LAlt','LWin'}}}, pressed = THROTTLES.Throttles34Increase, name = _('Throttles 3 and 4 Up'), category = _('Throttle Control')},
{combos = {{key = 'PageDown', reformers = {'LAlt','LWin'}}}, pressed = THROTTLES.Throttles34Decrease, name = _('Throttles 3 and 4 Down'), category = _('Throttle Control')},

--Night Vision Goggles
{combos = {{key = 'H', reformers = {'RShift'}}}		   , 	down    = iCommandViewNightVisionGogglesOn, name = _('Night Vision Goggles')   , category = _('Night Vision Goggles')},
{combos = {{key = 'H', reformers = {'RShift','RCtrl'}}}, 	pressed = iCommandPlane_Helmet_Brightess_Up  , name = _('Night Vision Goggles Gain Up')  , category = _('Night Vision Goggles')},
{combos = {{key = 'H', reformers = {'RShift','RAlt'}}} , 	pressed = iCommandPlane_Helmet_Brightess_Down, name = _('Night Vision Goggles Gain Down'), category = _('Night Vision Goggles')},
{combos = {{key = 'H', reformers = {'LAlt'}}}, down = DISPLAY_BRIGHTNESS_CONTROL.NightVisionGogglesOn, name = _('Cockpit Lights NVG Adapt') , category = _('Night Vision Goggles')},

--- Battle Station
{combos = {{key = 'Space'}}, down = BATTLE_STATION_COMMANDS.Cannon_Release_Keyb_On, up = BATTLE_STATION_COMMANDS.Cannon_Release_Keyb_Off, name = _('Trigger: Fire Cannons'), category = _('Battle Station')},
{combos = {{key = 'Space', reformers = {'RAlt'}}}, down = BATTLE_STATION_COMMANDS.Pylon_Release_Keyb_On, up = BATTLE_STATION_COMMANDS.Pylon_Release_Keyb_Off, name = _('Pickle: Launch Pylon Load'),	category = _('Battle Station')},
{combos = {{key = ';'}}, pressed = BATTLE_STATION_COMMANDS.TDC_FORWARD, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Forward'), category = _('Battle Station')},
{combos = {{key = '.'}}, pressed = BATTLE_STATION_COMMANDS.TDC_AFT, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Aft'), category = _('Battle Station')},
{combos = {{key = ','}}, pressed = BATTLE_STATION_COMMANDS.TDC_LEFT, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Left'), category = _('Battle Station')},
{combos = {{key = '/'}}, pressed = BATTLE_STATION_COMMANDS.TDC_RIGHT, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Right'), category = _('Battle Station')},
{combos = {{key = 'Up', reformers = {'RAlt'}}}, pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_UP, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew UP'), category = _('Battle Station')},
{combos = {{key = 'Down', reformers = {'RAlt'}}}, pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_DOWN, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew DOWN'), category = _('Battle Station')},
{combos = {{key = 'Left', reformers = {'RAlt'}}}, pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_LEFT, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew LEFT'), category = _('Battle Station')},
{combos = {{key = 'Right', reformers = {'RAlt'}}}, pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_RIGHT, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew RIGHT'), category = _('Battle Station')},

--Counter measures
{combos = {{key = 'Delete'}}, down = iCommandPlaneDropFlareOnce, name = _('Countermeasures Flares Dispense'), category = _('Countermeasures') , features = {"Countermeasures"}},
{combos = {{key = 'Insert'}}, down = iCommandPlaneDropChaffOnce, name = _('Countermeasures Chaff Dispense'), category = _('Countermeasures') , features = {"Countermeasures"}},

------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- begin of custom keybinds
------------------------------------------------------------------------------------------------------------------------------
-- AFCS select Panel
{down = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Hold, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Hold, value_up =  0, name = _('AFCS Alt Hold on else off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Hold, value_down =  0, name = _('AFCS Alt Hold off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Hold, value_down = -1, name = _('AFCS Alt Hold on'), category = _('AFCS Select Panel')},

{down = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Select, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Select, value_up =  0, name = _('AFCS Alt Select on else off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Select, value_down =  0, name = _('AFCS Alt Select off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Select, value_down = -1, name = _('AFCS Alt Select on'), category = _('AFCS Select Panel')},

{down = REFERENCE_SET_MODE_SELECT_PANELS.Hdg, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.Hdg, value_up =  0, name = _('AFCS Hdg on else off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Hdg, value_down =  0, name = _('AFCS Hdg off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Hdg, value_down = -1, name = _('AFCS Hdg on'), category = _('AFCS Select Panel')},

-- effect to Hdg
--{down = REFERENCE_SET_MODE_SELECT_PANELS.Nav, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.Nav, value_up =  0, name = _('AFCS Nav on else off'), category = _('AFCS Select Panel')},
--{down = REFERENCE_SET_MODE_SELECT_PANELS.Nav, value_down =  0, name = _('AFCS Nav off'), category = _('AFCS Select Panel')},
--{down = REFERENCE_SET_MODE_SELECT_PANELS.Nav, value_down = -1, name = _('AFCS Nav on'), category = _('AFCS Select Panel')},

{down = REFERENCE_SET_MODE_SELECT_PANELS.Approach, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.Approach, value_up =  0, name = _('AFCS Approach on else off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Approach, value_down =  0, name = _('AFCS Approach off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Approach, value_down = -1, name = _('AFCS Approach on'), category = _('AFCS Select Panel')},

{down = REFERENCE_SET_MODE_SELECT_PANELS.Ver_Speed_Hold, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.Ver_Speed_Hold, value_up =  0, name = _('AFCS Vertical Speed Hold on else off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Ver_Speed_Hold, value_down =  0, name = _('AFCS Vertical Speed Hold off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Ver_Speed_Hold, value_down = -1, name = _('AFCS Vertical Speed Hold on'), category = _('AFCS Select Panel')},

{down = REFERENCE_SET_MODE_SELECT_PANELS.IAS, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.IAS, value_up =  0, name = _('AFCS IAS on else off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.IAS, value_down =  0, name = _('AFCS IAS off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.IAS, value_down = -1, name = _('AFCS IAS on'), category = _('AFCS Select Panel')},

-- not implemented yet
--{down = REFERENCE_SET_MODE_SELECT_PANELS.CAPS, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.CAPS, value_up =  0, name = _('AFCS CAPS on else off'), category = _('AFCS Select Panel')},
--{down = REFERENCE_SET_MODE_SELECT_PANELS.CAPS, value_down =  0, name = _('AFCS CAPS off'), category = _('AFCS Select Panel')},
--{down = REFERENCE_SET_MODE_SELECT_PANELS.CAPS, value_down = -1, name = _('AFCS CAPS on'), category = _('AFCS Select Panel')},

{down = REFERENCE_SET_MODE_SELECT_PANELS.Autothrottle, value_down = -1, up = REFERENCE_SET_MODE_SELECT_PANELS.Autothrottle, value_up =  0, name = _('AFCS Autothrottle on else off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Autothrottle, value_down =  0, name = _('AFCS Autothrottle off'), category = _('AFCS Select Panel')},
{down = REFERENCE_SET_MODE_SELECT_PANELS.Autothrottle, value_down = -1, name = _('AFCS Autothrottle on'), category = _('AFCS Select Panel')},

-- THROTTLE_QUADRANT_ASSEMBLY
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle1_disabled, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Throttle1_disabled, value_up = 0, name = _('Throttle 1  disable to flight/ground idle else enable'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle1_disabled, value_down =  0, name = _('Throttle 1  enable to flight/ground idle'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle1_disabled, value_down = -1, name = _('Throttle 1  disable to flight/ground idle'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle2_disabled, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Throttle2_disabled, value_up = 0, name = _('Throttle 2  disable to flight/ground idle else enable'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle2_disabled, value_down =  0, name = _('Throttle 2  enable to flight/ground idle'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle2_disabled, value_down = -1, name = _('Throttle 2  disable to flight/ground idle'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle3_disabled, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Throttle3_disabled, value_up = 0, name = _('Throttle 3  disable to flight/ground idle else enable'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle3_disabled, value_down =  0, name = _('Throttle 3  enable to flight/ground idle'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle3_disabled, value_down = -1, name = _('Throttle 3  disable to flight/ground idle'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle4_disabled, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Throttle4_disabled, value_up = 0, name = _('Throttle 4  disable to flight/ground idle else enable'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle4_disabled, value_down =  0, name = _('Throttle 4  enable to flight/ground idle'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Throttle4_disabled, value_down = -1, name = _('Throttle 4  disable to flight/ground idle'), category = _('Throttle Control')},

{down = THROTTLE_QUADRANT_ASSEMBLY.Engine1SpeedMode_switch, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Engine1SpeedMode_switch, value_up =  0, name = _('Engine1 Low Speed Ground Idle on else off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine1SpeedMode_switch, value_down =  0, name = _('Engine1 Low Speed Ground Idle off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine1SpeedMode_switch, value_down = -1, name = _('Engine1 Low Speed Ground Idle on'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine2SpeedMode_switch, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Engine2SpeedMode_switch, value_up =  0, name = _('Engine2 Low Speed Ground Idle on else off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine2SpeedMode_switch, value_down =  0, name = _('Engine2 Low Speed Ground Idle off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine2SpeedMode_switch, value_down = -1, name = _('Engine2 Low Speed Ground Idle on'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine3SpeedMode_switch, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Engine3SpeedMode_switch, value_up =  0, name = _('Engine3 Low Speed Ground Idle on else off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine3SpeedMode_switch, value_down =  0, name = _('Engine3 Low Speed Ground Idle off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine3SpeedMode_switch, value_down = -1, name = _('Engine3 Low Speed Ground Idle on'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine4SpeedMode_switch, value_down = -1, up = THROTTLE_QUADRANT_ASSEMBLY.Engine4SpeedMode_switch, value_up =  0, name = _('Engine4 Low Speed Ground Idle on else off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine4SpeedMode_switch, value_down =  0, name = _('Engine4 Low Speed Ground Idle off'), category = _('Throttle Control')},
{down = THROTTLE_QUADRANT_ASSEMBLY.Engine4SpeedMode_switch, value_down = -1, name = _('Engine4 Low Speed Ground Idle on'), category = _('Throttle Control')},
 
-- LANDING_GEAR_LIGHTS_PANEL
{down = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_ExtHldRet_switch, value_down = 0, up = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_ExtHldRet_switch, value_up = 1, name = _('Left Landing Lights Extend else Hold'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_ExtHldRet_switch, value_down = 1, up = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_ExtHldRet_switch, value_up = 0, name = _('Left Landing Lights Retract else Hold'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_ExtHldRet_switch, value_down = 1, name = _('Left Landing Lights Motor down'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_ExtHldRet_switch, value_down = 0, name = _('Left Landing Lights Motor up'), category = _('Ground Control')},

{down = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_ExtHldRet_switch, value_down = 0, up = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_ExtHldRet_switch, value_up = 1, name = _('Right Landing Lights Extend else Hold'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_ExtHldRet_switch, value_down = 1, up = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_ExtHldRet_switch, value_up = 0, name = _('Right Landing Lights Retract else Hold'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_ExtHldRet_switch, value_down = 1, name = _('Right Landing Lights Motor down'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_ExtHldRet_switch, value_down = 0, name = _('Right Landing Lights Motor up'), category = _('Ground Control')},

{down = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_OnOff_switch, value_down = -1, up = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_OnOff_switch, value_up = 0, name = _('Left Landing Lights On else Off'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_OnOff_switch, value_down = -1, name = _('Left Landing Lights On'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_OnOff_switch, value_down =  0, name = _('Left Landing Lights Off'), category = _('Ground Control')},

{down = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_OnOff_switch, value_down = -1, up = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_OnOff_switch, value_up = 0, name = _('Right Landing Lights On else Off'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_OnOff_switch, value_down = -1, name = _('Right Landing Lights On'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_OnOff_switch, value_down =  0, name = _('Right Landing Lights Off'), category = _('Ground Control')},

{down = LANDING_GEAR_LIGHTS_PANEL.Taxi_Lights_OnOff_switch, value_down = -1, up = LANDING_GEAR_LIGHTS_PANEL.Taxi_Lights_OnOff_switch, value_up = 0, name = _('Taxi Lights On else Off'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.Taxi_Lights_OnOff_switch, value_down = -1, name = _('Taxi Lights On'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.Taxi_Lights_OnOff_switch, value_down =  0, name = _('Taxi Lights Off'), category = _('Ground Control')},
-- end of custom keybinds


------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- commonkeyboard_binding
------------------------------------------------------------------------------------------------------------------------------
-- Debug
{combos = {{key = '`', reformers = {'LAlt'}}},		down = ICommandToggleConsole,	name = _('Toggle Console'),		category = _('Debug')},
{combos = {{key = 'R', reformers = {'LShift'}}},	down = iCommandMissionRestart,	name = _('Restart Mission'),	category = _('Debug')},

-- General (Gameplay)
{combos = {{key = 'Esc'}},										down = iCommandQuit,							name = _('End mission'),							category = _('General')},
{combos = {{key = 'Pause'}},									down = iCommandBrakeGo,							name = _('Pause'),									category = _('General')},
{combos = {{key = 'Z', reformers = {'LCtrl'}}},					down = iCommandAccelerate,						name = _('Time accelerate'),						category = _('General')},
{combos = {{key = 'Z', reformers = {'LAlt'}}},					down = iCommandDecelerate,						name = _('Time decelerate'),						category = _('General')},
{combos = {{key = 'Z', reformers = {'LShift'}}},				down = iCommandNoAcceleration,					name = _('Time normal'),							category = _('General')},
{combos = {{key = '\''}},										down = iCommandScoresWindowToggle,				name = _('Score window'),							category = _('General')},

{combos = {{key = 'Y',	 reformers = {'LCtrl'}}},				down = iCommandInfoOnOff,						name = _('Info bar view toggle'),					category = _('General')},
{combos = {{key = 'Tab', reformers = {'RCtrl', 'RShift'}}},		down = iCommandRecoverHuman,					name = _('Get new plane - respawn'),				category = _('General')},
{combos = {{key = 'J',	 reformers = {'RAlt'}}},				down = iCommandPlaneJump,						name = _('Jump into selected aircraft'),			category = _('General')},
{combos = {{key = 'SysRQ'}},									down = iCommandScreenShot,						name = _('Screenshot'),								category = _('General'), disabled = true},
{combos = {{key = 'Pause', reformers = {'RCtrl'}}},				down = iCommandGraphicsFrameRate,				name = _('Frame rate counter - Service info'),		category = _('General')},
{combos = {{key = 'Y',	 reformers = {'LAlt'}}},				down = iCommandViewCoordinatesInLinearUnits,	name = _('Info bar coordinate units toggle'),		category = _('General')},
{combos = {{key = 'C',	 reformers = {'LAlt'}}},				down = iCommandCockpitClickModeOnOff,			name = _('Clickable mouse cockpit mode On/Off'),	category = _('General')},
{combos = {{key = 'S',	 reformers = {'LCtrl'}}},				down = iCommandSoundOnOff,						name = _('Sound On/Off'),							category = _('General')},
{combos = {{key = '\'',	 reformers = {'LAlt'}}}, 				down = iCommandMissionResourcesManagement,		name = _('Rearming and Refueling Window'),			category = _('General')},
{combos = {{key = 'B',	 reformers = {'LAlt'}}},				down = iCommandViewBriefing,					name = _('View briefing on/off'),					category = _('General')},
{combos = {{key = 'Pause', reformers = {'LShift', 'LWin'}}},	down = iCommandActivePauseOnOff,				name = _('Active Pause'),							category = _('Cheat')},
{combos = {{key = 'Enter', reformers = {'RCtrl'}}},				down = iCommandPlane_ShowControls,				name = _('Show controls indicator'),				category = _('General')},

-- Communications
{combos = {{key = 'E', reformers = {'LWin'}}},					down = iCommandPlaneDoAndHome,					name = _('Flight - Complete mission and RTB'),		category = _('Communications')},
{																down = iCommandPlaneReturnToBase,				name = _('Flight - RTB'),							category = _('Communications')},
{combos = {{key = 'R', reformers = {'LWin'}}},					down = iCommandPlaneDoAndBack,					name = _('Flight - Complete mission and rejoin'),	category = _('Communications')},
{combos = {{key = 'T', reformers = {'LWin'}}},					down = iCommandPlaneFormation,					name = _('Toggle Formation'),						category = _('Communications')},
{combos = {{key = 'Y', reformers = {'LWin'}}},					down = iCommandPlaneJoinUp,						name = _('Join Up Formation'),						category = _('Communications')},
{combos = {{key = 'Q', reformers = {'LWin'}}},					down = iCommandPlaneAttackMyTarget,				name = _('Attack My Target'),						category = _('Communications')},
{combos = {{key = 'W', reformers = {'LWin'}}},					down = iCommandPlaneCoverMySix,					name = _('Cover Me'),								category = _('Communications')},
{combos = {{key = 'U', reformers = {'LWin'}}},					down = iCommandAWACSHomeBearing,				name = _('Request AWACS Home Airbase'),				category = _('Communications')},
{combos = {{key = 'O', reformers = {'LWin'}}},					down = iCommandAWACSBanditBearing,				name = _('Request AWACS Bogey Dope'),				category = _('Communications'), features = {"AWACS Bogey Dope"}},
{combos = {{key = 'G', reformers = {'LWin'}}},					down = iCommandPlane_EngageGroundTargets,		name = _('Flight - Attack ground targets'),			category = _('Communications')},
{combos = {{key = 'D', reformers = {'LWin'}}},					down = iCommandPlane_EngageAirDefenses,			name = _('Flight - Attack air defenses'),			category = _('Communications')},
{combos = {{key = 'B', reformers = {'LWin'}}},					down = iCommandPlane_EngageBandits,				name = _('Flight - Engage Bandits'),				category = _('Communications')},
{combos = {{key = '\\'}},										down = iCommandToggleCommandMenu,				name = _('Communication menu'),						category = _('Communications')},
{combos = {{key = '\\', reformers = {'LShift'}}},				down = ICommandSwitchDialog,					name = _('Switch dialog'),							category = _('Communications')},
{combos = {{key = '\\', reformers = {'LCtrl'}}},				down = ICommandSwitchToCommonDialog,			name = _('Switch to main menu'),					category = _('Communications')},

-- View
{combos = {{key = 'Num4'}},								pressed = iCommandViewLeftSlow,			up = iCommandViewStopSlow,				name = _('View Left slow'),										category = _('View')},
{combos = {{key = 'Num6'}},								pressed = iCommandViewRightSlow,		up = iCommandViewStopSlow,				name = _('View Right slow'),									category = _('View')},
{combos = {{key = 'Num8'}},								pressed = iCommandViewUpSlow,			up = iCommandViewStopSlow,				name = _('View Up slow'),										category = _('View')},
{combos = {{key = 'Num2'}},								pressed = iCommandViewDownSlow,			up = iCommandViewStopSlow,				name = _('View Down slow'),										category = _('View')},
{combos = {{key = 'Num9'}},								pressed = iCommandViewUpRightSlow,		up = iCommandViewStopSlow,				name = _('View Up Right slow'),									category = _('View')},
{combos = {{key = 'Num3'}},								pressed = iCommandViewDownRightSlow,	up = iCommandViewStopSlow,				name = _('View Down Right slow'),								category = _('View')},
{combos = {{key = 'Num1'}},								pressed = iCommandViewDownLeftSlow,		up = iCommandViewStopSlow,				name = _('View Down Left slow'),								category = _('View')},
{combos = {{key = 'Num7'}},								pressed = iCommandViewUpLeftSlow,		up = iCommandViewStopSlow,				name = _('View Up Left slow'),									category = _('View')},
{combos = {{key = 'Num5'}},								pressed = iCommandViewCenter,													name = _('View Center'),										category = _('View')},

{combos = {{key = 'Num*'}},								pressed = iCommandViewForwardSlow,		up = iCommandViewForwardSlowStop,		name = _('Zoom in slow'),										category = _('View')},
{combos = {{key = 'Num/'}},								pressed = iCommandViewBackSlow,			up = iCommandViewBackSlowStop,			name = _('Zoom out slow'),										category = _('View')},
{combos = {{key = 'NumEnter'}},							down = iCommandViewAngleDefault,												name = _('Zoom normal'),										category = _('View')},
{combos = {{key = 'Num*', reformers = {'RCtrl'}}},		pressed = iCommandViewExternalZoomIn,	up = iCommandViewExternalZoomInStop,	name = _('Zoom external in'),									category = _('View')},
{combos = {{key = 'Num/', reformers = {'RCtrl'}}},		pressed = iCommandViewExternalZoomOut,	up = iCommandViewExternalZoomOutStop,	name = _('Zoom external out'),									category = _('View')},
{combos = {{key = 'NumEnter', reformers = {'RCtrl'}}},	down = iCommandViewExternalZoomDefault,											name = _('Zoom external normal'),								category = _('View')},
{combos = {{key = 'Num*', reformers = {'LAlt'}}},		down = iCommandViewSpeedUp,														name = _('F11 Camera moving forward'),							category = _('View')},
{combos = {{key = 'Num/', reformers = {'LAlt'}}},		down = iCommandViewSlowDown,													name = _('F11 Camera moving backward'),							category = _('View')},

{combos = {{key = 'F1'}},								down = iCommandViewCockpit, up = Position_Control.Internal,						name = _('F1 Cockpit view'),									category = _('View')},
{combos = {{key = 'F1', reformers = {'LCtrl'}}},		down = iCommandNaturalViewCockpitIn,											name = _('F1 Natural head movement view'),						category = _('View')},
{combos = {{key = 'F1', reformers = {'LAlt'}}},			down = iCommandViewHUDOnlyOnOff, up = Position_Control.Internal,				name = _('F1 HUD only view switch'),							category = _('View')},
{combos = {{key = 'F2'}},								down = iCommandViewAir, up = Position_Control.External,							name = _('F2 Aircraft view'),									category = _('View')},
{combos = {{key = 'F2', reformers = {'LCtrl'}}},		down = iCommandViewMe, up = Position_Control.External,							name = _('F2 View own aircraft'),								category = _('View')},
{combos = {{key = 'F2', reformers = {'RAlt'}}},			down = iCommandViewFromTo,														name = _('F2 Toggle camera position'),							category = _('View')},
{combos = {{key = 'F2', reformers = {'LAlt'}}},			down = iCommandViewLocal,														name = _('F2 Toggle local camera control'),						category = _('View')},
{combos = {{key = 'F3'}},								down = iCommandViewTower, up = Position_Control.External,						name = _('F3 Fly-By view'),										category = _('View')},
{combos = {{key = 'F3', reformers = {'LCtrl'}}},		down = iCommandViewTowerJump,													name = _('F3 Fly-By jump view'),								category = _('View')},
{combos = {{key = 'F4'}},								down = iCommandViewRear, up = Position_Control.External,						name = _('F4 Look back view'),									category = _('View')},
{combos = {{key = 'F4', reformers = {'LCtrl'}}},		down = iCommandViewChase, up = Position_Control.External,						name = _('F4 Chase view'),										category = _('View')},
{combos = {{key = 'F4', reformers = {'LShift'}}},		down = iCommandViewChaseArcade, up = Position_Control.External,					name = _('F4 Arcade Chase view'),								category = _('View')},
{combos = {{key = 'F5'}},								down = iCommandViewFight,														name = _('F5 nearest AC view'),									category = _('View')},
{combos = {{key = 'F5', reformers = {'LCtrl'}}},		down = iCommandViewFightGround,													name = _('F5 Ground hostile view'),								category = _('View')},
{combos = {{key = 'F6'}},								down = iCommandViewWeapons,														name = _('F6 Released weapon view'),							category = _('View')},
{combos = {{key = 'F6', reformers = {'LCtrl'}}},		down = iCommandViewWeaponAndTarget,												name = _('F6 Weapon to target view'),							category = _('View')},
{combos = {{key = 'F7'}},								down = iCommandViewGround,														name = _('F7 Ground unit view'),								category = _('View')},
{combos = {{key = 'F8'}},								down = iCommandViewTargets,														name = _('F8 Target view'),										category = _('View')},
{combos = {{key = 'F8', reformers = {'RCtrl'}}},		down = iCommandViewTargetType,													name = _('F8 Player targets/All targets filter'),				category = _('View')},
{combos = {{key = 'F9'}},								down = iCommandViewNavy,														name = _('F9 Ship view'),										category = _('View')},
{combos = {{key = 'F9', reformers = {'LAlt'}}},			down = iCommandViewLndgOfficer,													name = _('F9 Landing signal officer view'),						category = _('View')},
{combos = {{key = 'F10'}},								down = iCommandViewAWACS, up = Position_Control.F10_Map,						name = _('F10 Theater map view'),								category = _('View')},
{combos = {{key = 'F10', reformers = {'LCtrl'}}},		down = iCommandViewAWACSJump,													name = _('F10 Jump to theater map view over current point'),	category = _('View')},
{combos = {{key = 'F11'}},								down = iCommandViewFree,														name = _('F11 Airport free camera'),							category = _('View')},
{combos = {{key = 'F11', reformers = {'LCtrl'}}},		down = iCommandViewFreeJump, up = Position_Control.External,					name = _('F11 Jump to free camera'),							category = _('View')},
{combos = {{key = 'F12'}},								down = iCommandViewStatic,														name = _('F12 Static object view'),								category = _('View')},
{combos = {{key = 'F12', reformers = {'LCtrl'}}},		down = iCommandViewMirage,														name = _('F12 Civil traffic view'),								category = _('View')},
{combos = {{key = 'F12', reformers = {'LShift'}}},		down = iCommandViewLocomotivesToggle,											name = _('F12 Trains/cars toggle'),								category = _('View')},
{combos = {{key = 'F1', reformers = {'LWin'}}},			down = iCommandViewPitHeadOnOff,												name = _('F1 Head shift movement on / off'),					category = _('View')},

{combos = {{key = ']', reformers = {'LShift'}}},		down = iCommandViewFastKeyboard,												name = _('Keyboard Rate Fast'),									category = _('View')},
{combos = {{key = ']', reformers = {'LCtrl'}}},			down = iCommandViewSlowKeyboard,												name = _('Keyboard Rate Slow'),									category = _('View')},
{combos = {{key = ']', reformers = {'LAlt'}}},			down = iCommandViewNormalKeyboard,												name = _('Keyboard Rate Normal'),								category = _('View')},
{combos = {{key = '[', reformers = {'LShift'}}},		down = iCommandViewFastMouse,													name = _('Mouse Rate Fast'),									category = _('View')},
{combos = {{key = '[', reformers = {'LCtrl'}}},			down = iCommandViewSlowMouse,													name = _('Mouse Rate Slow'),									category = _('View')},
{combos = {{key = '[', reformers = {'LAlt'}}},			down = iCommandViewNormalMouse,													name = _('Mouse Rate Normal'),									category = _('View')},

-- Cockpit view
{combos = {{key = 'L', reformers = {'LAlt'}}},				down = 3256,	cockpit_device_id = 0,	value_down = 1.0,						name = _('Flashlight'),						category = _('View Cockpit')},

{combos = {{key = 'Num0'}},									down = iCommandViewTempCockpitOn,		up = iCommandViewTempCockpitOff,		name = _('Cockpit panel view in'),			category = _('View Cockpit')},
{combos = {{key = 'Num0', reformers = {'RCtrl'}}},			down = iCommandViewTempCockpitToggle,											name = _('Cockpit panel view toggle'),		category = _('View Cockpit')},
--// Save current cockpit camera angles for fast numpad jumps
{combos = {{key = 'Num0', reformers = {'RAlt'}}},			down = iCommandViewSaveAngles,													name = _('Save Cockpit Angles'),			category = _('View Cockpit')},
{combos = {{key = 'Num8', reformers = {'RShift'}}},			pressed = iCommandViewUp,					up = iCommandViewStop,				name = _('View up'),						category = _('View Cockpit')},
{combos = {{key = 'Num2', reformers = {'RShift'}}},			pressed = iCommandViewDown,					up = iCommandViewStop,				name = _('View down'),						category = _('View Cockpit')},
{combos = {{key = 'Num4', reformers = {'RShift'}}},			pressed = iCommandViewLeft,					up = iCommandViewStop,				name = _('View left'),						category = _('View Cockpit')},
{combos = {{key = 'Num6', reformers = {'RShift'}}},			pressed = iCommandViewRight,				up = iCommandViewStop,				name = _('View right'),						category = _('View Cockpit')},
{combos = {{key = 'Num9', reformers = {'RShift'}}},			pressed = iCommandViewUpRight,				up = iCommandViewStop,				name = _('View up right'),					category = _('View Cockpit')},
{combos = {{key = 'Num3', reformers = {'RShift'}}},			pressed = iCommandViewDownRight,			up = iCommandViewStop,				name = _('View down right'),				category = _('View Cockpit')},
{combos = {{key = 'Num1', reformers = {'RShift'}}},			pressed = iCommandViewDownLeft,				up = iCommandViewStop,				name = _('View down left'),					category = _('View Cockpit')},
{combos = {{key = 'Num7', reformers = {'RShift'}}},			pressed = iCommandViewUpLeft,				up = iCommandViewStop,				name = _('View up left'),					category = _('View Cockpit')},

-- Cockpit Camera Motion (Передвижение камеры в кабине)
{combos = {{key = 'Num8', reformers = {'RCtrl','RShift'}}},	pressed = iCommandViewPitCameraMoveUp,		up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Up'),			category = _('View Cockpit')},
{combos = {{key = 'Num2', reformers = {'RCtrl','RShift'}}},	pressed = iCommandViewPitCameraMoveDown,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Down'),		category = _('View Cockpit')},
{combos = {{key = 'Num4', reformers = {'RCtrl','RShift'}}},	pressed = iCommandViewPitCameraMoveLeft,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Left'),		category = _('View Cockpit')},
{combos = {{key = 'Num6', reformers = {'RCtrl','RShift'}}},	pressed = iCommandViewPitCameraMoveRight,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Right'),		category = _('View Cockpit')},
{combos = {{key = 'Num*', reformers = {'RCtrl','RShift'}}},	pressed = iCommandViewPitCameraMoveForward,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Forward'),	category = _('View Cockpit')},
{combos = {{key = 'Num/', reformers = {'RCtrl','RShift'}}, {key = 'Num-', reformers = {'RCtrl','RShift'}}},	pressed = iCommandViewPitCameraMoveBack,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Back'),	category = _('View Cockpit')},
{combos = {{key = 'Num5', reformers = {'RCtrl','RShift'}}},	down = iCommandViewPitCameraMoveCenter,											name = _('Cockpit Camera Move Center'),		category = _('View Cockpit')},

{combos = {{key = 'Num8', reformers = {'RCtrl'}}},			down = iCommandViewCameraUp,				up = iCommandViewCameraCenter,		name = _('Glance up'),						category = _('View Cockpit')},
{combos = {{key = 'Num2', reformers = {'RCtrl'}}},			down = iCommandViewCameraDown,				up = iCommandViewCameraCenter,		name = _('Glance down'),					category = _('View Cockpit')},
{combos = {{key = 'Num4', reformers = {'RCtrl'}}},			down = iCommandViewCameraLeft,				up = iCommandViewCameraCenter,		name = _('Glance left'),					category = _('View Cockpit')},
{combos = {{key = 'Num6', reformers = {'RCtrl'}}},			down = iCommandViewCameraRight,				up = iCommandViewCameraCenter,		name = _('Glance right'),					category = _('View Cockpit')},
{combos = {{key = 'Num7', reformers = {'RCtrl'}}},			down = iCommandViewCameraUpLeft,			up = iCommandViewCameraCenter,		name = _('Glance up-left'),					category = _('View Cockpit')},
{combos = {{key = 'Num1', reformers = {'RCtrl'}}},			down = iCommandViewCameraDownLeft,			up = iCommandViewCameraCenter,		name = _('Glance down-left'),				category = _('View Cockpit')},
{combos = {{key = 'Num9', reformers = {'RCtrl'}}},			down = iCommandViewCameraUpRight,			up = iCommandViewCameraCenter,		name = _('Glance up-right'),				category = _('View Cockpit')},
{combos = {{key = 'Num3', reformers = {'RCtrl'}}},			down = iCommandViewCameraDownRight,			up = iCommandViewCameraCenter,		name = _('Glance down-right'),				category = _('View Cockpit')},
{combos = {{key = 'Z', reformers = {'LAlt','LShift'}}},		down = iCommandViewPanToggle,													name = _('Camera pan mode toggle'),			category = _('View Cockpit')},

{combos = {{key = 'Num8', reformers = {'RAlt'}}},			down = iCommandViewCameraUpSlow,												name = _('Camera snap view up'),			category = _('View Cockpit')},
{combos = {{key = 'Num2', reformers = {'RAlt'}}},			down = iCommandViewCameraDownSlow,												name = _('Camera snap view down'),			category = _('View Cockpit')},
{combos = {{key = 'Num4', reformers = {'RAlt'}}},			down = iCommandViewCameraLeftSlow,												name = _('Camera snap view left'),			category = _('View Cockpit')},
{combos = {{key = 'Num6', reformers = {'RAlt'}}},			down = iCommandViewCameraRightSlow,												name = _('Camera snap view right'),			category = _('View Cockpit')},
{combos = {{key = 'Num7', reformers = {'RAlt'}}},			down = iCommandViewCameraUpLeftSlow,											name = _('Camera snap view up-left'),		category = _('View Cockpit')},
{combos = {{key = 'Num1', reformers = {'RAlt'}}},			down = iCommandViewCameraDownLeftSlow,											name = _('Camera snap view down-left'),		category = _('View Cockpit')},
{combos = {{key = 'Num9', reformers = {'RAlt'}}},			down = iCommandViewCameraUpRightSlow,											name = _('Camera snap view up-right'),		category = _('View Cockpit')},
{combos = {{key = 'Num3', reformers = {'RAlt'}}},			down = iCommandViewCameraDownRightSlow,											name = _('Camera snap view down-right'),	category = _('View Cockpit')},
{combos = {{key = 'Num5', reformers = {'RShift'}}},			down = iCommandViewCameraCenter,												name = _('Center Camera View'),				category = _('View Cockpit')},
{combos = {{key = 'Num5', reformers = {'RCtrl'}}},			down = iCommandViewCameraReturn,												name = _('Return Camera'),					category = _('View Cockpit')},
{combos = {{key = 'Num5', reformers = {'RAlt'}}},			down = iCommandViewCameraBaseReturn,											name = _('Return Camera Base'),				category = _('View Cockpit')},

{combos = {{key = 'Num0', reformers = {'LWin'}}},			down = iCommandViewSnapView0,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  0'),			category = _('View Cockpit')},
{combos = {{key = 'Num1', reformers = {'LWin'}}},			down = iCommandViewSnapView1,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  1'),			category = _('View Cockpit')},
{combos = {{key = 'Num2', reformers = {'LWin'}}},			down = iCommandViewSnapView2,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  2'),			category = _('View Cockpit')},
{combos = {{key = 'Num3', reformers = {'LWin'}}},			down = iCommandViewSnapView3,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  3'),			category = _('View Cockpit')},
{combos = {{key = 'Num4', reformers = {'LWin'}}},			down = iCommandViewSnapView4,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  4'),			category = _('View Cockpit')},
{combos = {{key = 'Num5', reformers = {'LWin'}}},			down = iCommandViewSnapView5,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  5'),			category = _('View Cockpit')},
{combos = {{key = 'Num6', reformers = {'LWin'}}},			down = iCommandViewSnapView6,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  6'),			category = _('View Cockpit')},
{combos = {{key = 'Num7', reformers = {'LWin'}}},			down = iCommandViewSnapView7,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  7'),			category = _('View Cockpit')},
{combos = {{key = 'Num8', reformers = {'LWin'}}},			down = iCommandViewSnapView8,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  8'),			category = _('View Cockpit')},
{combos = {{key = 'Num9', reformers = {'LWin'}}},			down = iCommandViewSnapView9,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  9'),			category = _('View Cockpit')},

{combos = {{key = 'Num*', reformers = {'RShift'}}},			pressed = iCommandViewForward,				up = iCommandViewForwardStop,		name = _('Zoom in'),						category = _('View Cockpit')},
{combos = {{key = 'Num/', reformers = {'RShift'}}},			pressed = iCommandViewBack,					up = iCommandViewBackStop,			name = _('Zoom out'),						category = _('View Cockpit')},

-- Extended view
{combos = {{key = 'J', reformers = {'LShift'}}},			down = iCommandViewCameraJiggle,	name = _('Camera jiggle toggle'),					category = _('View Extended'), features = {"Camera jiggle"}},
{combos = {{key = 'K', reformers = {'LAlt'}}},				down = iCommandViewKeepTerrain,		name = _('Keep terrain camera altitude'),			category = _('View Extended')},
{combos = {{key = 'Home', reformers = {'RCtrl','RShift'}}},	down = iCommandViewFriends,			name = _('View friends mode'),						category = _('View Extended')},
{combos = {{key = 'End', reformers = {'RCtrl','RShift'}}},	down = iCommandViewEnemies,			name = _('View enemies mode'),						category = _('View Extended')},
{combos = {{key = 'Delete', reformers = {'RCtrl'}}},		down = iCommandViewAll,				name = _('View all mode'),							category = _('View Extended')},
{combos = {{key = 'Num+', reformers = {'RCtrl'}}},			down = iCommandViewPlus,			name = _('Toggle tracking launched weapon'),		category = _('View Extended')},
{combos = {{key = 'PageDown', reformers = {'LCtrl'}}},		down = iCommandViewSwitchForward,	name = _('Objects switching direction forward '),	category = _('View Extended')},
{combos = {{key = 'PageUp', reformers = {'LCtrl'}}},		down = iCommandViewSwitchReverse,	name = _('Objects switching direction reverse '),	category = _('View Extended')},
{combos = {{key = 'Delete', reformers = {'LAlt'}}},			down = iCommandViewObjectIgnore,	name = _('Object exclude '),						category = _('View Extended')},
{combos = {{key = 'Insert', reformers = {'LAlt'}}},			down = iCommandViewObjectsAll,		name = _('Objects all excluded - include'),			category = _('View Extended')},

-- Padlock
{combos = {{key = 'Num.'}},							down = iCommandViewLock,				name = _('Lock View (cycle padlock)'),	category = _('View Padlock')},
{combos = {{key = 'NumLock'}},						down = iCommandViewUnlock,				name = _('Unlock view (stop padlock)'),	category = _('View Padlock')},
{combos = {{key = 'Num.', reformers = {'RShift'}}},	down = iCommandAllMissilePadlock,		name = _('All missiles padlock'),		category = _('View Padlock')},
{combos = {{key = 'Num.', reformers = {'RAlt'}}},	down = iCommandThreatMissilePadlock,	name = _('Threat missile padlock'),		category = _('View Padlock')},
{combos = {{key = 'Num.', reformers = {'RCtrl'}}},	down = iCommandViewTerrainLock,			name = _('Lock terrain view'),			category = _('View Padlock')},

-- Labels
{combos = {{key = 'F10', reformers = {'LShift'}}},	down = iCommandMarkerState,				name = _('All Labels'),					category = _('Labels')},
{combos = {{key = 'F2', reformers = {'LShift'}}},	down = iCommandMarkerStatePlane,		name = _('Aircraft Labels'),			category = _('Labels')},
{combos = {{key = 'F6', reformers = {'LShift'}}},	down = iCommandMarkerStateRocket,		name = _('Missile Labels'),				category = _('Labels')},
{combos = {{key = 'F9', reformers = {'LShift'}}},	down = iCommandMarkerStateShip,			name = _('Vehicle & Ship Labels'),		category = _('Labels')},

--Kneeboard
{combos = {{key = 'K', reformers = {'RShift'}}},	down = iCommandPlaneShowKneeboard,																				name = _('Kneeboard ON/OFF'),						category = _('Kneeboard')},
{combos = {{key = 'K'}},							down = iCommandPlaneShowKneeboard,	up = iCommandPlaneShowKneeboard,	value_down = 1.0,	value_up = -1.0,	name = _('Kneeboard glance view'),					category = _('Kneeboard')},
{combos = {{key = ']'}},							down = 3001,	cockpit_device_id = kneeboard_id,						value_down = 1.0,						name = _('Kneeboard Next Page'),					category = _('Kneeboard')},
{combos = {{key = '['}},							down = 3002,	cockpit_device_id = kneeboard_id,						value_down = 1.0,						name = _('Kneeboard Previous Page'),				category = _('Kneeboard')},
{combos = {{key = 'K', reformers = {'RCtrl'}}},		down = 3003,	cockpit_device_id = kneeboard_id,						value_down = 1.0,						name = _('Kneeboard current position mark point'),	category = _('Kneeboard')},
--shortcuts navigation
{													down = 3004,	cockpit_device_id = kneeboard_id,						value_down =  1.0,						name = _('Kneeboard Make Shortcut'),				category = _('Kneeboard')},
{													down = 3005,	cockpit_device_id = kneeboard_id,						value_down =  1.0,						name = _('Kneeboard Next Shortcut'),				category = _('Kneeboard')},
{													down = 3005,	cockpit_device_id = kneeboard_id,						value_down = -1.0,						name = _('Kneeboard Previous Shortcut'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 0,							name = _('Kneeboard Jump To Shortcut  1'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 1,							name = _('Kneeboard Jump To Shortcut  2'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 2,							name = _('Kneeboard Jump To Shortcut  3'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 3,							name = _('Kneeboard Jump To Shortcut  4'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 4,							name = _('Kneeboard Jump To Shortcut  5'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 5,							name = _('Kneeboard Jump To Shortcut  6'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 6,							name = _('Kneeboard Jump To Shortcut  7'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 7,							name = _('Kneeboard Jump To Shortcut  8'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 8,							name = _('Kneeboard Jump To Shortcut  9'),			category = _('Kneeboard')},
{													down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 9,							name = _('Kneeboard Jump To Shortcut 10'),			category = _('Kneeboard')},



},
}