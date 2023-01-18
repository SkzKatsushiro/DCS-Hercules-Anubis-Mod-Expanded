
dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")

local gettext = require("i_18n")
_ = gettext.translate

cursor_mode = 
{ 
    CUMODE_CLICKABLE = 0,
    CUMODE_CLICKABLE_AND_CAMERA  = 1,
    CUMODE_CAMERA = 2,
};

clickable_mode_initial_status  = cursor_mode.CUMODE_CLICKABLE


elements = {}


-- class_type = 
-- {
	-- NULL   = 0,
	-- BTN    = 1,
	-- TUMB   = 2,
	-- SNGBTN = 3,
	-- LEV    = 4,
	-- MOVABLE_LEV = 5
-- }

function Toggle_Switch(hint_, command_)
    return {
        class           = {class_type.TUMB, class_type.TUMB},
        hint            = hint_,
        device          = devices.General,
        action          = {command_, command_},
        arg_value       = {-1, 1},
        updatable       = true,
    }
end

function Toggle_Button(hint_, command_)
    return {
        class           = {class_type.BTN, class_type.BTN},
        hint            = hint_,
        device          = devices.General,
        action          = {command_, command_},
        arg_value       = {-1, 1},
        updatable       = true,
    }
end

function Knob_Rotate_Pull(hint_, command_Pull, command_Rotate)
    return {
        class           = {class_type.TUMB, class_type.TUMB, class_type.LEV},
        hint            = hint_,
        device          = devices.General,
        action          = {command_Pull, command_Pull, command_Rotate},
		arg_value		= {-1, 1, 0},
        updatable       = true,
    }
end

function Switch_Up_Down_Release(hint_, command_)
    return {
        class           = {class_type.TUMB, class_type.TUMB},
        hint            = hint_,
        device          = devices.General,
        action          = {command_, command_},
        stop_action     = {command_, command_},
        arg_value       = {-1, 1},
        updatable       = true,
    }
end

function Switch_Up_Release(hint_, command_)
    return {
        class           = {class_type.TUMB, class_type.TUMB},
        hint            = hint_,
        device          = devices.General,
        action          = {command_, command_},
        stop_action     = {command_, nil},
        arg_value       = {-1, 1},
        updatable       = true,
    }
end

function Switch_Down_Release(hint_, command_)
    return {
        class           = {class_type.TUMB, class_type.TUMB},
        hint            = hint_,
        device          = devices.General,
        action          = {command_, command_},
        stop_action     = {nil, command_},
        arg_value       = {-1, 1},
        updatable       = true,
    }
end

function Knob_Rotate(hint_, command_rot)
    return {
        class           = {class_type.LEV},
        hint            = hint_,
        device          = devices.General,
        action          = {command_rot},
    }
end

function Knob_Rotate_Press(hint_, command_press, command_rot)
    return {
        class           = {class_type.BTN, class_type.LEV},
        hint            = hint_,
        device          = devices.General,
        action          = {command_press, command_rot},
        stop_action     = {command_press, 0},
    }
end

function Button_Press_Release(hint_, command_down, command_up)
    return {
        class           = {class_type.BTN},
        hint            = hint_,
        device          = devices.General,
        action          = {command_down},
        stop_action     = {command_up},
        updatable       = true,
    }
end

------------------------------------------------------------------------ DEBUG
elements["DEBUG_CON"] = Toggle_Switch("Debug information", DEBUG.DEBUG_Screen)
elements["DEBUG_Click1_CON"] = Toggle_Switch("DEBUG Click 1", DEBUG.Click_Value1)
elements["DEBUG_Click2_CON"] = Toggle_Switch("DEBUG Click 2", DEBUG.Click_Value2)
elements["DEBUG_Click3_CON"] = Toggle_Switch("DEBUG Click 3", DEBUG.Click_Value3)
elements["DEBUG_Click4_CON"] = Toggle_Switch("DEBUG Click 4", DEBUG.Click_Value4)
elements["DEBUG_Click5_CON"] = Toggle_Switch("DEBUG Click 5", DEBUG.Click_Value5)
elements["DEBUG_Click6_CON"] = Toggle_Switch("DEBUG Click 6", DEBUG.Click_Value6)
elements["DEBUG_Click7_CON"] = Toggle_Switch("DEBUG Click 7", DEBUG.Click_Value7)
elements["DEBUG_Click8_CON"] = Toggle_Switch("DEBUG Click 8", DEBUG.Click_Value8)
elements["DEBUG_Click9_CON"] = Toggle_Switch("DEBUG Click 9", DEBUG.Click_Value9)
elements["DEBUG_Click10_CON"] = Toggle_Switch("DEBUG Click 10", DEBUG.Click_Value10)
------------------------------------------------------------------------ICS_PANEL (Intercommunications System)
elements["PILOT_ICS_Volume_CON"] = Knob_Rotate_Pull("ICS Volume (Pull to play testing sound file)", ICS_PANEL.PILOT_ICS_VOL_KNOB_PULL, ICS_PANEL.PILOT_ICS_VOL_KNOB_ROT)
elements["COPILOT_ICS_Volume_CON"] = Knob_Rotate_Pull("ICS Volume (Pull to play testing sound file)", ICS_PANEL.COPILOT_ICS_VOL_KNOB_PULL, ICS_PANEL.COPILOT_ICS_VOL_KNOB_ROT)
elements["PILOT_ICS_Undefined_CON"] = Knob_Rotate("PILOT ICS Undefined", ICS_PANEL.PILOT_ICS_UNDEF_KNOB_ROT)
elements["COPILOT_ICS_Undefined_CON"] = Knob_Rotate("COPILOT ICS Undefined", ICS_PANEL.COPILOT_ICS_UNDEF_KNOB_ROT)
------------------------------------------------------------------------ ELECTRICAL_PANEL
elements["battery_switch_CON"] = Toggle_Switch("Battery", ELECTRICAL_PANEL.Battery_Relays_switch)
elements["external_power_APU_switch_CON"] = Toggle_Switch("External power / APU", ELECTRICAL_PANEL.external_power_APU_selector)
elements["GEN_Switch001_CON"] = Toggle_Switch("Generator 1", ELECTRICAL_PANEL.Engine1_Generator_switch)
elements["GEN_Switch002_CON"] = Toggle_Switch("Generator 2", ELECTRICAL_PANEL.Engine2_Generator_switch)
elements["GEN_Switch003_CON"] = Toggle_Switch("Generator 3", ELECTRICAL_PANEL.Engine3_Generator_switch)
elements["GEN_Switch004_CON"] = Toggle_Switch("Generator 4", ELECTRICAL_PANEL.Engine4_Generator_switch)
elements["battery_test_CON"] = Switch_Up_Down_Release("Battery test", ELECTRICAL_PANEL.battery_test_selector)

------------------------------------------------------------------------ FIRE_HANDLES
elements["Engine1_Fire_Handle_CON"] = Toggle_Switch("Engine 1 Fire Handle", FIRE_HANDLES.Engine1_fire_handle)
elements["Engine2_Fire_Handle_CON"] = Toggle_Switch("Engine 2 Fire Handle", FIRE_HANDLES.Engine2_fire_handle)
elements["Engine3_Fire_Handle_CON"] = Toggle_Switch("Engine 3 Fire Handle", FIRE_HANDLES.Engine3_fire_handle)
elements["Engine4_Fire_Handle_CON"] = Toggle_Switch("Engine 4 Fire Handle", FIRE_HANDLES.Engine4_fire_handle)
elements["APU_Fire_Handle_CON"] = Toggle_Switch("APU Fire Handle", FIRE_HANDLES.APU_fire_handle)
------------------------------------------------------------------------ ENGINE_START_PANEL
			
elements["Engine1_Selector_CON"] = Switch_Up_Down_Release("Engine 1 Motor/Stop/Run/Start", ENGINE_START_PANEL.Engine1_Start_Selector)
elements["Engine2_Selector_CON"] = Switch_Up_Down_Release("Engine 2 Motor/Stop/Run/Start", ENGINE_START_PANEL.Engine2_Start_Selector)
elements["Engine3_Selector_CON"] = Switch_Up_Down_Release("Engine 3 Motor/Stop/Run/Start", ENGINE_START_PANEL.Engine3_Start_Selector)
elements["Engine4_Selector_CON"] = Switch_Up_Down_Release("Engine 4 Motor/Stop/Run/Start", ENGINE_START_PANEL.Engine4_Start_Selector)
------------------------------------------------------------------------ APU_PANEL
elements["APU_Selector_CON"] = Switch_Up_Down_Release("APU Stop/Run/Start", APU_PANEL.APU_Selector_switch)
------------------------------------------------------------------------ PROPELLER_CONTROL_PANEL
elements["Engine1PropControl_selector_CON"] = Switch_Down_Release("Propeller 1 control", PROPELLER_CONTROL_PANEL.Engine1PropControl_selector)
elements["Engine2PropControl_selector_CON"] = Switch_Down_Release("Propeller 2 control", PROPELLER_CONTROL_PANEL.Engine2PropControl_selector)
elements["Engine3PropControl_selector_CON"] = Switch_Down_Release("Propeller 3 control", PROPELLER_CONTROL_PANEL.Engine3PropControl_selector)
elements["Engine4PropControl_selector_CON"] = Switch_Down_Release("Propeller 4 control", PROPELLER_CONTROL_PANEL.Engine4PropControl_selector)
------------------------------------------------------------------------ THROTTLE_QUADRANT_ASSEMBLY
elements["Throttle1_Disabled_CON"] = Toggle_Button("Throttle 1 disable to flight/ground idle", THROTTLE_QUADRANT_ASSEMBLY.Throttle1_disabled)
elements["Throttle2_Disabled_CON"] = Toggle_Button("Throttle 2 disable to flight/ground idle", THROTTLE_QUADRANT_ASSEMBLY.Throttle2_disabled)
elements["Throttle3_Disabled_CON"] = Toggle_Button("Throttle 3 disable to flight/ground idle", THROTTLE_QUADRANT_ASSEMBLY.Throttle3_disabled)
elements["Throttle4_Disabled_CON"] = Toggle_Button("Throttle 4 disable to flight/ground idle", THROTTLE_QUADRANT_ASSEMBLY.Throttle4_disabled)
elements["Engine1SpeedMode_switch_CON"] = Toggle_Button("Engine1 Low Speed Ground Idle", THROTTLE_QUADRANT_ASSEMBLY.Engine1SpeedMode_switch)
elements["Engine2SpeedMode_switch_CON"] = Toggle_Button("Engine2 Low Speed Ground Idle", THROTTLE_QUADRANT_ASSEMBLY.Engine2SpeedMode_switch)
elements["Engine3SpeedMode_switch_CON"] = Toggle_Button("Engine3 Low Speed Ground Idle", THROTTLE_QUADRANT_ASSEMBLY.Engine3SpeedMode_switch)
elements["Engine4SpeedMode_switch_CON"] = Toggle_Button("Engine4 Low Speed Ground Idle", THROTTLE_QUADRANT_ASSEMBLY.Engine4SpeedMode_switch)
------------------------------------------------------------------------ BLEED_AIR_PANEL
elements["Bleed_Air_Switch_Engine1_CON"] = Toggle_Switch("Bleed Air Switch Engine 1", BLEED_AIR_PANEL.Bleed_Air_Switch_Engine1)
elements["Bleed_Air_Switch_Engine2_CON"] = Toggle_Switch("Bleed Air Switch Engine 2", BLEED_AIR_PANEL.Bleed_Air_Switch_Engine2)
elements["Bleed_Air_Switch_Engine3_CON"] = Toggle_Switch("Bleed Air Switch Engine 3", BLEED_AIR_PANEL.Bleed_Air_Switch_Engine3)
elements["Bleed_Air_Switch_Engine4_CON"] = Toggle_Switch("Bleed Air Switch Engine 4", BLEED_AIR_PANEL.Bleed_Air_Switch_Engine4)
elements["Bleed_Air_Switch_Leftwing_LisoValve_CON"] = Toggle_Switch("Bleed Air Switch Leftwing Iso Valve", BLEED_AIR_PANEL.Bleed_Air_Switch_Leftwing_LisoValve)
elements["Bleed_Air_Switch_DivValve_CON"] = Toggle_Switch("Bleed Air Switch Divider Valve", BLEED_AIR_PANEL.Bleed_Air_Switch_DivValve)
elements["Bleed_Air_Switch_Rightwing_LisoValve_CON"] = Toggle_Switch("Bleed Air Switch Rightwing Iso Valve", BLEED_AIR_PANEL.Bleed_Air_Switch_Rightwing_LisoValve)
elements["Bleed_Air_Switch_APU_CON"] = Toggle_Button("Bleed Air Switch APU", BLEED_AIR_PANEL.Bleed_Air_Switch_APU)
------------------------------------------------------------------------ LANDING_GEAR_LIGHTS_PANEL
elements["GEAR_CON"] = Toggle_Switch("Landing Gear", LANDING_GEAR_LIGHTS_PANEL.gear_lever)
elements["LeftLandingLight_OnOff_switch_CON"] = Toggle_Switch("Left Landing Lights On/Off", LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_OnOff_switch)
elements["RightLandingLight_OnOff_switch_CON"] = Toggle_Switch("Right Landing Lights On/Off", LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_OnOff_switch)
elements["LeftLandingLight_ExtHldRet_switch_CON"] = Toggle_Switch("Left Landing Lights Extend/Hold/Retract", LANDING_GEAR_LIGHTS_PANEL.LeftLandingLight_ExtHldRet_switch)
elements["RightLandingLight_ExtHldRet_switch_CON"] = Toggle_Switch("Right Landing Lights Extend/Hold/Retract", LANDING_GEAR_LIGHTS_PANEL.RightLandingLight_ExtHldRet_switch)
elements["Taxi_Lights_switch_CON"] = Toggle_Switch("Taxi Lights On/Off", LANDING_GEAR_LIGHTS_PANEL.Taxi_Lights_OnOff_switch)
------------------------------------------------------------------------------------------ FLAPS
elements["flap_lever_CON"] = Toggle_Switch("Flap Lever", FLAPS.Lever)
------------------------------------------------------------------------ HYDRAULIC_CONTROL_PANEL
elements["Cockpit_Aux_Hydraulic_Switch_CON"] = Toggle_Switch("Aux Hydraulic pump", HYDRAULIC_CONTROL_PANEL.Cockpit_Aux_Hydraulic_Switch)
elements["anti_skid_switch_CON"] = Toggle_Switch("Anti Skid", HYDRAULIC_CONTROL_PANEL.AntiSkid_switch)
elements["Emergency_Brake_Sel_CON"] = Toggle_Switch("Emergency Brake Sel Light", HYDRAULIC_CONTROL_PANEL.Emergency_Brake_Sel_switch)
elements["Engine_Pumps_Util_1_CON"] = Toggle_Switch("Engine Pumps Util 1 switch", HYDRAULIC_CONTROL_PANEL.Engine_Pumps_Util_1_switch)
elements["Engine_Pumps_Util_2_CON"] = Toggle_Switch("Engine Pumps Util 2 switch", HYDRAULIC_CONTROL_PANEL.Engine_Pumps_Util_2_switch)
elements["Engine_Pumps_Boost_3_CON"] = Toggle_Switch("Engine Pumps Boost 3 switch", HYDRAULIC_CONTROL_PANEL.Engine_Pumps_Boost_3_switch)
elements["Engine_Pumps_Boost_4_CON"] = Toggle_Switch("Engine Pumps Boost 4 switch", HYDRAULIC_CONTROL_PANEL.Engine_Pumps_Boost_4_switch)
elements["Suction_Boost_Pumps_Util_CON"] = Toggle_Switch("Suction Boost Pumps Util switch", HYDRAULIC_CONTROL_PANEL.Suction_Boost_Pumps_Util_switch)
elements["Suction_Boost_Pumps_Boost_CON"] = Toggle_Switch("Suction Boost Pumps Boost switch", HYDRAULIC_CONTROL_PANEL.Suction_Boost_Pumps_Boost_switch)
------------------------------------------------------------------------ HUD_PANELS
elements["pilot_hud_brighness_control_CON"] = Knob_Rotate_Press("Hud Press Contrast Rotate Brighness", HUD_PANELS.PILOT_hud_contrast_control, HUD_PANELS.PILOT_hud_brightness_control)
elements["pilot_hud_combiner_latch_CON"] = Toggle_Switch("HUD Combiner Latch", HUD_PANELS.PILOT_hud_combiner_latch)
elements["pilot_hud_stopwatch_CON"] = Toggle_Button("Stopwatch Start/Stop", HUD_PANELS.PILOT_hud_stopwatch)
elements["copilot_hud_brighness_control_CON"] = Knob_Rotate_Press("Hud Press Contrast Rotate Brighness", HUD_PANELS.COPILOT_hud_contrast_control, HUD_PANELS.COPILOT_hud_brightness_control)
elements["copilot_hud_combiner_latch_CON"] = Toggle_Switch("HUD Combiner Latch", HUD_PANELS.COPILOT_hud_combiner_latch)
elements["copilot_hud_stopwatch_CON"] = Toggle_Button("Stopwatch Start/Stop", HUD_PANELS.COPILOT_hud_stopwatch)
------------------------------------------------------------------------ DISPLAY_BRIGHTNESS_CONTROL
elements["hdd_001_brighness_control_CON"] = Toggle_Switch("HDD Brighness", DISPLAY_BRIGHTNESS_CONTROL.hdd_001_brightness_control)
elements["hdd_002_brighness_control_CON"] = Toggle_Switch("HDD Brighness", DISPLAY_BRIGHTNESS_CONTROL.hdd_002_brightness_control)
elements["hdd_003_brighness_control_CON"] = Toggle_Switch("HDD Brighness", DISPLAY_BRIGHTNESS_CONTROL.hdd_003_brightness_control)
elements["hdd_004_brighness_control_CON"] = Toggle_Switch("HDD Brighness", DISPLAY_BRIGHTNESS_CONTROL.hdd_004_brightness_control)
elements["pilot_CNI_MU_brighness_control_CON"] = Knob_Rotate("CNI MU Brighness", DISPLAY_BRIGHTNESS_CONTROL.PILOT_CNI_MU_brightness_control)
elements["copilot_CNI_MU_brighness_control_CON"] = Knob_Rotate("CNI MU Brighness", DISPLAY_BRIGHTNESS_CONTROL.COPILOT_CNI_MU_brightness_control)
elements["CNBP_brighness_control_CON"] = Toggle_Switch("CNBP Brighness", DISPLAY_BRIGHTNESS_CONTROL.CNBP_brightness_control)
elements["pilot_AMU_brighness_control_CON"] = Toggle_Switch("AMU Brighness", DISPLAY_BRIGHTNESS_CONTROL.pilot_AMU_brightness_control)
elements["copilot_AMU_brighness_control_CON"] = Toggle_Switch("AMU Brighness", DISPLAY_BRIGHTNESS_CONTROL.copilot_AMU_brightness_control)
---------------------------------------------------------------------------------------------------------REFERENCE_SET_MODE_SELECT_PANELS
------------------------------------------------------------------------ pilot
elements["pilot_reference_select_switch_CON"] = Toggle_Switch("Reference select switch", REFERENCE_SET_MODE_SELECT_PANELS.PILOT_reference_select_switch)
elements["pilot_reference_set_knob_CON"] = Knob_Rotate("Reference set knob", REFERENCE_SET_MODE_SELECT_PANELS.PILOT_reference_set_knob)
elements["pilot_altimeter_setting_knob_CON"] = Knob_Rotate_Press("Altitude alert set/reset knob", REFERENCE_SET_MODE_SELECT_PANELS.PILOT_altitude_alert_Reset_knob, REFERENCE_SET_MODE_SELECT_PANELS.PILOT_altitude_alert_set_knob)
elements["pilot_barometer_setting_knob_CON"] = Knob_Rotate_Press("Altimeter Baro Setting Knob/Push for standard", REFERENCE_SET_MODE_SELECT_PANELS.PILOT_barometric_standard, REFERENCE_SET_MODE_SELECT_PANELS.PILOT_barometric_set_knob)
elements["Pilot_Alt_Hold_CON"] = Toggle_Button("Alt Hold", REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Hold)
elements["Pilot_Alt_Select_CON"] = Toggle_Button("Alt Select", REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Select)
elements["Pilot_Hdg_CON"] = Toggle_Button("Hdg", REFERENCE_SET_MODE_SELECT_PANELS.Hdg)
elements["Pilot_Nav_CON"] = Toggle_Button("Nav", REFERENCE_SET_MODE_SELECT_PANELS.Nav)
elements["Pilot_Approach_CON"] = Toggle_Button("Approach", REFERENCE_SET_MODE_SELECT_PANELS.Approach)
elements["Pilot_Ver_Speed_Hold_CON"] = Toggle_Button("Vertical Speed Hold", REFERENCE_SET_MODE_SELECT_PANELS.Ver_Speed_Hold)
elements["Pilot_IAS_CON"] = Toggle_Button("IAS", REFERENCE_SET_MODE_SELECT_PANELS.IAS)
elements["Pilot_CAPS_CON"] = Toggle_Button("CAPS", REFERENCE_SET_MODE_SELECT_PANELS.CAPS)
elements["Pilot_Autothrottle_CON"] = Toggle_Button("Autothrottle", REFERENCE_SET_MODE_SELECT_PANELS.Autothrottle)
------------------------------------------------------------------------ copilot
elements["copilot_reference_select_switch_CON"] = Toggle_Switch("Reference select switch", REFERENCE_SET_MODE_SELECT_PANELS.COPILOT_reference_select_switch)
elements["copilot_reference_set_knob_CON"] = Knob_Rotate("Reference set knob", REFERENCE_SET_MODE_SELECT_PANELS.COPILOT_reference_set_knob)
elements["copilot_altimeter_setting_knob_CON"] = Knob_Rotate_Press("Altitude alert set/reset knob", REFERENCE_SET_MODE_SELECT_PANELS.COPILOT_altitude_alert_Reset_knob, REFERENCE_SET_MODE_SELECT_PANELS.COPILOT_altitude_alert_set_knob)
elements["copilot_barometer_setting_knob_CON"] = Knob_Rotate_Press("Altimeter Baro Setting Knob/Push for standard", REFERENCE_SET_MODE_SELECT_PANELS.COPILOT_barometric_standard, REFERENCE_SET_MODE_SELECT_PANELS.COPILOT_barometric_set_knob)
elements["Copilot_Alt_Hold_CON"] = Toggle_Button("Alt Hold", REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Hold)
elements["Copilot_Alt_Select_CON"] = Toggle_Button("Alt Select", REFERENCE_SET_MODE_SELECT_PANELS.Altitude_Select)
elements["Copilot_Hdg_CON"] = Toggle_Button("Hdg", REFERENCE_SET_MODE_SELECT_PANELS.Hdg)
elements["Copilot_Nav_CON"] = Toggle_Button("Nav", REFERENCE_SET_MODE_SELECT_PANELS.Nav)
elements["Copilot_Approach_CON"] = Toggle_Button("Approach", REFERENCE_SET_MODE_SELECT_PANELS.Approach)
elements["Copilot_Ver_Speed_Hold_CON"] = Toggle_Button("Vertical Speed Hold", REFERENCE_SET_MODE_SELECT_PANELS.Ver_Speed_Hold)
elements["Copilot_IAS_CON"] = Toggle_Button("IAS", REFERENCE_SET_MODE_SELECT_PANELS.IAS)
elements["Copilot_CAPS_CON"] = Toggle_Button("CAPS", REFERENCE_SET_MODE_SELECT_PANELS.CAPS)
elements["Copilot_Autothrottle_CON"] = Toggle_Button("Autothrottle", REFERENCE_SET_MODE_SELECT_PANELS.Autothrottle)
			
------------------------------------------------------------------------ AMU_PANEL
elements["pilot_AMU001_SelectKey_001_CON"] = Toggle_Button("AMU SelectKey 1", AMU.pilot_AMU001_SelectKey_001)
elements["pilot_AMU001_SelectKey_002_CON"] = Toggle_Button("AMU SelectKey 2", AMU.pilot_AMU001_SelectKey_002)
elements["pilot_AMU001_SelectKey_003_CON"] = Toggle_Button("AMU SelectKey 3", AMU.pilot_AMU001_SelectKey_003)
elements["pilot_AMU001_SelectKey_004_CON"] = Toggle_Button("AMU SelectKey 4", AMU.pilot_AMU001_SelectKey_004)
elements["pilot_AMU001_SelectKey_005_CON"] = Toggle_Button("AMU SelectKey 5", AMU.pilot_AMU001_SelectKey_005)
elements["pilot_AMU001_SelectKey_006_CON"] = Toggle_Button("AMU SelectKey 6", AMU.pilot_AMU001_SelectKey_006)
elements["pilot_AMU001_SelectKey_007_CON"] = Toggle_Button("AMU SelectKey 7", AMU.pilot_AMU001_SelectKey_007)
elements["pilot_AMU001_SelectKey_008_CON"] = Toggle_Button("AMU SelectKey 8", AMU.pilot_AMU001_SelectKey_008)
		------------------------------------------------------------	
elements["pilot_AMU002_SelectKey_001_CON"] = Toggle_Button("AMU SelectKey 1", AMU.pilot_AMU002_SelectKey_001)
elements["pilot_AMU002_SelectKey_002_CON"] = Toggle_Button("AMU SelectKey 2", AMU.pilot_AMU002_SelectKey_002)
elements["pilot_AMU002_SelectKey_003_CON"] = Toggle_Button("AMU SelectKey 3", AMU.pilot_AMU002_SelectKey_003)
elements["pilot_AMU002_SelectKey_004_CON"] = Toggle_Button("AMU SelectKey 4", AMU.pilot_AMU002_SelectKey_004)
elements["pilot_AMU002_SelectKey_005_CON"] = Toggle_Button("AMU SelectKey 5", AMU.pilot_AMU002_SelectKey_005)
elements["pilot_AMU002_SelectKey_006_CON"] = Toggle_Button("AMU SelectKey 6", AMU.pilot_AMU002_SelectKey_006)
elements["pilot_AMU002_SelectKey_007_CON"] = Toggle_Button("AMU SelectKey 7", AMU.pilot_AMU002_SelectKey_007)
elements["pilot_AMU002_SelectKey_008_CON"] = Toggle_Button("AMU SelectKey 8", AMU.pilot_AMU002_SelectKey_008)
		------------------------------------------------------------	
elements["copilot_AMU001_SelectKey_001_CON"] = Toggle_Button("AMU SelectKey 1", AMU.copilot_AMU001_SelectKey_001)
elements["copilot_AMU001_SelectKey_002_CON"] = Toggle_Button("AMU SelectKey 2", AMU.copilot_AMU001_SelectKey_002)
elements["copilot_AMU001_SelectKey_003_CON"] = Toggle_Button("AMU SelectKey 3", AMU.copilot_AMU001_SelectKey_003)
elements["copilot_AMU001_SelectKey_004_CON"] = Toggle_Button("AMU SelectKey 4", AMU.copilot_AMU001_SelectKey_004)
elements["copilot_AMU001_SelectKey_005_CON"] = Toggle_Button("AMU SelectKey 5", AMU.copilot_AMU001_SelectKey_005)
elements["copilot_AMU001_SelectKey_006_CON"] = Toggle_Button("AMU SelectKey 6", AMU.copilot_AMU001_SelectKey_006)
elements["copilot_AMU001_SelectKey_007_CON"] = Toggle_Button("AMU SelectKey 7", AMU.copilot_AMU001_SelectKey_007)
elements["copilot_AMU001_SelectKey_008_CON"] = Toggle_Button("AMU SelectKey 8", AMU.copilot_AMU001_SelectKey_008)
		------------------------------------------------------------	
elements["copilot_AMU002_SelectKey_001_CON"] = Toggle_Button("AMU SelectKey 1", AMU.copilot_AMU002_SelectKey_001)
elements["copilot_AMU002_SelectKey_002_CON"] = Toggle_Button("AMU SelectKey 2", AMU.copilot_AMU002_SelectKey_002)
elements["copilot_AMU002_SelectKey_003_CON"] = Toggle_Button("AMU SelectKey 3", AMU.copilot_AMU002_SelectKey_003)
elements["copilot_AMU002_SelectKey_004_CON"] = Toggle_Button("AMU SelectKey 4", AMU.copilot_AMU002_SelectKey_004)
elements["copilot_AMU002_SelectKey_005_CON"] = Toggle_Button("AMU SelectKey 5", AMU.copilot_AMU002_SelectKey_005)
elements["copilot_AMU002_SelectKey_006_CON"] = Toggle_Button("AMU SelectKey 6", AMU.copilot_AMU002_SelectKey_006)
elements["copilot_AMU002_SelectKey_007_CON"] = Toggle_Button("AMU SelectKey 7", AMU.copilot_AMU002_SelectKey_007)
elements["copilot_AMU002_SelectKey_008_CON"] = Toggle_Button("AMU SelectKey 8", AMU.copilot_AMU002_SelectKey_008)
------------------------------------------------------------------------ COMM_NAV_ECB_PANEL
elements["COMM_CNBP_CON"] = Toggle_Button("COMM Select", AMU.COMM_CNBP)
elements["NAV_CNBP_CON"] = Toggle_Button("NAV Select", AMU.NAV_CNBP)
elements["ECB_CNBP_CON"] = Toggle_Button("ECB Select", AMU.ECB_CNBP)
-- elements["CNBP_SelectKey_001_CON"] = Toggle_Button("CNBP SelectKey 1"), CNBP.CNBP_SelectKey_001)
-- elements["CNBP_SelectKey_002_CON"] = Toggle_Button("CNBP SelectKey 2"), CNBP.CNBP_SelectKey_002)
-- elements["CNBP_SelectKey_003_CON"] = Toggle_Button("CNBP SelectKey 3"), CNBP.CNBP_SelectKey_003)
-- elements["CNBP_SelectKey_004_CON"] = Toggle_Button("CNBP SelectKey 4"), CNBP.CNBP_SelectKey_004)
-- elements["CNBP_SelectKey_005_CON"] = Toggle_Button("CNBP SelectKey 5"), CNBP.CNBP_SelectKey_005)
-- elements["CNBP_SelectKey_006_CON"] = Toggle_Button("CNBP SelectKey 6"), CNBP.CNBP_SelectKey_006)
-- elements["CNBP_SelectKey_007_CON"] = Toggle_Button("CNBP SelectKey 7"), CNBP.CNBP_SelectKey_007)
-- elements["CNBP_SelectKey_008_CON"] = Toggle_Button("CNBP SelectKey 8"), CNBP.CNBP_SelectKey_008)
------------------------------------------------------------------------ CNI_MU_PANEL
elements["pilot_CNI_MU_SelectKey_001_CON"] = Toggle_Button("CNI MU SelectKey 1", CNI_MU.pilot_CNI_MU_SelectKey_001)
elements["pilot_CNI_MU_SelectKey_002_CON"] = Toggle_Button("CNI MU SelectKey 2", CNI_MU.pilot_CNI_MU_SelectKey_002)
elements["pilot_CNI_MU_SelectKey_003_CON"] = Toggle_Button("CNI MU SelectKey 3", CNI_MU.pilot_CNI_MU_SelectKey_003)
elements["pilot_CNI_MU_SelectKey_004_CON"] = Toggle_Button("CNI MU SelectKey 4", CNI_MU.pilot_CNI_MU_SelectKey_004)
elements["pilot_CNI_MU_SelectKey_005_CON"] = Toggle_Button("CNI MU SelectKey 5", CNI_MU.pilot_CNI_MU_SelectKey_005)
elements["pilot_CNI_MU_SelectKey_006_CON"] = Toggle_Button("CNI MU SelectKey 6", CNI_MU.pilot_CNI_MU_SelectKey_006)
elements["pilot_CNI_MU_SelectKey_007_CON"] = Toggle_Button("CNI MU SelectKey 7", CNI_MU.pilot_CNI_MU_SelectKey_007)
elements["pilot_CNI_MU_SelectKey_008_CON"] = Toggle_Button("CNI MU SelectKey 8", CNI_MU.pilot_CNI_MU_SelectKey_008)
elements["pilot_CNI_MU_SelectKey_009_CON"] = Toggle_Button("CNI MU SelectKey 9", CNI_MU.pilot_CNI_MU_SelectKey_009)
elements["pilot_CNI_MU_SelectKey_010_CON"] = Toggle_Button("CNI MU SelectKey 10", CNI_MU.pilot_CNI_MU_SelectKey_010)
elements["pilot_CNI_MU_SelectKey_011_CON"] = Toggle_Button("CNI MU SelectKey 11", CNI_MU.pilot_CNI_MU_SelectKey_011)
elements["pilot_CNI_MU_SelectKey_012_CON"] = Toggle_Button("CNI MU SelectKey 12", CNI_MU.pilot_CNI_MU_SelectKey_012)
elements["pilot_CNI_MU_CommTune_CON"] = Toggle_Button("CNI MU Comm Tune Select", CNI_MU.pilot_CNI_MU_CommTune)
elements["pilot_CNI_MU_TOLD_CON"] = Toggle_Button("CNI MU TOLD Select", CNI_MU.pilot_CNI_MU_TOLD)
elements["pilot_CNI_MU_NAV_CTRL_CON"] = Toggle_Button("CNI MU NAV CTRL Select", CNI_MU.pilot_CNI_MU_NAV_CTRL)
elements["pilot_CNI_MU_INDEX_CON"] = Toggle_Button("CNI MU INDEX Select", CNI_MU.pilot_CNI_MU_INDEX)
elements["pilot_CNI_MU_EXEC_CON"] = Toggle_Button("CNI MU EXEC Select", CNI_MU.pilot_CNI_MU_EXEC)
elements["pilot_CNI_MU_KBD_1_CON"] = Toggle_Button("CNI MU KBD 1 Select", CNI_MU.pilot_CNI_MU_KBD_1)
elements["pilot_CNI_MU_KBD_2_CON"] = Toggle_Button("CNI MU KBD 2 Select", CNI_MU.pilot_CNI_MU_KBD_2)
elements["pilot_CNI_MU_KBD_3_CON"] = Toggle_Button("CNI MU KBD 3 Select", CNI_MU.pilot_CNI_MU_KBD_3)
elements["pilot_CNI_MU_KBD_4_CON"] = Toggle_Button("CNI MU KBD 4 Select", CNI_MU.pilot_CNI_MU_KBD_4)
elements["pilot_CNI_MU_KBD_5_CON"] = Toggle_Button("CNI MU KBD 5 Select", CNI_MU.pilot_CNI_MU_KBD_5)
elements["pilot_CNI_MU_KBD_6_CON"] = Toggle_Button("CNI MU KBD 6 Select", CNI_MU.pilot_CNI_MU_KBD_6)
elements["pilot_CNI_MU_KBD_7_CON"] = Toggle_Button("CNI MU KBD 7 Select", CNI_MU.pilot_CNI_MU_KBD_7)
elements["pilot_CNI_MU_KBD_8_CON"] = Toggle_Button("CNI MU KBD 8 Select", CNI_MU.pilot_CNI_MU_KBD_8)
elements["pilot_CNI_MU_KBD_9_CON"] = Toggle_Button("CNI MU KBD 9 Select", CNI_MU.pilot_CNI_MU_KBD_9)
elements["pilot_CNI_MU_KBD_dot_CON"] = Toggle_Button("CNI MU KBD . Select", CNI_MU.pilot_CNI_MU_KBD_dot)
elements["pilot_CNI_MU_KBD_0_CON"] = Toggle_Button("CNI MU KBD 0 Select", CNI_MU.pilot_CNI_MU_KBD_0)
elements["pilot_CNI_MU_KBD_plusmin_CON"] = Toggle_Button("CNI MU KBD +/- Select", CNI_MU.pilot_CNI_MU_KBD_plusmin)
elements["pilot_CNI_MU_KBD_A_CON"] = Toggle_Button("CNI MU KBD A Select", CNI_MU.pilot_CNI_MU_KBD_A)
elements["pilot_CNI_MU_KBD_B_CON"] = Toggle_Button("CNI MU KBD B Select", CNI_MU.pilot_CNI_MU_KBD_B)
elements["pilot_CNI_MU_KBD_C_CON"] = Toggle_Button("CNI MU KBD C Select", CNI_MU.pilot_CNI_MU_KBD_C)
elements["pilot_CNI_MU_KBD_D_CON"] = Toggle_Button("CNI MU KBD D Select", CNI_MU.pilot_CNI_MU_KBD_D)
elements["pilot_CNI_MU_KBD_E_CON"] = Toggle_Button("CNI MU KBD E Select", CNI_MU.pilot_CNI_MU_KBD_E)
elements["pilot_CNI_MU_KBD_F_CON"] = Toggle_Button("CNI MU KBD F Select", CNI_MU.pilot_CNI_MU_KBD_F)
elements["pilot_CNI_MU_KBD_G_CON"] = Toggle_Button("CNI MU KBD G Select", CNI_MU.pilot_CNI_MU_KBD_G)
elements["pilot_CNI_MU_KBD_H_CON"] = Toggle_Button("CNI MU KBD H Select", CNI_MU.pilot_CNI_MU_KBD_H)
elements["pilot_CNI_MU_KBD_I_CON"] = Toggle_Button("CNI MU KBD I Select", CNI_MU.pilot_CNI_MU_KBD_I)
elements["pilot_CNI_MU_KBD_J_CON"] = Toggle_Button("CNI MU KBD J Select", CNI_MU.pilot_CNI_MU_KBD_J)
elements["pilot_CNI_MU_KBD_K_CON"] = Toggle_Button("CNI MU KBD K Select", CNI_MU.pilot_CNI_MU_KBD_K)
elements["pilot_CNI_MU_KBD_L_CON"] = Toggle_Button("CNI MU KBD L Select", CNI_MU.pilot_CNI_MU_KBD_L)
elements["pilot_CNI_MU_KBD_M_CON"] = Toggle_Button("CNI MU KBD M Select", CNI_MU.pilot_CNI_MU_KBD_M)
elements["pilot_CNI_MU_KBD_N_CON"] = Toggle_Button("CNI MU KBD N Select", CNI_MU.pilot_CNI_MU_KBD_N)
elements["pilot_CNI_MU_KBD_O_CON"] = Toggle_Button("CNI MU KBD O Select", CNI_MU.pilot_CNI_MU_KBD_O)
elements["pilot_CNI_MU_KBD_P_CON"] = Toggle_Button("CNI MU KBD P Select", CNI_MU.pilot_CNI_MU_KBD_P)
elements["pilot_CNI_MU_KBD_Q_CON"] = Toggle_Button("CNI MU KBD Q Select", CNI_MU.pilot_CNI_MU_KBD_Q)
elements["pilot_CNI_MU_KBD_R_CON"] = Toggle_Button("CNI MU KBD R Select", CNI_MU.pilot_CNI_MU_KBD_R)
elements["pilot_CNI_MU_KBD_S_CON"] = Toggle_Button("CNI MU KBD S Select", CNI_MU.pilot_CNI_MU_KBD_S)
elements["pilot_CNI_MU_KBD_T_CON"] = Toggle_Button("CNI MU KBD T Select", CNI_MU.pilot_CNI_MU_KBD_T)
elements["pilot_CNI_MU_KBD_U_CON"] = Toggle_Button("CNI MU KBD U Select", CNI_MU.pilot_CNI_MU_KBD_U)
elements["pilot_CNI_MU_KBD_V_CON"] = Toggle_Button("CNI MU KBD V Select", CNI_MU.pilot_CNI_MU_KBD_V)
elements["pilot_CNI_MU_KBD_W_CON"] = Toggle_Button("CNI MU KBD W Select", CNI_MU.pilot_CNI_MU_KBD_W)
elements["pilot_CNI_MU_KBD_X_CON"] = Toggle_Button("CNI MU KBD X Select", CNI_MU.pilot_CNI_MU_KBD_X)
elements["pilot_CNI_MU_KBD_Y_CON"] = Toggle_Button("CNI MU KBD Y Select", CNI_MU.pilot_CNI_MU_KBD_Y)
elements["pilot_CNI_MU_KBD_Z_CON"] = Toggle_Button("CNI MU KBD Z Select", CNI_MU.pilot_CNI_MU_KBD_Z)
elements["pilot_CNI_MU_KBD_UNDERSCORE_CON"] = Toggle_Button("CNI MU KBD _ Select", CNI_MU.pilot_CNI_MU_KBD_UNDERSCORE)
elements["pilot_CNI_MU_KBD_FORWARDSLASH_CON"] = Toggle_Button("CNI MU KBD / Select", CNI_MU.pilot_CNI_MU_KBD_FORWARDSLASH)
elements["pilot_CNI_MU_KBD_DEL_CON"] = Toggle_Button("CNI MU KBD DEL Select", CNI_MU.pilot_CNI_MU_KBD_DEL)
elements["pilot_CNI_MU_KBD_CLR_CON"] = Toggle_Button("CNI MU KBD CLR Select", CNI_MU.pilot_CNI_MU_KBD_CLR)
elements["PILOT_NetSync_CON"] = Toggle_Button("Network Sync On/Off", CNI_MU.PILOT_Network_Sync)
		------------------------------------------------------------	
elements["copilot_CNI_MU_SelectKey_001_CON"] = Toggle_Button("CNI MU SelectKey 1", CNI_MU.copilot_CNI_MU_SelectKey_001)
elements["copilot_CNI_MU_SelectKey_002_CON"] = Toggle_Button("CNI MU SelectKey 2", CNI_MU.copilot_CNI_MU_SelectKey_002)
elements["copilot_CNI_MU_SelectKey_003_CON"] = Toggle_Button("CNI MU SelectKey 3", CNI_MU.copilot_CNI_MU_SelectKey_003)
elements["copilot_CNI_MU_SelectKey_004_CON"] = Toggle_Button("CNI MU SelectKey 4", CNI_MU.copilot_CNI_MU_SelectKey_004)
elements["copilot_CNI_MU_SelectKey_005_CON"] = Toggle_Button("CNI MU SelectKey 5", CNI_MU.copilot_CNI_MU_SelectKey_005)
elements["copilot_CNI_MU_SelectKey_006_CON"] = Toggle_Button("CNI MU SelectKey 6", CNI_MU.copilot_CNI_MU_SelectKey_006)
elements["copilot_CNI_MU_SelectKey_007_CON"] = Toggle_Button("CNI MU SelectKey 7", CNI_MU.copilot_CNI_MU_SelectKey_007)
elements["copilot_CNI_MU_SelectKey_008_CON"] = Toggle_Button("CNI MU SelectKey 8", CNI_MU.copilot_CNI_MU_SelectKey_008)
elements["copilot_CNI_MU_SelectKey_009_CON"] = Toggle_Button("CNI MU SelectKey 9", CNI_MU.copilot_CNI_MU_SelectKey_009)
elements["copilot_CNI_MU_SelectKey_010_CON"] = Toggle_Button("CNI MU SelectKey 10", CNI_MU.copilot_CNI_MU_SelectKey_010)
elements["copilot_CNI_MU_SelectKey_011_CON"] = Toggle_Button("CNI MU SelectKey 11", CNI_MU.copilot_CNI_MU_SelectKey_011)
elements["copilot_CNI_MU_SelectKey_012_CON"] = Toggle_Button("CNI MU SelectKey 12", CNI_MU.copilot_CNI_MU_SelectKey_012)
elements["copilot_CNI_MU_CommTune_CON"] = Toggle_Button("CNI MU Comm Tune Select", CNI_MU.copilot_CNI_MU_CommTune)
elements["copilot_CNI_MU_TOLD_CON"] = Toggle_Button("CNI MU TOLD Select", CNI_MU.copilot_CNI_MU_TOLD)
elements["copilot_CNI_MU_NAV_CTRL_CON"] = Toggle_Button("CNI MU NAV CTRL Select", CNI_MU.copilot_CNI_MU_NAV_CTRL)
elements["copilot_CNI_MU_INDEX_CON"] = Toggle_Button("CNI MU INDEX Select", CNI_MU.copilot_CNI_MU_INDEX)
elements["copilot_CNI_MU_EXEC_CON"] = Toggle_Button("CNI MU EXEC Select", CNI_MU.copilot_CNI_MU_EXEC)
elements["copilot_CNI_MU_KBD_1_CON"] = Toggle_Button("CNI MU KBD 1 Select", CNI_MU.copilot_CNI_MU_KBD_1)
elements["copilot_CNI_MU_KBD_2_CON"] = Toggle_Button("CNI MU KBD 2 Select", CNI_MU.copilot_CNI_MU_KBD_2)
elements["copilot_CNI_MU_KBD_3_CON"] = Toggle_Button("CNI MU KBD 3 Select", CNI_MU.copilot_CNI_MU_KBD_3)
elements["copilot_CNI_MU_KBD_4_CON"] = Toggle_Button("CNI MU KBD 4 Select", CNI_MU.copilot_CNI_MU_KBD_4)
elements["copilot_CNI_MU_KBD_5_CON"] = Toggle_Button("CNI MU KBD 5 Select", CNI_MU.copilot_CNI_MU_KBD_5)
elements["copilot_CNI_MU_KBD_6_CON"] = Toggle_Button("CNI MU KBD 6 Select", CNI_MU.copilot_CNI_MU_KBD_6)
elements["copilot_CNI_MU_KBD_7_CON"] = Toggle_Button("CNI MU KBD 7 Select", CNI_MU.copilot_CNI_MU_KBD_7)
elements["copilot_CNI_MU_KBD_8_CON"] = Toggle_Button("CNI MU KBD 8 Select", CNI_MU.copilot_CNI_MU_KBD_8)
elements["copilot_CNI_MU_KBD_9_CON"] = Toggle_Button("CNI MU KBD 9 Select", CNI_MU.copilot_CNI_MU_KBD_9)
elements["copilot_CNI_MU_KBD_dot_CON"] = Toggle_Button("CNI MU KBD . Select", CNI_MU.copilot_CNI_MU_KBD_dot)
elements["copilot_CNI_MU_KBD_0_CON"] = Toggle_Button("CNI MU KBD 0 Select", CNI_MU.copilot_CNI_MU_KBD_0)
elements["copilot_CNI_MU_KBD_plusmin_CON"] = Toggle_Button("CNI MU KBD +/- Select", CNI_MU.copilot_CNI_MU_KBD_plusmin)
elements["copilot_CNI_MU_KBD_A_CON"] = Toggle_Button("CNI MU KBD A Select", CNI_MU.copilot_CNI_MU_KBD_A)
elements["copilot_CNI_MU_KBD_B_CON"] = Toggle_Button("CNI MU KBD B Select", CNI_MU.copilot_CNI_MU_KBD_B)
elements["copilot_CNI_MU_KBD_C_CON"] = Toggle_Button("CNI MU KBD C Select", CNI_MU.copilot_CNI_MU_KBD_C)
elements["copilot_CNI_MU_KBD_D_CON"] = Toggle_Button("CNI MU KBD R Select", CNI_MU.copilot_CNI_MU_KBD_D)
elements["copilot_CNI_MU_KBD_E_CON"] = Toggle_Button("CNI MU KBD E Select", CNI_MU.copilot_CNI_MU_KBD_E)
elements["copilot_CNI_MU_KBD_F_CON"] = Toggle_Button("CNI MU KBD F Select", CNI_MU.copilot_CNI_MU_KBD_F)
elements["copilot_CNI_MU_KBD_G_CON"] = Toggle_Button("CNI MU KBD G Select", CNI_MU.copilot_CNI_MU_KBD_G)
elements["copilot_CNI_MU_KBD_H_CON"] = Toggle_Button("CNI MU KBD H Select", CNI_MU.copilot_CNI_MU_KBD_H)
elements["copilot_CNI_MU_KBD_I_CON"] = Toggle_Button("CNI MU KBD I Select", CNI_MU.copilot_CNI_MU_KBD_I)
elements["copilot_CNI_MU_KBD_J_CON"] = Toggle_Button("CNI MU KBD J Select", CNI_MU.copilot_CNI_MU_KBD_J)
elements["copilot_CNI_MU_KBD_K_CON"] = Toggle_Button("CNI MU KBD K Select", CNI_MU.copilot_CNI_MU_KBD_K)
elements["copilot_CNI_MU_KBD_L_CON"] = Toggle_Button("CNI MU KBD L Select", CNI_MU.copilot_CNI_MU_KBD_L)
elements["copilot_CNI_MU_KBD_M_CON"] = Toggle_Button("CNI MU KBD M Select", CNI_MU.copilot_CNI_MU_KBD_M)
elements["copilot_CNI_MU_KBD_N_CON"] = Toggle_Button("CNI MU KBD N Select", CNI_MU.copilot_CNI_MU_KBD_N)
elements["copilot_CNI_MU_KBD_O_CON"] = Toggle_Button("CNI MU KBD O Select", CNI_MU.copilot_CNI_MU_KBD_O)
elements["copilot_CNI_MU_KBD_P_CON"] = Toggle_Button("CNI MU KBD P Select", CNI_MU.copilot_CNI_MU_KBD_P)
elements["copilot_CNI_MU_KBD_Q_CON"] = Toggle_Button("CNI MU KBD Q Select", CNI_MU.copilot_CNI_MU_KBD_Q)
elements["copilot_CNI_MU_KBD_R_CON"] = Toggle_Button("CNI MU KBD R Select", CNI_MU.copilot_CNI_MU_KBD_R)
elements["copilot_CNI_MU_KBD_S_CON"] = Toggle_Button("CNI MU KBD S Select", CNI_MU.copilot_CNI_MU_KBD_S)
elements["copilot_CNI_MU_KBD_T_CON"] = Toggle_Button("CNI MU KBD T Select", CNI_MU.copilot_CNI_MU_KBD_T)
elements["copilot_CNI_MU_KBD_U_CON"] = Toggle_Button("CNI MU KBD U Select", CNI_MU.copilot_CNI_MU_KBD_U)
elements["copilot_CNI_MU_KBD_V_CON"] = Toggle_Button("CNI MU KBD V Select", CNI_MU.copilot_CNI_MU_KBD_V)
elements["copilot_CNI_MU_KBD_W_CON"] = Toggle_Button("CNI MU KBD W Select", CNI_MU.copilot_CNI_MU_KBD_W)
elements["copilot_CNI_MU_KBD_X_CON"] = Toggle_Button("CNI MU KBD X Select", CNI_MU.copilot_CNI_MU_KBD_X)
elements["copilot_CNI_MU_KBD_Y_CON"] = Toggle_Button("CNI MU KBD Y Select", CNI_MU.copilot_CNI_MU_KBD_Y)
elements["copilot_CNI_MU_KBD_Z_CON"] = Toggle_Button("CNI MU KBD Z Select", CNI_MU.copilot_CNI_MU_KBD_Z)
elements["copilot_CNI_MU_KBD_UNDERSCORE_CON"] = Toggle_Button("CNI MU KBD _ Select", CNI_MU.copilot_CNI_MU_KBD_UNDERSCORE)
elements["copilot_CNI_MU_KBD_FORWARDSLASH_CON"] = Toggle_Button("CNI MU KBD / Select", CNI_MU.copilot_CNI_MU_KBD_FORWARDSLASH)
elements["copilot_CNI_MU_KBD_DEL_CON"] = Toggle_Button("CNI MU KBD DEL Select", CNI_MU.copilot_CNI_MU_KBD_DEL)
elements["copilot_CNI_MU_KBD_CLR_CON"] = Toggle_Button("CNI MU KBD CLR Select", CNI_MU.copilot_CNI_MU_KBD_CLR)
elements["COPILOT_NetSync_CON"] = Toggle_Button("Network Sync On/Off", CNI_MU.COPILOT_Network_Sync)
------------------------------------------------------------------------ FUEL_MANAGEMENT_PANEL
elements["Left_Dump_Switch_Guard_CON"] = Toggle_Switch("Left Dump Switch Guard", FUEL_MANAGEMENT_PANEL.Left_Dump_Switch_Guard)
elements["Left_Dump_Switch_CON"] = Toggle_Switch("Left Dump Switch", FUEL_MANAGEMENT_PANEL.Left_Dump_Switch)
elements["Right_Dump_Switch_Guard_CON"] = Toggle_Switch("Right Dump Switch Guard", FUEL_MANAGEMENT_PANEL.Right_Dump_Switch_Guard)
elements["Right_Dump_Switch_CON"] = Toggle_Switch("Right Dump Switch", FUEL_MANAGEMENT_PANEL.Right_Dump_Switch)
elements["Left_External_Transfer_Switch_CON"] = Toggle_Switch("Left External Transfer Switch", FUEL_MANAGEMENT_PANEL.Left_External_Transfer_Switch)
------------------------------------------------------------------------ AERIAL_DELIVERY_PANEL
elements["Air_Deflector_switch_CON"] = Toggle_Switch("Air deflector open/close", AERIAL_DELIVERY_PANEL.Air_Deflector_Switch)
elements["Cockpit_Cargo_DoorRamp_Switch_CON"] = Switch_Up_Release("Cargo Door/Ramp Airdrop", AERIAL_DELIVERY_PANEL.Cockpit_Cargo_DoorRamp_Switch)
elements["Computer_Drop_Switch_CON"] = Toggle_Switch("Computer Drop Switch", AERIAL_DELIVERY_PANEL.Computer_Drop_Switch)
elements["Bell_Alarm_Switch_Guard_CON"] = Toggle_Switch("Bell Alarm Switch Guard", AERIAL_DELIVERY_PANEL.Bell_Alarm_Switch_Guard)
elements["Bell_Alarm_Switch_CON"] = Toggle_Switch("Bell Alarm Switch", AERIAL_DELIVERY_PANEL.Bell_Alarm_Switch)
elements["Chute_Release_Guard_CON"] = Toggle_Switch("Chute Release Guard", AERIAL_DELIVERY_PANEL.Chute_Release_Guard)
elements["Chute_Release_Trigger_CON"] = Button_Press_Release("Chute Release Trigger", AERIAL_DELIVERY_PANEL.Chute_Release_Trigger_Down, AERIAL_DELIVERY_PANEL.Chute_Release_Trigger_Up)
elements["Aerial_Delivery_Panel_Base_Caution_Switch_CON"] = Toggle_Button("Caution Switch Light", AERIAL_DELIVERY_PANEL.Caution_Switch_Light)
elements["Aerial_Delivery_Panel_Base_Jump_Switch_CON"] = Toggle_Button("Jump Switch Light", AERIAL_DELIVERY_PANEL.Jump_Switch_Light)
------------------------------------------------------------------------------------------------------------- Load Master Station
elements["LMPanel_On_Off_Switch_CON"] = Knob_Rotate("Power Switch", LOADMASTER_STATION.LMPanel_Power)
elements["LMPanel_Pages_Select_CON"] = Toggle_Switch("Lock Control / Pages", LOADMASTER_STATION.LMPanel_Pages_Select)
elements["LMPanel_CofG_Page_Select_CON"] = Toggle_Switch("Lock Control / CofG Page", LOADMASTER_STATION.LMPanel_CofG_Page_Select)
------------------------------------------------------------------------ RAMP_EMERGENCY_CONTROL_PANEL
elements["Cargo_Door_Ramp_Switch_CON"] = Toggle_Switch("Cargo Door/Ramp Airdrop", RAMP_EMERGENCY_CONTROL_PANEL.Loadmaster_Cargo_DoorRamp_Switch)
elements["Cargo_Jett_Locks_FWD_Switch_Guard_CON"] = Toggle_Switch("Cargo Jettison Locks FWD Guard", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jett_Locks_FWD_Switch_Guard)
elements["Cargo_Jett_Locks_FWD_Switch_CON"] = Toggle_Switch("Cargo Jettison Locks FWD Switch", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jett_Locks_FWD_Switch)
elements["Cargo_Jett_Locks_MID_Switch_Guard_CON"] = Toggle_Switch("Cargo Jettison Locks MID Guard", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jett_Locks_MID_Switch_Guard)
elements["Cargo_Jett_Locks_MID_Switch_CON"] = Toggle_Switch("Cargo Jettison Locks MID Switch", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jett_Locks_MID_Switch)
elements["Cargo_Jett_Locks_AFT_Switch_Guard_CON"] = Toggle_Switch("Cargo Jettison Locks AFT Guard", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jett_Locks_AFT_Switch_Guard)
elements["Cargo_Jett_Locks_AFT_Switch_CON"] = Toggle_Switch("Cargo Jettison Locks AFT Switch", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Jett_Locks_AFT_Switch)
elements["Airdrop_Drogue_Switch_Guard_CON"] = Toggle_Switch("Cargo Airdrop Drogue Jettison Guard", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Airdrop_Drogue_Jettison_Guard)
elements["Airdrop_Drogue_Switch_CON"] = Toggle_Switch("Cargo Airdrop Drogue Jettison Switch", RAMP_EMERGENCY_CONTROL_PANEL.Cargo_Airdrop_Drogue_Jettison_Switch)
------------------------------------------------------------------------------------------------------------------------------- RAMP_CONTROL_PANEL
elements["Aft_Aux_Hydraulic_Switch_CON"] = Toggle_Switch("Aux Hydraulic pump", RAMP_CONTROL_PANEL.Aft_Aux_Hydraulic_Switch)
elements["Aft_Cargo_Door_Switch_CON"] = Switch_Up_Down_Release("Aft Cargo Door Switch", RAMP_CONTROL_PANEL.Aft_Cargo_Door_Switch)
elements["Aft_Cargo_Ramp_Switch_CON"] = Switch_Up_Down_Release("Aft Cargo Ramp Switch", RAMP_CONTROL_PANEL.Aft_Cargo_Ramp_Switch)
------------------------------------------------------------------------ MISCELLANEOUS
elements["Tacview_Pilot_Attach_Lever_CON"] = Toggle_Switch("Copilot Tacview Attach Lever", MISCELLANEOUS.Pilot_Tacview_Attach_Lever)
elements["TacView_Pilot_power_CON"] = Toggle_Button("Copilot Tacview power", MISCELLANEOUS.TacView_Pilot_power)
elements["Rocket_Assist_Guard_CON"] = Toggle_Switch("Rocket Assisted Takeoff Arm Guard", MISCELLANEOUS.Rocket_Assist_Arm_Switch_Guard)
elements["Rocket_Assist_Switch_CON"] = Toggle_Switch("Rocket Assisted Takeoff Arm Switch", MISCELLANEOUS.Rocket_Assist_Arm_Switch)
elements["Rocket_Assist_Fire_Trigger_CON"] = Button_Press_Release("Rocket Assisted Takeoff Fire Trigger", MISCELLANEOUS.Rocket_Assist_Fire_Trigger_Button_Down, MISCELLANEOUS.Rocket_Assist_Fire_Trigger_Button_Up)
elements["ADI_Knob_CON"] = Knob_Rotate("Pitch Adjust Knob", MISCELLANEOUS.No_Action)
elements["Park_Brake_CON"] = Switch_Up_Down_Release("Park Brake", MISCELLANEOUS.Park_Brake_Mouse)
elements["Crew_Entrance_Door_CON"] = Toggle_Switch("Crew Entrance Door Open/Close", MISCELLANEOUS.Crew_Entrance_Door_Handle)
elements["Paratroop_Door_Port_CON"] = Toggle_Switch("Paratroop Port Door Open/Close", MISCELLANEOUS.Paratroop_Port_Door_Handle)
elements["Paratroop_Door_Starboard_CON"] = Toggle_Switch("Paratroop Starboard Door Open/Close", MISCELLANEOUS.Paratroop_Starboard_Door_Handle)
elements["Flightdeck_Pilot_Window_Handle_CON"] = Toggle_Switch("Flightdeck Window Open/Close", MISCELLANEOUS.Flightdeck_Pilot_Window_Handle)
elements["Flightdeck_Copilot_Window_Handle_CON"] = Toggle_Switch("Flightdeck Window Open/Close", MISCELLANEOUS.Flightdeck_Copilot_Window_Handle)
-------------------------------------------------------------------------------------------------------------------------------------------------- MPCD_INTERFACES
------------------------------------------------------------------------ MPCD_LEFT_INTERFACE
elements["MPCD1_brightness_CON"] = Toggle_Switch("MPCD Left brightness", MPCD_INTERFACE.MPCD1_brightness)
elements["MPCD1_Btn1_CON"] = Toggle_Button("Btn 1", MPCD_INTERFACE.MPCD1_Btn1)
elements["MPCD1_Btn2_CON"] = Toggle_Button("Btn 2", MPCD_INTERFACE.MPCD1_Btn2)
elements["MPCD1_Btn3_CON"] = Toggle_Button("Btn 3", MPCD_INTERFACE.MPCD1_Btn3)
elements["MPCD1_Btn4_CON"] = Toggle_Button("Btn 4", MPCD_INTERFACE.MPCD1_Btn4)
elements["MPCD1_Btn5_CON"] = Toggle_Button("Btn 5", MPCD_INTERFACE.MPCD1_Btn5)
elements["MPCD1_Btn6_CON"] = Toggle_Button("Btn 6", MPCD_INTERFACE.MPCD1_Btn6)
elements["MPCD1_Btn7_CON"] = Toggle_Button("Btn 7", MPCD_INTERFACE.MPCD1_Btn7)
elements["MPCD1_Btn8_CON"] = Toggle_Button("Btn 8", MPCD_INTERFACE.MPCD1_Btn8)
elements["MPCD1_Btn9_CON"] = Toggle_Button("Btn 9", MPCD_INTERFACE.MPCD1_Btn9)
elements["MPCD1_Btn10_CON"] = Toggle_Button("Btn 10", MPCD_INTERFACE.MPCD1_Btn10)
elements["MPCD1_Btn11_CON"] = Toggle_Button("Btn 11", MPCD_INTERFACE.MPCD1_Btn11)
elements["MPCD1_Btn12_CON"] = Toggle_Button("Btn 12", MPCD_INTERFACE.MPCD1_Btn12)
elements["MPCD1_Btn13_CON"] = Toggle_Button("Btn 13", MPCD_INTERFACE.MPCD1_Btn13)
elements["MPCD1_Btn14_CON"] = Toggle_Button("Btn 14", MPCD_INTERFACE.MPCD1_Btn14)
elements["MPCD1_Btn15_CON"] = Toggle_Button("Btn 15", MPCD_INTERFACE.MPCD1_Btn15)
elements["MPCD1_Btn16_CON"] = Toggle_Button("Btn 16", MPCD_INTERFACE.MPCD1_Btn16)
elements["MPCD1_Btn17_CON"] = Toggle_Button("Btn 17", MPCD_INTERFACE.MPCD1_Btn17)
elements["MPCD1_Btn18_CON"] = Toggle_Button("Btn 18", MPCD_INTERFACE.MPCD1_Btn18)
elements["MPCD1_Btn19_CON"] = Toggle_Button("Btn 19", MPCD_INTERFACE.MPCD1_Btn19)
elements["MPCD1_Btn20_CON"] = Toggle_Button("Btn 20", MPCD_INTERFACE.MPCD1_Btn20)

------------------------------------------------------------------------ MPCD_RIGHT_INTERFACE
elements["MPCD2_brightness_CON"] = Toggle_Switch("MPCD Right brightness", MPCD_INTERFACE.MPCD2_brightness)
elements["MPCD2_Btn1_CON"] = Toggle_Button("Btn 1", MPCD_INTERFACE.MPCD2_Btn1)
elements["MPCD2_Btn2_CON"] = Toggle_Button("Btn 2", MPCD_INTERFACE.MPCD2_Btn2)
elements["MPCD2_Btn3_CON"] = Toggle_Button("Btn 3", MPCD_INTERFACE.MPCD2_Btn3)
elements["MPCD2_Btn4_CON"] = Toggle_Button("Btn 4", MPCD_INTERFACE.MPCD2_Btn4)
elements["MPCD2_Btn5_CON"] = Toggle_Button("Btn 5", MPCD_INTERFACE.MPCD2_Btn5)
elements["MPCD2_Btn6_CON"] = Toggle_Button("Btn 6", MPCD_INTERFACE.MPCD2_Btn6)
elements["MPCD2_Btn7_CON"] = Toggle_Button("Btn 7", MPCD_INTERFACE.MPCD2_Btn7)
elements["MPCD2_Btn8_CON"] = Toggle_Button("Btn 8", MPCD_INTERFACE.MPCD2_Btn8)
elements["MPCD2_Btn9_CON"] = Toggle_Button("Btn 9", MPCD_INTERFACE.MPCD2_Btn9)
elements["MPCD2_Btn10_CON"] = Toggle_Button("Btn 10", MPCD_INTERFACE.MPCD2_Btn10)
elements["MPCD2_Btn11_CON"] = Toggle_Button("Btn 11", MPCD_INTERFACE.MPCD2_Btn11)
elements["MPCD2_Btn12_CON"] = Toggle_Button("Btn 12", MPCD_INTERFACE.MPCD2_Btn12)
elements["MPCD2_Btn13_CON"] = Toggle_Button("Btn 13", MPCD_INTERFACE.MPCD2_Btn13)
elements["MPCD2_Btn14_CON"] = Toggle_Button("Btn 14", MPCD_INTERFACE.MPCD2_Btn14)
elements["MPCD2_Btn15_CON"] = Toggle_Button("Btn 15", MPCD_INTERFACE.MPCD2_Btn15)
elements["MPCD2_Btn16_CON"] = Toggle_Button("Btn 16", MPCD_INTERFACE.MPCD2_Btn16)
elements["MPCD2_Btn17_CON"] = Toggle_Button("Btn 17", MPCD_INTERFACE.MPCD2_Btn17)
elements["MPCD2_Btn18_CON"] = Toggle_Button("Btn 18", MPCD_INTERFACE.MPCD2_Btn18)
elements["MPCD2_Btn19_CON"] = Toggle_Button("Btn 19", MPCD_INTERFACE.MPCD2_Btn19)
elements["MPCD2_Btn20_CON"] = Toggle_Button("Btn 20", MPCD_INTERFACE.MPCD2_Btn20)
------------------------------------------------------------------------ BATTLE_STATION_COMMANDS
elements["Battle_Station_Power_CON"] = Toggle_Switch("Battle Station Power", BATTLE_STATION_COMMANDS.Battle_Station_Power)
elements["Cannon_Track_TPOD_CON"] = Toggle_Switch("Cannon slave to TPOD On/Off", BATTLE_STATION_COMMANDS.Cannon_Slave_TPOD)
elements["Cannon_Stabilizer_switch_CON"] = Toggle_Switch("Cannon Stabilizer On/Off", BATTLE_STATION_COMMANDS.Cannon_Stabilizer)
elements["FLIR_DMT_Power_switch_CON"] = Toggle_Switch("FLIR/DMT Power On/Off", BATTLE_STATION_COMMANDS.FLIR_DMT_Power_switch)
elements["TPOD_Direction_select_switch_CON"] = Toggle_Switch("TPOD 90deg left switch", BATTLE_STATION_COMMANDS.TPOD_Direction_select_switch)
elements["Master_Arm_Guard_CON"] = Toggle_Switch("Guard Master Arm Switch", BATTLE_STATION_COMMANDS.Master_Arm_Switch_Guard)
elements["Master_Arm_Switch_CON"] = Toggle_Switch("Master Arm Switch", BATTLE_STATION_COMMANDS.Master_Arm_Switch)
elements["BS_Missile_Cage_Uncage_CON"] = Toggle_Button("Cage/Uncage", BATTLE_STATION_COMMANDS.CAGE_UNCAGE)
elements["BS_Sensor_Select_FWD_CON"] = Button_Press_Release("Sensor Select FWD: INS, IRMV/EOMV", BATTLE_STATION_COMMANDS.Sensor_Select_FWD, BATTLE_STATION_COMMANDS.Sensor_Select_RELEASE)
elements["BS_Sensor_Select_AFT_CON"] = Button_Press_Release("Sensor Select AFT: DMT: LST/TV", BATTLE_STATION_COMMANDS.Sensor_Select_AFT, BATTLE_STATION_COMMANDS.Sensor_Select_RELEASE)
elements["BS_Sensor_Select_LEFT_CON"] = Button_Press_Release("Sensor Select LEFT: MAP Center/Decenter", BATTLE_STATION_COMMANDS.Sensor_Select_LEFT, BATTLE_STATION_COMMANDS.Sensor_Select_RELEASE)
elements["BS_Sensor_Select_RIGHT_CON"] = Button_Press_Release("Sensor Select RIGHT: FLIR/HUD-BH/WH", BATTLE_STATION_COMMANDS.Sensor_Select_RIGHT, BATTLE_STATION_COMMANDS.Sensor_Select_RELEASE)
elements["BS_Sensor_Select_DOWN_CON"] = Button_Press_Release("Sensor Select DOWN: HUD Scene Reject/TGP", BATTLE_STATION_COMMANDS.Sensor_Select_DOWN, BATTLE_STATION_COMMANDS.Sensor_Select_RELEASE)
elements["BS_AG_Target_Undesignate_CON"] = Button_Press_Release("AG Target Undesignate/NWS/FOV", BATTLE_STATION_COMMANDS.Target_UNDESIGNATE, BATTLE_STATION_COMMANDS.Target_UNDESIGNATE_RELEASE)
elements["BS_TGT_Wpt_Designator_CON"] = Button_Press_Release("Target Waypoint Designator", BATTLE_STATION_COMMANDS.TGT_Wpt_Designator_DOWN, BATTLE_STATION_COMMANDS.TGT_Wpt_Designator_RELEASE)
elements["BS_TDC_Down_CON"] = Button_Press_Release("TDC Down (Action Position)", BATTLE_STATION_COMMANDS.TDC_DOWN, BATTLE_STATION_COMMANDS.TDC_DOWN_RELEASE)
elements["BS_TDC_Action_CON"] = Toggle_Button("TDC Action/No Action", BATTLE_STATION_COMMANDS.TDC_ACTION_NOACTION)
elements["BS_TDC_LEFT_CON"] = Button_Press_Release("TDC Left", BATTLE_STATION_COMMANDS.TDC_LEFT, BATTLE_STATION_COMMANDS.TDC_RELEASE)
elements["BS_TDC_Forward_CON"] = Button_Press_Release("TDC Forward", BATTLE_STATION_COMMANDS.TDC_FORWARD, BATTLE_STATION_COMMANDS.TDC_RELEASE)
elements["BS_TDC_Right_CON"] = Button_Press_Release("TDC Right", BATTLE_STATION_COMMANDS.TDC_RIGHT, BATTLE_STATION_COMMANDS.TDC_RELEASE)
elements["BS_TDC_Aft_CON"] = Button_Press_Release("TDC Aft", BATTLE_STATION_COMMANDS.TDC_AFT, BATTLE_STATION_COMMANDS.TDC_RELEASE)
elements["Pylon_Bomb_Fuse_Switch_CON"] = Switch_Up_Release("Bomb Fuse Select", BATTLE_STATION_COMMANDS.Pylon_Bomb_Fuse_Switch)
elements["Pylon_Control_Reset_Switch_CON"] = Switch_Up_Release("Reset Pylon Selections", BATTLE_STATION_COMMANDS.Pylon_Control_Reset_Switch)
elements["Pylon1_Control_Switch_CON"] = Switch_Up_Release("Pylon1 Select", BATTLE_STATION_COMMANDS.Pylon1_Control_Switch)
elements["Pylon2_Control_Switch_CON"] = Switch_Up_Release("Pylon2 Select", BATTLE_STATION_COMMANDS.Pylon2_Control_Switch)
elements["Pylon3_Control_Switch_CON"] = Switch_Up_Release("PylonM1 Select", BATTLE_STATION_COMMANDS.Pylon3_Control_Switch)
elements["Pylon4_Control_Switch_CON"] = Switch_Up_Release("PylonM2 Select", BATTLE_STATION_COMMANDS.Pylon4_Control_Switch)
elements["Pylons_Jettison_Switch_Guard_CON"] = Toggle_Switch("Pylons Jettison Switch Guard", BATTLE_STATION_COMMANDS.Pylons_Jettison_Switch_Guard)
elements["Pylons_Jettison_Switch_CON"] = Toggle_Switch("Pylons Jettison Switch", BATTLE_STATION_COMMANDS.Pylons_Jettison_Switch)
elements["Cannon_Select_CON"] = Toggle_Switch("Select Cannon Station", BATTLE_STATION_COMMANDS.Cannon_Station_Select)
elements["Cannon_Release_CON"] = Button_Press_Release("Trigger: Fire Cannon", BATTLE_STATION_COMMANDS.Cannon_Release_On, BATTLE_STATION_COMMANDS.Cannon_Release_Off)
elements["Pylon_Release_CON"] = Button_Press_Release("Pickle: Pylon Release", BATTLE_STATION_COMMANDS.Pylon_Release_On, BATTLE_STATION_COMMANDS.Pylon_Release_Off)

------------------------------------------------------------------------ Automatic_Flight_Control_System_Panel
elements["AFCS_Pilot_Engage_Lever_CON"] = Toggle_Switch("AFCS Pilot Engage Lever", Automatic_Flight_Control_System_Panel.PILOT_AFCS_Engage_Lever)
elements["AFCS_Copilot_Engage_Lever_CON"] = Toggle_Switch("AFCS Copilot Engage Lever", Automatic_Flight_Control_System_Panel.COPILOT_AFCS_Engage_Lever)
elements["AFCS_Pitch_Switch_CON"] = Toggle_Switch("AFCS Pitch Switch", Automatic_Flight_Control_System_Panel.AFCS_Pitch_Switch)
elements["AFCS_Lateral_Switch_CON"] = Toggle_Switch("AFCS Lateral Switch", Automatic_Flight_Control_System_Panel.AFCS_Lateral_Switch)
elements["AFCS_Turn_Control_CON"] = Knob_Rotate("AFCS Turn Control", Automatic_Flight_Control_System_Panel.AFCS_Turn_Control)
elements["AFCS_Pitch_Control_CON"] = Toggle_Switch("AFCS Pitch Control", Automatic_Flight_Control_System_Panel.AFCS_Pitch_Control)
------------------------------------------------------------------------ HDG_CRS_Selector_Control_Panel
elements["pilot_altimeter_setting_knob_CON"] = Knob_Rotate_Press("Altitude alert set/reset knob", REFERENCE_SET_MODE_SELECT_PANELS.PILOT_altitude_alert_Reset_knob, REFERENCE_SET_MODE_SELECT_PANELS.PILOT_altitude_alert_set_knob)
elements["Pilot_Heading_Selector_Control_CON"] = Knob_Rotate_Press("Heading Selector Control", HDG_CRS_Selector_Control_Panel.PILOT_HDG_RESET, HDG_CRS_Selector_Control_Panel.PILOT_HDG_SET)
elements["Pilot_Heading_Selector_Control_Mod_CON"] = Knob_Rotate_Press("Heading Selector Control", HDG_CRS_Selector_Control_Panel.PILOT_HDG_RESET, HDG_CRS_Selector_Control_Panel.PILOT_HDG_SET)
elements["Pilot_Course_Selector_Control_CON"] = Knob_Rotate("Course Selector Control", HDG_CRS_Selector_Control_Panel.PILOT_CRS_SET)
elements["Copilot_Heading_Selector_Control_CON"] = Knob_Rotate_Press("Heading Selector Control", HDG_CRS_Selector_Control_Panel.COPILOT_HDG_RESET, HDG_CRS_Selector_Control_Panel.COPILOT_HDG_SET)
elements["Copilot_Heading_Selector_Control_Mod_CON"] = Knob_Rotate_Press("Heading Selector Control", HDG_CRS_Selector_Control_Panel.COPILOT_HDG_RESET, HDG_CRS_Selector_Control_Panel.COPILOT_HDG_SET)
elements["Copilot_Course_Selector_Control_CON"] = Knob_Rotate("Course Selector Control", HDG_CRS_Selector_Control_Panel.COPILOT_CRS_SET)

------------------------------------------------------------------------ PILOT_LIGHTING_CONTROLS
elements["Master_Switch_Control_CON"] = Toggle_Switch("NVIS Master Switch Control", PILOT_LIGHTING_CONTROLS.Master_Switch_Control)
elements["Cockpit_Dome_Brighness_Control_CON"] = Knob_Rotate("Dome Brighness Control", PILOT_LIGHTING_CONTROLS.Cockpit_Dome_Brighness_Control)
elements["Pilot_Display_Master_Brighness_Control_CON"] = Knob_Rotate("Display Master Brighness Control", PILOT_LIGHTING_CONTROLS.Pilot_Display_Master_Brighness_Control)
------------------------------------------------------------------------ COPILOT_LIGHTING_CONTROLS
elements["Overhead_Panel_Flood_brighness_control_CON"] = Knob_Rotate("Overhead Panel Flood Brighness Control", COPILOT_LIGHTING_CONTROLS.Overhead_Panel_Flood_Brighness_Control)
elements["Copilot_Display_Master_Brighness_Control_CON"] = Knob_Rotate("Display Master Brighness Control", COPILOT_LIGHTING_CONTROLS.Copilot_Display_Master_Brighness_Control)
------------------------------------------------------------------------ AUGMENTED_CREW_LIGHTING_CONTROLS
elements["Augmented_Crew_Lighting_Flood_Control_CON"] = Knob_Rotate("Flood Brighness Control", AUGMENTED_CREW_LIGHTING_CONTROLS.Augmented_Crew_Lighting_Flood_Control)
------------------------------------------------------------------------ FWD_CARGO_LIGHTING_CONTROL_PANEL
elements["Fwd_Cargo_Lighting_Control_Panel_Dome_Brightness_CON"] = Knob_Rotate("Dome Brighness Control", FWD_CARGO_LIGHTING_CONTROL_PANEL.Fwd_Cargo_Lighting_Dome_Brightness_Control)
------------------------------------------------------------------------ AFT_CARGO_LIGHTING_CONTROL_PANEL
elements["Aft_Cargo_Lighting_Dome_Brightness_Control_CON"] = Knob_Rotate("Dome Brighness Control", AFT_CARGO_LIGHTING_CONTROL_PANEL.Aft_Cargo_Lighting_Dome_Brightness_Control)
elements["Aft_Cargo_Lighting_Jump_Platform_Control_CON"] = Toggle_Switch("Jump Platform Light", AFT_CARGO_LIGHTING_CONTROL_PANEL.Aft_Cargo_Lighting_Jump_Platform_Control)
elements["Aft_Cargo_Lighting_Ramp_Dome_Brightness_Control_CON"] = Knob_Rotate("Ramp Dome Brighness Control", AFT_CARGO_LIGHTING_CONTROL_PANEL.Aft_Cargo_Lighting_Ramp_Dome_Brightness_Control)
elements["Aft_Cargo_Ramp_Loading_Light_Switch_CON"] = Toggle_Switch("Ramp Loading Light", AFT_CARGO_LIGHTING_CONTROL_PANEL.Aft_Cargo_Ramp_Loading_Light_Switch)





-- Add more lines in command_defs.lua if needed
-- for i,o in pairs(elements) do
	-- if  o.class[1] == class_type.TUMB or 
	   -- (o.class[2]  and o.class[2] == class_type.TUMB) or
	   -- (o.class[3]  and o.class[3] == class_type.TUMB)  then
	   -- o.updatable = true
	   -- o.use_OBB   = true
	-- end
-- end










