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

local kneeboard_id = 100
if devices and devices.KNEEBOARD then
   kneeboard_id = devices.KNEEBOARD
end

return {

keyCommands = {

--Station Control
{down = General_Packet_Send.NetCrewRequestControl,	name = _('Request Aircraft Control'),	category = _('Station Control')},
{down = iCommandViewCockpitChangeSeat, value_down = 1, up = Position_Control.Pilot_Seat, name = _('Captain Seat'),	category = _('Station Control')},
{down = iCommandViewCockpitChangeSeat, value_down = 2, up = Position_Control.Copilot_Seat, name = _('Copilot Seat'),	category = _('Station Control')},
{down = Position_Control.Loadmaster_Station, name = _('Loadmaster Station'),	category = _('Station Control')},
{down = Position_Control.CargoRamp_Station, name = _('Cargo Ramp Station'),	category = _('Station Control')},
{down = Position_Control.Cannon_Target_Station, name = _('Cannon Target Station'),	category = _('Station Control')},

--Cargo Hold
{down = MISCELLANEOUS.CargoDoorRampClose, name = _('Cargo Door/Ramp Close'), category = _('Cargo Hold')},
{down = MISCELLANEOUS.CargoDoorRampOpen, name = _('Cargo Door/Ramp Open'), category = _('Cargo Hold')},
{down = MISCELLANEOUS.Crew_Entrance_Door_Toggle, name = _('Crew Entrance Door Open/Close'), category = _('Cargo Hold')},
{down = MISCELLANEOUS.Paratroop_Doors_Toggle, name = _('Paratroop Doors Open/Close'), category = _('Cargo Hold')},
{down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_Locks_Release_Keyb, name = _('Cargo Deploy ALL (Jettison Locks Release)'), category = _('Cargo Hold')},
{down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_FWD_Locks_Release_Keyb, name = _('Cargo Deploy FWD (Jettison Lock Release)'), category = _('Cargo Hold')},
{down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_MID_Locks_Release_Keyb, name = _('Cargo Deploy MID (Jettison Lock Release)'), category = _('Cargo Hold')},
{down = RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jettison_AFT_Locks_Release_Keyb, name = _('Cargo Deploy AFT (Jettison Lock Release)'), category = _('Cargo Hold')},

-- Trigger Rocket Assist
{down = MISCELLANEOUS.RocketAssistTakeoff, name = _('Trigger Rocket Assisted Takeoff'), category = _('Rocket Assist')},

-- Flightdeck
{down = MISCELLANEOUS.Flightdeck_Windows_Toggle, name = _('Flightdeck Windows Toggle Open/Close'), category = _('Flightdeck')},
{down = ICS_PANEL.ICS_Silence_Keyb, name = _('Silence Alarms Toggle'), category = _('Flightdeck')},

-- Ground Control
{down = MISCELLANEOUS.BrakesBothOn, up = MISCELLANEOUS.BrakesBothOff, name = _('Left and Right Toe Brakes On/Off'), category = _('Ground Control')},
{pressed = MISCELLANEOUS.NWSLeft, up = MISCELLANEOUS.NWSLeftCenter, name = _('Nose Wheel Steering Left'), category = _('Ground Control')},
{pressed = MISCELLANEOUS.NWSRight, up = MISCELLANEOUS.NWSRightCenter, name = _('Nose Wheel Steering Right'), category = _('Ground Control')},
{down = MISCELLANEOUS.Park_Brake_Toggle, name = _('Park Brake Toggle'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.GearToggle, name = _('Landing Gear Toggle'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.GearUp, name = _('Landing Gear Up'), category = _('Ground Control')},
{down = LANDING_GEAR_LIGHTS_PANEL.GearDown, name = _('Landing Gear Down'), category = _('Ground Control')},

--Engine Control Panel
-- {down = ENGINE_START_PANEL.Engine1_Start, name = _('Engines 1 Start'), category = _('Engine Control Panel')},
-- {down = ENGINE_START_PANEL.Engine1_Stop, name = _('Engine 1 Stop'), category = _('Engine Control Panel')},
-- {down = ENGINE_START_PANEL.Engine2_Start, name = _('Engines 2 Start'), category = _('Engine Control Panel')},
-- {down = ENGINE_START_PANEL.Engine2_Stop, name = _('Engine 2 Stop'), category = _('Engine Control Panel')},
-- {down = ENGINE_START_PANEL.Engine3_Start, name = _('Engine 3 Start'), category = _('Engine Control Panel')},
-- {down = ENGINE_START_PANEL.Engine3_Stop, name = _('Engine 3 Stop'), category = _('Engine Control Panel')},
-- {down = ENGINE_START_PANEL.Engine4_Start, name = _('Engine 4 Start'), category = _('Engine Control Panel')},
-- {down = ENGINE_START_PANEL.Engine4_Stop, name = _('Engine 4 Stop'), category = _('Engine Control Panel')},

--APU
-- {down = APU_PANEL.APU_Start, name = _('APU Start'), category = _('APU Panel')},
-- {down = APU_PANEL.APU_Stop, name = _('APU Stop'), category = _('APU Panel')},


-- Navigation
{down = CURSOR.Manual_Cursor, name = _('Manual Cursor'), category = _('Common Cursor Control')},
{down = CURSOR.Cursor_Reset, name = _('Cursor Reset'), category = _('Common Cursor Control')},
{down = CURSOR.Ground_Cursor, name = _('Ground Cursor'), category = _('Common Cursor Control')},
{down = CURSOR.Computer_Cursor, name = _('Computer Cursor'), category = _('Common Cursor Control')},
{pressed = CURSOR.Cursor_Forward, up = CURSOR.Cursor_Release, name = _('Cursor Forward'), category = _('Common Cursor Control')},
{pressed = CURSOR.Cursor_Aft, up = CURSOR.Cursor_Release, name = _('Cursor Aft'), category = _('Common Cursor Control')},
{pressed = CURSOR.Cursor_Left, up = CURSOR.Cursor_Release, name = _('Cursor Left'), category = _('Common Cursor Control')},
{pressed = CURSOR.Cursor_Right, up = CURSOR.Cursor_Release, name = _('Cursor Right'), category = _('Common Cursor Control')},
{down = CURSOR.Cursor_Next_Target, name = _('Cursor Next Target'), category = _('Common Cursor Control')},
{down = CURSOR.Cursor_Previous_Target, name = _('Cursor Previous Target'), category = _('Common Cursor Control')},
{down = CURSOR.Cursor_Insert, name = _('Cursor Insert/Update'), category = _('Common Cursor Control')},

-- Radio
{down = ICS_PANEL.Radio_PTT_Keyb, name = _('Radio Push to Talk (PTT)'), category = _('Radio')},

-- Autopilot
{down = Automatic_Flight_Control_System_Panel.AFCS_Autopilot_On, name = _('AP Engage (not realistic)') , category = _('Autopilot')},
{down = Automatic_Flight_Control_System_Panel.AFCS_Autopilot_Off, name = _('AP: 1st press - disengage, 2nd press - AP DSNG annunciation off') , category = _('Autopilot')},
{pressed = Automatic_Flight_Control_System_Panel.AFCS_Vert_Ref_Sync_Control_On, up = Automatic_Flight_Control_System_Panel.AFCS_Vert_Ref_Sync_Control_Off, name = _('Vertical Reference Synchronization Control') , category = _('Autopilot')},

-- Flight Control
{pressed = TRIM.Up, up = TRIM.Stop, name = _('Trim: Nose Up'), category = _('Flight Control')},
{pressed = TRIM.Down, up = TRIM.Stop, name = _('Trim: Nose Down'), category = _('Flight Control')},
{pressed = TRIM.Left, up = TRIM.Stop, name = _('Trim: Left Wing Down'), category = _('Flight Control')},
{pressed = TRIM.Right, up = TRIM.Stop, name = _('Trim: Right Wing Down'), category = _('Flight Control')},
{pressed = TRIM.RudderLeft, up = TRIM.Stop, name = _('Trim: Rudder Left'), category = _('Flight Control')},
{pressed = TRIM.RudderRight, up = TRIM.Stop, name = _('Trim: Rudder Right'), category = _('Flight Control')},
{down = AERIAL_DELIVERY_PANEL.Air_Deflector_Toggle, name = _('Paratroop Air Deflector Toggle'), category = _('Flight Control')},
{down = AERIAL_DELIVERY_PANEL.Air_Deflector_Extend, name = _('Paratroop Air Deflector Extend'), category = _('Flight Control')},
{down = AERIAL_DELIVERY_PANEL.Air_Deflector_Retract, name = _('Paratroop Air Deflector Retract'), category = _('Flight Control')},
{pressed = FLIGHT_CONTROL.PlaneUpStart, up = FLIGHT_CONTROL.PlaneUpStop, name = _('Aircraft Pitch Up'), category = _('Flight Control')},
{pressed = FLIGHT_CONTROL.PlaneDownStart, up = FLIGHT_CONTROL.PlaneDownStop, name = _('Aircraft Pitch Down'), category = _('Flight Control')},
{pressed = FLIGHT_CONTROL.PlaneLeftStart, up = FLIGHT_CONTROL.PlaneLeftStop, name = _('Aircraft Bank Left'), category = _('Flight Control')},
{pressed = FLIGHT_CONTROL.PlaneRightStart, up = FLIGHT_CONTROL.PlaneRightStop, name = _('Aircraft Bank Right'), category = _('Flight Control')},
{pressed = FLIGHT_CONTROL.PlaneLeftRudderStart, up = FLIGHT_CONTROL.PlaneLeftRudderStop, name = _('Aircraft Rudder Left'), category = _('Flight Control')},
{pressed = FLIGHT_CONTROL.PlaneRightRudderStart, up = FLIGHT_CONTROL.PlaneRightRudderStop, name = _('Aircraft Rudder Right'), category = _('Flight Control')},
{down = FLAPS.Down, name = _('Flaps Increment Down'), category = _('Flight Control')},
{down = FLAPS.Up, name = _('Flaps Increment Up'), category = _('Flight Control')},
{down = FLAPS.Zero_percent, name = _('Flaps 0%'), category = _('Flight Control')},
{down = FLAPS.Fifty_percent, name = _('Flaps 50%'), category = _('Flight Control')},
{down = FLAPS.Hunderd_percent, name = _('Flaps 100%'), category = _('Flight Control')},

-- Throttle Control
{down = THROTTLES.Beta, name = _('Throttles Beta Mode'), category = _('Throttle Control')},
{down = THROTTLES.Beta_Reverse, name = _('Throttles Beta Reverse'), category = _('Throttle Control')},
{down = THROTTLES.Full_Reverse, name = _('Throttles Flight to Beta Full Reverse'), category = _('Throttle Control')},
{down = THROTTLES.TO_Power_Toggle, name = _('Throttles Take-off power Toggle On/Off'), category = _('Throttle Control')},
{down = THROTTLES.TO_Power_On, name = _('Throttles Take-off power On'), category = _('Throttle Control')},
{down = THROTTLES.TO_Power_Off, name = _('Throttles Take-off power Off'), category = _('Throttle Control')},
{down = THROTTLES.ATCS_Autothrottle_Disengage, name = _('ATCS - Autothrottle disengage') , category = _('Throttle Control')},
{down = THROTTLES.Throttles_To_Idle, name = _('Throttles to Idle') , category = _('Throttle Control')},
{pressed = THROTTLES.ThrottlesIncrease, name = _('Throttles all Up'), category = _('Throttle Control')},
{pressed = THROTTLES.ThrottlesDecrease, name = _('Throttles all Down'), category = _('Throttle Control')},
{pressed = THROTTLES.Throttles12Increase, name = _('Throttles 1 and 2 Up'), category = _('Throttle Control')},
{pressed = THROTTLES.Throttles12Decrease, name = _('Throttles 1 and 2 Down'), category = _('Throttle Control')},
{pressed = THROTTLES.Throttles34Increase, name = _('Throttles 3 and 4 Up'), category = _('Throttle Control')},
{pressed = THROTTLES.Throttles34Decrease, name = _('Throttles 3 and 4 Down'), category = _('Throttle Control')},

--Night Vision Goggles
{down    = iCommandViewNightVisionGogglesOn, name = _('Night Vision Goggles')   , category = _('Night Vision Goggles')},
{pressed = iCommandPlane_Helmet_Brightess_Up  , name = _('Night Vision Goggles Gain Up')  , category = _('Night Vision Goggles')},
{pressed = iCommandPlane_Helmet_Brightess_Down, name = _('Night Vision Goggles Gain Down'), category = _('Night Vision Goggles')},
{down = DISPLAY_BRIGHTNESS_CONTROL.NightVisionGogglesOn, name = _('Cockpit Lights NVG Adapt') , category = _('Night Vision Goggles')},

--- Battle Station
{down = BATTLE_STATION_COMMANDS.Cannon_Release_Keyb_On, up = BATTLE_STATION_COMMANDS.Cannon_Release_Keyb_Off, name = _('Trigger: Fire Cannons'), category = _('Battle Station')},
{down = BATTLE_STATION_COMMANDS.Pylon_Release_Keyb_On, up = BATTLE_STATION_COMMANDS.Pylon_Release_Keyb_Off, name = _('Pickle: Launch Pylon Load'),	category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.TDC_FORWARD, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Forward'), category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.TDC_AFT, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Aft'), category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.TDC_LEFT, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Left'), category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.TDC_RIGHT, up = BATTLE_STATION_COMMANDS.TDC_RELEASE, name = _('TDC Right'), category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_UP, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew UP'), category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_DOWN, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew DOWN'), category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_LEFT, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew LEFT'), category = _('Battle Station')},
{pressed = BATTLE_STATION_COMMANDS.Cannon_Slew_RIGHT, up = BATTLE_STATION_COMMANDS.Cannon_Slew_RELEASE, name = _('Cannon Slew RIGHT'), category = _('Battle Station')},

--Counter measures
{down = iCommandPlaneDropFlareOnce, name = _('Countermeasures Flares Dispense'), category = _('Countermeasures') , features = {"Countermeasures"}},
{down = iCommandPlaneDropChaffOnce, name = _('Countermeasures Chaff Dispense'), category = _('Countermeasures') , features = {"Countermeasures"}},


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
-------------------------------------------------- common_joystick_binding
------------------------------------------------------------------------------------------------------------------------------
-- Debug
{	down = ICommandToggleConsole,					name = _('Toggle Console'),		category = _('Debug')},
{	down = iCommandMissionRestart,					name = _('Restart Mission'),						category = _('Debug')},

-- Gameplay
{	down = iCommandQuit,							name = _('End mission'),							category = _('General')},
{	down = iCommandBrakeGo,							name = _('Pause'),									category = _('General')},
{	down = iCommandAccelerate,						name = _('Time accelerate'),						category = _('General')},
{	down = iCommandDecelerate,						name = _('Time decelerate'),						category = _('General')},
{	down = iCommandNoAcceleration,					name = _('Time normal'),							category = _('General')},
{	down = iCommandScoresWindowToggle,				name = _('Score window'),							category = _('General')},

--{	down = iCommandChat,							name = _('Multiplayer chat - mode All'),			category = _('General')},
--{	down = iCommandFriendlyChat,					name = _('Multiplayer chat - mode Allies'),			category = _('General')},
--{	down = iCommandAllChat,							name = _('Chat read/write All'),					category = _('General')},
{	down = iCommandInfoOnOff,						name = _('Info bar view toggle'),					category = _('General')},
{	down = iCommandRecoverHuman,					name = _('Get new plane - respawn'),				category = _('General')},
{	down = iCommandPlaneJump,						name = _('Jump into selected aircraft'),			category = _('General')},
{	down = iCommandGraphicsFrameRate,				name = _('Frame rate counter - Service info'),		category = _('General')},
{	down = iCommandViewCoordinatesInLinearUnits,	name = _('Info bar coordinate units toggle'),		category = _('General')},
{	down = iCommandCockpitClickModeOnOff,			name = _('Clickable mouse cockpit mode On/Off'),	category = _('General')},
{	down = iCommandSoundOnOff,						name = _('Sound On/Off'),							category = _('General')},
{	down = iCommandMissionResourcesManagement,		name = _('Rearming and Refueling Window'),			category = _('General')},
{	down = iCommandViewBriefing,					name = _('View briefing on/off'),					category = _('General')},
{	down = iCommandActivePauseOnOff,				name = _('Active Pause'),							category = _('Cheat')},
{	down = iCommandPlane_ShowControls,				name = _('Show controls indicator'),				category = _('General')},

-- Communications
{	down = iCommandPlaneDoAndHome,					name = _('Flight - Complete mission and RTB'),		category = _('Communications')},
{	down = iCommandPlaneReturnToBase,				name = _('Flight - RTB'),							category = _('Communications')},
{	down = iCommandPlaneDoAndBack,					name = _('Flight - Complete mission and rejoin'),	category = _('Communications')},
{	down = iCommandPlaneFormation,					name = _('Toggle Formation'),						category = _('Communications')},
{	down = iCommandPlaneJoinUp,						name = _('Join Up Formation'),						category = _('Communications')},
{	down = iCommandPlaneAttackMyTarget,				name = _('Attack My Target'),						category = _('Communications')},
{	down = iCommandPlaneCoverMySix,					name = _('Cover Me'),								category = _('Communications')},
{	down = iCommandAWACSHomeBearing,				name = _('Request AWACS Home Airbase'),				category = _('Communications')},
{	down = iCommandAWACSBanditBearing,				name = _('Request AWACS Bogey Dope'),				category = _('Communications'), features = {"AWACS Bogey Dope"}},
{	down = iCommandPlane_EngageGroundTargets,		name = _('Flight - Attack ground targets'),			category = _('Communications')},
{	down = iCommandPlane_EngageAirDefenses,			name = _('Flight - Attack air defenses'),			category = _('Communications')},
{	down = iCommandPlane_EngageBandits,				name = _('Flight - Engage Bandits'),				category = _('Communications')},
{	down = iCommandToggleCommandMenu,				name = _('Communication menu'),						category = _('Communications')},
{	down = ICommandSwitchDialog,					name = _('Switch dialog'),							category = _('Communications')},
{	down = ICommandSwitchToCommonDialog,			name = _('Switch to main menu'),					category = _('Communications')},

-- View
{combos = {{key = 'JOY_BTN_POV1_L'}},		pressed = iCommandViewLeftSlow,			up = iCommandViewStopSlow,	name = _('View Left slow'),			category = _('View')},
{combos = {{key = 'JOY_BTN_POV1_R'}},		pressed = iCommandViewRightSlow,		up = iCommandViewStopSlow,	name = _('View Right slow'),		category = _('View')},
{combos = {{key = 'JOY_BTN_POV1_U'}},		pressed = iCommandViewUpSlow,			up = iCommandViewStopSlow,	name = _('View Up slow'),			category = _('View')},
{combos = {{key = 'JOY_BTN_POV1_D'}},		pressed = iCommandViewDownSlow,			up = iCommandViewStopSlow,	name = _('View Down slow'),			category = _('View')},
{combos = {{key = 'JOY_BTN_POV1_UR'}},		pressed = iCommandViewUpRightSlow,		up = iCommandViewStopSlow,	name = _('View Up Right slow'),		category = _('View')},
{combos = {{key = 'JOY_BTN_POV1_DR'}},		pressed = iCommandViewDownRightSlow,	up = iCommandViewStopSlow,	name = _('View Down Right slow'),	category = _('View')},
{combos = {{key = 'JOY_BTN_POV1_DL'}},		pressed = iCommandViewDownLeftSlow,		up = iCommandViewStopSlow,	name = _('View Down Left slow'),	category = _('View')},
{combos = {{key = 'JOY_BTN_POV1_UL'}},		pressed = iCommandViewUpLeftSlow,		up = iCommandViewStopSlow,	name = _('View Up Left slow'),		category = _('View')},
{											pressed = iCommandViewCenter,										name = _('View Center'),			category = _('View')},

{	pressed = iCommandViewForwardSlow,		up = iCommandViewForwardSlowStop,		name = _('Zoom in slow'),										category = _('View')},
{	pressed = iCommandViewBackSlow,			up = iCommandViewBackSlowStop,			name = _('Zoom out slow'),										category = _('View')},
{	down = iCommandViewAngleDefault,												name = _('Zoom normal'),										category = _('View')},
{	pressed = iCommandViewExternalZoomIn,	up = iCommandViewExternalZoomInStop,	name = _('Zoom external in'),									category = _('View')},
{	pressed = iCommandViewExternalZoomOut,	up = iCommandViewExternalZoomOutStop,	name = _('Zoom external out'),									category = _('View')},
{	down = iCommandViewExternalZoomDefault,											name = _('Zoom external normal'),								category = _('View')},
{	down = iCommandViewSpeedUp,														name = _('F11 Camera moving forward'),							category = _('View')},
{	down = iCommandViewSlowDown,													name = _('F11 Camera moving backward'),							category = _('View')},

{down = iCommandViewCockpit, up = Position_Control.Internal,						name = _('F1 Cockpit view'),									category = _('View')},
{down = iCommandNaturalViewCockpitIn,											name = _('F1 Natural head movement view'),						category = _('View')},
{down = iCommandViewHUDOnlyOnOff, up = Position_Control.Internal,				name = _('F1 HUD only view switch'),							category = _('View')},
{down = iCommandViewAir, up = Position_Control.External,							name = _('F2 Aircraft view'),									category = _('View')},
{down = iCommandViewMe, up = Position_Control.External,							name = _('F2 View own aircraft'),								category = _('View')},
{down = iCommandViewFromTo,														name = _('F2 Toggle camera position'),							category = _('View')},
{down = iCommandViewLocal,														name = _('F2 Toggle local camera control'),						category = _('View')},
{down = iCommandViewTower, up = Position_Control.External,						name = _('F3 Fly-By view'),										category = _('View')},
{down = iCommandViewTowerJump,													name = _('F3 Fly-By jump view'),								category = _('View')},
{down = iCommandViewRear, up = Position_Control.External,						name = _('F4 Look back view'),									category = _('View')},
{down = iCommandViewChase, up = Position_Control.External,						name = _('F4 Chase view'),										category = _('View')},
{down = iCommandViewChaseArcade, up = Position_Control.External,					name = _('F4 Arcade Chase view'),								category = _('View')},
{	down = iCommandViewFight,														name = _('F5 nearest AC view'),									category = _('View')},
{	down = iCommandViewFightGround,													name = _('F5 Ground hostile view'),								category = _('View')},
{	down = iCommandViewWeapons,														name = _('F6 Released weapon view'),							category = _('View')},
{	down = iCommandViewWeaponAndTarget,												name = _('F6 Weapon to target view'),							category = _('View')},
{	down = iCommandViewGround,														name = _('F7 Ground unit view'),								category = _('View')},
{	down = iCommandViewTargets,														name = _('F8 Target view'),										category = _('View')},
{	down = iCommandViewTargetType,													name = _('F8 Player targets/All targets filter'),				category = _('View')},
{	down = iCommandViewNavy,														name = _('F9 Ship view'),										category = _('View')},
{	down = iCommandViewLndgOfficer,													name = _('F9 Landing signal officer view'),						category = _('View')},
{	down = iCommandViewAWACS, up = Position_Control.F10_Map,						name = _('F10 Theater map view'),								category = _('View')},
{	down = iCommandViewAWACSJump,													name = _('F10 Jump to theater map view over current point'),	category = _('View')},
{	down = iCommandViewFree,														name = _('F11 Airport free camera'),							category = _('View')},
{down = iCommandViewFreeJump, up = Position_Control.External,					name = _('F11 Jump to free camera'),							category = _('View')},
{	down = iCommandViewStatic,														name = _('F12 Static object view'),								category = _('View')},
{	down = iCommandViewMirage,														name = _('F12 Civil traffic view'),								category = _('View')},
{	down = iCommandViewLocomotivesToggle,											name = _('F12 Trains/cars toggle'),								category = _('View')},
{	down = iCommandViewPitHeadOnOff,												name = _('F1 Head shift movement on / off'),					category = _('View')},

{	down = iCommandViewFastKeyboard,												name = _('Keyboard Rate Fast'),									category = _('View')},
{	down = iCommandViewSlowKeyboard,												name = _('Keyboard Rate Slow'),									category = _('View')},
{	down = iCommandViewNormalKeyboard,												name = _('Keyboard Rate Normal'),								category = _('View')},
{	down = iCommandViewFastMouse,													name = _('Mouse Rate Fast'),									category = _('View')},
{	down = iCommandViewSlowMouse,													name = _('Mouse Rate Slow'),									category = _('View')},
{	down = iCommandViewNormalMouse,													name = _('Mouse Rate Normal'),									category = _('View')},

-- Cockpit view
{	down = 3256,	cockpit_device_id = 0,	value_down = 1.0,						name = _('Flashlight'),						category = _('View Cockpit')},

{	down = iCommandViewTempCockpitOn,		up = iCommandViewTempCockpitOff,		name = _('Cockpit panel view in'),			category = _('View Cockpit')},
{	down = iCommandViewTempCockpitToggle,											name = _('Cockpit panel view toggle'),		category = _('View Cockpit')},
--// Save current cockpit camera angles for fast numpad jumps
{	down = iCommandViewSaveAngles,													name = _('Save Cockpit Angles'),			category = _('View Cockpit')},
{	pressed = iCommandViewUp,				up = iCommandViewStop,					name = _('View up'),						category = _('View Cockpit')},
{	pressed = iCommandViewDown,				up = iCommandViewStop,					name = _('View down'),						category = _('View Cockpit')},
{	pressed = iCommandViewLeft,				up = iCommandViewStop,					name = _('View left'),						category = _('View Cockpit')},
{	pressed = iCommandViewRight,			up = iCommandViewStop,					name = _('View right'),						category = _('View Cockpit')},
{	pressed = iCommandViewUpRight,			up = iCommandViewStop,					name = _('View up right'),					category = _('View Cockpit')},
{	pressed = iCommandViewDownRight,		up = iCommandViewStop,					name = _('View down right'),				category = _('View Cockpit')},
{	pressed = iCommandViewDownLeft,			up = iCommandViewStop,					name = _('View down left'),					category = _('View Cockpit')},
{	pressed = iCommandViewUpLeft,			up = iCommandViewStop,					name = _('View up left'),					category = _('View Cockpit')},

-- Cockpit Camera Motion (Передвижение камеры в кабине)
{	pressed = iCommandViewPitCameraMoveUp,		up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Up'),			category = _('View Cockpit')},
{	pressed = iCommandViewPitCameraMoveDown,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Down'),		category = _('View Cockpit')},
{	pressed = iCommandViewPitCameraMoveLeft,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Left'),		category = _('View Cockpit')},
{	pressed = iCommandViewPitCameraMoveRight,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Right'),		category = _('View Cockpit')},
{	pressed = iCommandViewPitCameraMoveForward,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Forward'),	category = _('View Cockpit')},
{	pressed = iCommandViewPitCameraMoveBack,	up = iCommandViewPitCameraMoveStop,	name = _('Cockpit Camera Move Back'),		category = _('View Cockpit')},
{	down = iCommandViewPitCameraMoveCenter,											name = _('Cockpit Camera Move Center'),		category = _('View Cockpit')},

{	down = iCommandViewCameraUp,				up = iCommandViewCameraCenter,		name = _('Glance up'),						category = _('View Cockpit')},
{	down = iCommandViewCameraDown,				up = iCommandViewCameraCenter,		name = _('Glance down'),					category = _('View Cockpit')},
{	down = iCommandViewCameraLeft,				up = iCommandViewCameraCenter,		name = _('Glance left'),					category = _('View Cockpit')},
{	down = iCommandViewCameraRight,				up = iCommandViewCameraCenter,		name = _('Glance right'),					category = _('View Cockpit')},
{	down = iCommandViewCameraUpLeft,			up = iCommandViewCameraCenter,		name = _('Glance up-left'),					category = _('View Cockpit')},
{	down = iCommandViewCameraDownLeft,			up = iCommandViewCameraCenter,		name = _('Glance down-left'),				category = _('View Cockpit')},
{	down = iCommandViewCameraUpRight,			up = iCommandViewCameraCenter,		name = _('Glance up-right'),				category = _('View Cockpit')},
{	down = iCommandViewCameraDownRight,			up = iCommandViewCameraCenter,		name = _('Glance down-right'),				category = _('View Cockpit')},
{	down = iCommandViewPanToggle,													name = _('Camera pan mode toggle'),			category = _('View Cockpit')},

{	down = iCommandViewCameraUpSlow,												name = _('Camera snap view up'),			category = _('View Cockpit')},
{	down = iCommandViewCameraDownSlow,												name = _('Camera snap view down'),			category = _('View Cockpit')},
{	down = iCommandViewCameraLeftSlow,												name = _('Camera snap view left'),			category = _('View Cockpit')},
{	down = iCommandViewCameraRightSlow,												name = _('Camera snap view right'),			category = _('View Cockpit')},
{	down = iCommandViewCameraUpLeftSlow,											name = _('Camera snap view up-left'),		category = _('View Cockpit')},
{	down = iCommandViewCameraDownLeftSlow,											name = _('Camera snap view down-left'),		category = _('View Cockpit')},
{	down = iCommandViewCameraUpRightSlow,											name = _('Camera snap view up-right'),		category = _('View Cockpit')},
{	down = iCommandViewCameraDownRightSlow,											name = _('Camera snap view down-right'),	category = _('View Cockpit')},
{	down = iCommandViewCameraCenter,												name = _('Center Camera View'),				category = _('View Cockpit')},
{	down = iCommandViewCameraReturn,												name = _('Return Camera'),					category = _('View Cockpit')},
{	down = iCommandViewCameraBaseReturn,											name = _('Return Camera Base'),				category = _('View Cockpit')},

{	down = iCommandViewSnapView0,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  0'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView1,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  1'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView2,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  2'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView3,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  3'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView4,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  4'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView5,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  5'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView6,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  6'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView7,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  7'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView8,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  8'),			category = _('View Cockpit')},
{	down = iCommandViewSnapView9,				up = iCommandViewSnapViewStop,		name = _('Custom Snap View  9'),			category = _('View Cockpit')},

{	pressed = iCommandViewForward,				up = iCommandViewForwardStop,		name = _('Zoom in'),						category = _('View Cockpit')},
{	pressed = iCommandViewBack,					up = iCommandViewBackStop,			name = _('Zoom out'),						category = _('View Cockpit')},

-- Extended view
{	down = iCommandViewCameraJiggle,		name = _('Camera jiggle toggle'),					category = _('View Extended')},
{	down = iCommandViewKeepTerrain,			name = _('Keep terrain camera altitude'),			category = _('View Extended')},
{	down = iCommandViewFriends,				name = _('View friends mode'),						category = _('View Extended')},
{	down = iCommandViewEnemies,				name = _('View enemies mode'),						category = _('View Extended')},
{	down = iCommandViewAll,					name = _('View all mode'),							category = _('View Extended')},
{	down = iCommandViewPlus,				name = _('Toggle tracking launched weapon'),		category = _('View Extended')},
{	down = iCommandViewSwitchForward,		name = _('Objects switching direction forward '),	category = _('View Extended')},
{	down = iCommandViewSwitchReverse,		name = _('Objects switching direction reverse '),	category = _('View Extended')},
{	down = iCommandViewObjectIgnore,		name = _('Object exclude '),						category = _('View Extended')},
{	down = iCommandViewObjectsAll,			name = _('Objects all excluded - include'),			category = _('View Extended')},

-- Padlock
{	down = iCommandViewLock,				name = _('Lock View (cycle padlock)'),				category = _('View Padlock')},
{	down = iCommandViewUnlock,				name = _('Unlock view (stop padlock)'),				category = _('View Padlock')},
{	down = iCommandAllMissilePadlock,		name = _('All missiles padlock'),					category = _('View Padlock')},
{	down = iCommandThreatMissilePadlock,	name = _('Threat missile padlock'),					category = _('View Padlock')},
{	down = iCommandViewTerrainLock,			name = _('Lock terrain view'),						category = _('View Padlock')},

-- Labels
{	down = iCommandMarkerState,				name = _('All Labels'),								category = _('Labels')},
{	down = iCommandMarkerStatePlane,		name = _('Aircraft Labels'),						category = _('Labels')},
{	down = iCommandMarkerStateRocket,		name = _('Missile Labels'),							category = _('Labels')},
{	down = iCommandMarkerStateShip,			name = _('Vehicle & Ship Labels'),					category = _('Labels')},

--Kneeboard
{	down = iCommandPlaneShowKneeboard,																				name = _('Kneeboard ON/OFF'),						category = _('Kneeboard')},
{	down = iCommandPlaneShowKneeboard,	up = iCommandPlaneShowKneeboard,	value_down = 1.0,	value_up = -1.0,	name = _('Kneeboard glance view'),					category = _('Kneeboard')},
{	down = 3001,	cockpit_device_id = kneeboard_id,						value_down = 1.0,						name = _('Kneeboard Next Page'),					category = _('Kneeboard')},
{	down = 3002,	cockpit_device_id = kneeboard_id,						value_down = 1.0,						name = _('Kneeboard Previous Page'),				category = _('Kneeboard')},
{	down = 3003,	cockpit_device_id = kneeboard_id,						value_down = 1.0,						name = _('Kneeboard current position mark point'),	category = _('Kneeboard')},
--shortcuts navigation
{	down = 3004,	cockpit_device_id = kneeboard_id,						value_down =  1.0,						name = _('Kneeboard Make Shortcut'),				category = _('Kneeboard')},
{	down = 3005,	cockpit_device_id = kneeboard_id,						value_down =  1.0,						name = _('Kneeboard Next Shortcut'),				category = _('Kneeboard')},
{	down = 3005,	cockpit_device_id = kneeboard_id,						value_down = -1.0,						name = _('Kneeboard Previous Shortcut'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 0,							name = _('Kneeboard Jump To Shortcut  1'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 1,							name = _('Kneeboard Jump To Shortcut  2'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 2,							name = _('Kneeboard Jump To Shortcut  3'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 3,							name = _('Kneeboard Jump To Shortcut  4'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 4,							name = _('Kneeboard Jump To Shortcut  5'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 5,							name = _('Kneeboard Jump To Shortcut  6'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 6,							name = _('Kneeboard Jump To Shortcut  7'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 7,							name = _('Kneeboard Jump To Shortcut  8'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 8,							name = _('Kneeboard Jump To Shortcut  9'),			category = _('Kneeboard')},
{	down = 3006,	cockpit_device_id = kneeboard_id,						value_down = 9,							name = _('Kneeboard Jump To Shortcut 10'),			category = _('Kneeboard')},


},

-- joystick axes
axisCommands = {
{action = JOYSTICK.Roll				, name = _('Roll')},
{action = JOYSTICK.Pitch				, name = _('Pitch')},
{action = JOYSTICK.Yaw						, name = _('Rudder')},

{action = JOYSTICK.BothThrottles						,name = _('Throttle Both')},
{action = JOYSTICK.LeftThrottle			, name = _('Throttle Left')},
{action = JOYSTICK.RightThrottle			, name = _('Throttle Right')},

{action = JOYSTICK.PedalBothBrake,	name = 'Wheel Brake Both'},
{action = JOYSTICK.PedalLeftBrake,	name = 'Wheel Brake Left'},
{action = JOYSTICK.PedalRightBrake,	name = 'Wheel Brake Right'},

{action = JOYSTICK.NoseWheelSteering,	name = 'Nose Wheel Steering'},

------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------- common_joystick axes_binding
------------------------------------------------------------------------------------------------------------------------------
{	action = iCommandViewHorizontalAbs,		name = _('Absolute Camera Horizontal View')},
{	action = iCommandViewVerticalAbs,		name = _('Absolute Camera Vertical View')},
{	action = iCommandViewZoomAbs,			name = _('Zoom View')},
{	action = iCommandViewRollAbs,			name = _('Absolute Roll Shift Camera View')},
{	action = iCommandViewHorTransAbs,		name = _('Absolute Horizontal Shift Camera View')},
{	action = iCommandViewVertTransAbs,		name = _('Absolute Vertical Shift Camera View')},
{	action = iCommandViewLongitudeTransAbs,	name = _('Absolute Longitude Shift Camera View')},

},
}
