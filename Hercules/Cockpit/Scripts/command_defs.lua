
local count = 0
local Offset = 13009
local function counter()
	count = count + 1
	return count
end

JOYSTICK =
{
	Roll = Offset + counter();
	Pitch = Offset + counter();
	Yaw = Offset + counter();
	BothThrottles = Offset + counter();
	LeftThrottle = Offset + counter();
	RightThrottle = Offset + counter();
	PedalBothBrake = Offset + counter();
	PedalLeftBrake = Offset + counter();
	PedalRightBrake = Offset + counter();
	NoseWheelSteering = Offset + counter();
}

DEBUG =
{
	DEBUG_Screen = Offset + counter();
	Click_Value1 = Offset + counter();
	Click_Value2 = Offset + counter();
	Click_Value3 = Offset + counter();
	Click_Value4 = Offset + counter();
	Click_Value5 = Offset + counter();
	Click_Value6 = Offset + counter();
	Click_Value7 = Offset + counter();
	Click_Value8 = Offset + counter();
	Click_Value9 = Offset + counter();
	Click_Value10 = Offset + counter();
}

Position_Control =
{
	Pilot_Seat = Offset + counter();
	Copilot_Seat = Offset + counter();
	Loadmaster_Station = Offset + counter();
	CargoRamp_Station = Offset + counter();
	Cannon_Target_Station = Offset + counter();
	Internal = Offset + counter();
	External = Offset + counter();
	F10_Map = Offset + counter();
}

ICS_PANEL =
{
	Radio_PTT_Keyb = Offset + counter();
	ICS_Silence_Keyb = Offset + counter();
	PILOT_ICS_VOL_KNOB_ROT = Offset + counter();
	PILOT_ICS_VOL_KNOB_PULL = Offset + counter();
	COPILOT_ICS_VOL_KNOB_ROT = Offset + counter();
	COPILOT_ICS_VOL_KNOB_PULL = Offset + counter();
	PILOT_ICS_UNDEF_KNOB_ROT = Offset + counter();
	COPILOT_ICS_UNDEF_KNOB_ROT = Offset + counter();
}


General_Packet_Send =
{
	NetCrewRequestControl = Offset + counter();
}

ELECTRICAL_PANEL =
{
	Battery_Relays_switch  = Offset + counter();
	external_power_APU_selector  = Offset + counter();
	Engine1_Generator_switch  = Offset + counter();
	Engine2_Generator_switch  = Offset + counter();
	Engine3_Generator_switch  = Offset + counter();
	Engine4_Generator_switch  = Offset + counter();
	battery_test_selector  = Offset + counter();
}

ENGINE_START_PANEL =
{
	Engine1_Start_Selector  = Offset + counter();
	Engine2_Start_Selector  = Offset + counter();
	Engine3_Start_Selector  = Offset + counter();
	Engine4_Start_Selector  = Offset + counter();
	Engine1_Start  = Offset + counter();
	Engine1_Stop  = Offset + counter();
	Engine2_Start  = Offset + counter();
	Engine2_Stop  = Offset + counter();
	Engine3_Start  = Offset + counter();
	Engine3_Stop  = Offset + counter();
	Engine4_Start  = Offset + counter();
	Engine4_Stop  = Offset + counter();
}

PROPELLER_CONTROL_PANEL =
{
	Engine1PropControl_selector  = Offset + counter();
	Engine2PropControl_selector  = Offset + counter();
	Engine3PropControl_selector  = Offset + counter();
	Engine4PropControl_selector  = Offset + counter();
}

THROTTLE_QUADRANT_ASSEMBLY =
{
	Throttle1_disabled  = Offset + counter();
	Throttle2_disabled  = Offset + counter();
	Throttle3_disabled  = Offset + counter();
	Throttle4_disabled  = Offset + counter();
	Engine1SpeedMode_switch  = Offset + counter();
	Engine2SpeedMode_switch  = Offset + counter();
	Engine3SpeedMode_switch  = Offset + counter();
	Engine4SpeedMode_switch  = Offset + counter();
}

APU_PANEL =
{
	APU_Selector_switch  = Offset + counter();
	APU_alarm_switch  = Offset + counter();
	APU_Start  = Offset + counter();
	APU_Stop  = Offset + counter();
}

FIRE_HANDLES =
{
	Engine1_fire_handle  = Offset + counter();
	Engine2_fire_handle  = Offset + counter();
	Engine3_fire_handle  = Offset + counter();
	Engine4_fire_handle  = Offset + counter();
	APU_fire_handle  = Offset + counter();
}

BLEED_AIR_PANEL =
{
	Bleed_Air_Switch_Engine1  = Offset + counter();
	Bleed_Air_Switch_Engine2  = Offset + counter();
	Bleed_Air_Switch_Engine3  = Offset + counter();
	Bleed_Air_Switch_Engine4  = Offset + counter();
	Bleed_Air_Switch_Leftwing_LisoValve  = Offset + counter();
	Bleed_Air_Switch_DivValve  = Offset + counter();
	Bleed_Air_Switch_Rightwing_LisoValve  = Offset + counter();
	Bleed_Air_Switch_APU  = Offset + counter();
}

LANDING_GEAR_LIGHTS_PANEL =
{
	gear_lever = Offset + counter();
	LeftLandingLight_OnOff_switch = Offset + counter();
	RightLandingLight_OnOff_switch = Offset + counter();
	LeftLandingLight_ExtHldRet_switch = Offset + counter();
	RightLandingLight_ExtHldRet_switch = Offset + counter();
	Taxi_Lights_OnOff_switch = Offset + counter();
	GearToggle = Offset + counter();
	GearUp = Offset + counter();
	GearDown = Offset + counter();
}

FLAPS =
{
	Lever  = Offset + counter();
	Down = Offset + counter();
	Up = Offset + counter();
	Zero_percent = Offset + counter();
	Fifty_percent = Offset + counter();
	Hunderd_percent = Offset + counter();
}

HYDRAULIC_CONTROL_PANEL =
{
	Cockpit_Aux_Hydraulic_Switch = Offset + counter();
	AntiSkid_switch = Offset + counter();
	Emergency_Brake_Sel_switch = Offset + counter();
	Engine_Pumps_Util_1_switch = Offset + counter();
	Engine_Pumps_Util_2_switch = Offset + counter();
	Engine_Pumps_Boost_3_switch = Offset + counter();
	Engine_Pumps_Boost_4_switch = Offset + counter();
	Suction_Boost_Pumps_Util_switch = Offset + counter();
	Suction_Boost_Pumps_Boost_switch = Offset + counter();
}

HUD_PANELS =
{
	PILOT_hud_contrast_control = Offset + counter();
	PILOT_hud_brightness_control = Offset + counter();
	PILOT_hud_combiner_latch = Offset + counter();
	PILOT_hud_stopwatch = Offset + counter();
	COPILOT_hud_contrast_control = Offset + counter();
	COPILOT_hud_brightness_control = Offset + counter();
	COPILOT_hud_combiner_latch = Offset + counter();
	COPILOT_hud_stopwatch = Offset + counter();
}

DISPLAY_BRIGHTNESS_CONTROL =
{
	hdd_001_brightness_control = Offset + counter();
	hdd_002_brightness_control = Offset + counter();
	hdd_003_brightness_control = Offset + counter();
	hdd_004_brightness_control = Offset + counter();
	PILOT_CNI_MU_brightness_control = Offset + counter();
	COPILOT_CNI_MU_brightness_control = Offset + counter();
	CNBP_brightness_control = Offset + counter();
	pilot_AMU_brightness_control = Offset + counter();
	copilot_AMU_brightness_control = Offset + counter();
	NightVisionGogglesOn = Offset + counter();
}

REFERENCE_SET_MODE_SELECT_PANELS =
{
	PILOT_reference_select_switch = Offset + counter();
	PILOT_reference_set_knob = Offset + counter();
	PILOT_altitude_alert_set_knob = Offset + counter();
	PILOT_altitude_alert_Reset_knob = Offset + counter();
	PILOT_barometric_set_knob = Offset + counter();
	PILOT_barometric_standard = Offset + counter();
	COPILOT_reference_select_switch = Offset + counter();
	COPILOT_reference_set_knob = Offset + counter();
	COPILOT_altitude_alert_set_knob = Offset + counter();
	COPILOT_altitude_alert_Reset_knob = Offset + counter();
	COPILOT_barometric_set_knob = Offset + counter();
	COPILOT_barometric_standard = Offset + counter();
	Altitude_Hold = Offset + counter();
	Altitude_Select = Offset + counter();
	Hdg = Offset + counter();
	Nav = Offset + counter();
	Approach = Offset + counter();
	Ver_Speed_Hold = Offset + counter();
	IAS = Offset + counter();
	CAPS = Offset + counter();
	Autothrottle = Offset + counter();
}

Automatic_Flight_Control_System_Panel =
{
	PILOT_AFCS_Engage_Lever = Offset + counter();
	COPILOT_AFCS_Engage_Lever = Offset + counter();
	AFCS_Pitch_Switch = Offset + counter();
	AFCS_Lateral_Switch = Offset + counter();
	AFCS_Turn_Control = Offset + counter();
	AFCS_Pitch_Control = Offset + counter();
	AFCS_Autopilot_On = Offset + counter();
	AFCS_Autopilot_Off = Offset + counter();
	AFCS_Vert_Ref_Sync_Control_On = Offset + counter();
	AFCS_Vert_Ref_Sync_Control_Off = Offset + counter();
}

HDG_CRS_Selector_Control_Panel =
{
	PILOT_HDG_SET = Offset + counter();
	PILOT_HDG_RESET = Offset + counter();
	PILOT_CRS_SET = Offset + counter();
	COPILOT_HDG_SET = Offset + counter();
	COPILOT_HDG_RESET = Offset + counter();
	COPILOT_CRS_SET = Offset + counter();
}

PILOT_LIGHTING_CONTROLS =
{
	Master_Switch_Control = Offset + counter();
	Cockpit_Dome_Brighness_Control = Offset + counter();
	Pilot_Display_Master_Brighness_Control = Offset + counter();
}

COPILOT_LIGHTING_CONTROLS =
{
	Overhead_Panel_Flood_Brighness_Control = Offset + counter();
	Copilot_Display_Master_Brighness_Control = Offset + counter();
}

AUGMENTED_CREW_LIGHTING_CONTROLS =
{
	Augmented_Crew_Lighting_Flood_Control = Offset + counter();
}

FWD_CARGO_LIGHTING_CONTROL_PANEL =
{
	Fwd_Cargo_Lighting_Dome_Brightness_Control = Offset + counter();
}

AFT_CARGO_LIGHTING_CONTROL_PANEL =
{
	Aft_Cargo_Lighting_Dome_Brightness_Control = Offset + counter();
	Aft_Cargo_Lighting_Jump_Platform_Control = Offset + counter();
	Aft_Cargo_Lighting_Ramp_Dome_Brightness_Control = Offset + counter();
	Aft_Cargo_Ramp_Loading_Light_Switch = Offset + counter();
}

AMU =
{
	pilot_AMU001_SelectKey_001 = Offset + counter();
	pilot_AMU001_SelectKey_002 = Offset + counter();
	pilot_AMU001_SelectKey_003 = Offset + counter();
	pilot_AMU001_SelectKey_004 = Offset + counter();
	pilot_AMU001_SelectKey_005 = Offset + counter();
	pilot_AMU001_SelectKey_006 = Offset + counter();
	pilot_AMU001_SelectKey_007 = Offset + counter();
	pilot_AMU001_SelectKey_008 = Offset + counter();
		------------------------------------------------------------
	pilot_AMU002_SelectKey_001 = Offset + counter();
	pilot_AMU002_SelectKey_002 = Offset + counter();
	pilot_AMU002_SelectKey_003 = Offset + counter();
	pilot_AMU002_SelectKey_004 = Offset + counter();
	pilot_AMU002_SelectKey_005 = Offset + counter();
	pilot_AMU002_SelectKey_006 = Offset + counter();
	pilot_AMU002_SelectKey_007 = Offset + counter();
	pilot_AMU002_SelectKey_008 = Offset + counter();
		------------------------------------------------------------
	copilot_AMU001_SelectKey_001 = Offset + counter();
	copilot_AMU001_SelectKey_002 = Offset + counter();
	copilot_AMU001_SelectKey_003 = Offset + counter();
	copilot_AMU001_SelectKey_004 = Offset + counter();
	copilot_AMU001_SelectKey_005 = Offset + counter();
	copilot_AMU001_SelectKey_006 = Offset + counter();
	copilot_AMU001_SelectKey_007 = Offset + counter();
	copilot_AMU001_SelectKey_008 = Offset + counter();
		------------------------------------------------------------
	copilot_AMU002_SelectKey_001 = Offset + counter();
	copilot_AMU002_SelectKey_002 = Offset + counter();
	copilot_AMU002_SelectKey_003 = Offset + counter();
	copilot_AMU002_SelectKey_004 = Offset + counter();
	copilot_AMU002_SelectKey_005 = Offset + counter();
	copilot_AMU002_SelectKey_006 = Offset + counter();
	copilot_AMU002_SelectKey_007 = Offset + counter();
	copilot_AMU002_SelectKey_008 = Offset + counter();
		------------------------------------------------------------
	COMM_CNBP = Offset + counter();
	NAV_CNBP = Offset + counter();
	ECB_CNBP = Offset + counter();
}

CNI_MU =
{
	pilot_CNI_MU_SelectKey_001 = Offset + counter();
	pilot_CNI_MU_SelectKey_002 = Offset + counter();
	pilot_CNI_MU_SelectKey_003 = Offset + counter();
	pilot_CNI_MU_SelectKey_004 = Offset + counter();
	pilot_CNI_MU_SelectKey_005 = Offset + counter();
	pilot_CNI_MU_SelectKey_006 = Offset + counter();
	pilot_CNI_MU_SelectKey_007 = Offset + counter();
	pilot_CNI_MU_SelectKey_008 = Offset + counter();
	pilot_CNI_MU_SelectKey_009 = Offset + counter();
	pilot_CNI_MU_SelectKey_010 = Offset + counter();
	pilot_CNI_MU_SelectKey_011 = Offset + counter();
	pilot_CNI_MU_SelectKey_012 = Offset + counter();
	pilot_CNI_MU_CommTune = Offset + counter();
	pilot_CNI_MU_TOLD = Offset + counter();
	pilot_CNI_MU_NAV_CTRL = Offset + counter();
	pilot_CNI_MU_INDEX = Offset + counter();
	pilot_CNI_MU_EXEC = Offset + counter();
	pilot_CNI_MU_KBD_1 = Offset + counter();
	pilot_CNI_MU_KBD_2 = Offset + counter();
	pilot_CNI_MU_KBD_3 = Offset + counter();
	pilot_CNI_MU_KBD_4 = Offset + counter();
	pilot_CNI_MU_KBD_5 = Offset + counter();
	pilot_CNI_MU_KBD_6 = Offset + counter();
	pilot_CNI_MU_KBD_7 = Offset + counter();
	pilot_CNI_MU_KBD_8 = Offset + counter();
	pilot_CNI_MU_KBD_9 = Offset + counter();
	pilot_CNI_MU_KBD_dot = Offset + counter();
	pilot_CNI_MU_KBD_0 = Offset + counter();
	pilot_CNI_MU_KBD_plusmin = Offset + counter();
	pilot_CNI_MU_KBD_A = Offset + counter();
	pilot_CNI_MU_KBD_B = Offset + counter();
	pilot_CNI_MU_KBD_C = Offset + counter();
	pilot_CNI_MU_KBD_D = Offset + counter();
	pilot_CNI_MU_KBD_E = Offset + counter();
	pilot_CNI_MU_KBD_F = Offset + counter();
	pilot_CNI_MU_KBD_G = Offset + counter();
	pilot_CNI_MU_KBD_H = Offset + counter();
	pilot_CNI_MU_KBD_I = Offset + counter();
	pilot_CNI_MU_KBD_J = Offset + counter();
	pilot_CNI_MU_KBD_K = Offset + counter();
	pilot_CNI_MU_KBD_L = Offset + counter();
	pilot_CNI_MU_KBD_M = Offset + counter();
	pilot_CNI_MU_KBD_N = Offset + counter();
	pilot_CNI_MU_KBD_O = Offset + counter();
	pilot_CNI_MU_KBD_P = Offset + counter();
	pilot_CNI_MU_KBD_Q = Offset + counter();
	pilot_CNI_MU_KBD_R = Offset + counter();
	pilot_CNI_MU_KBD_S = Offset + counter();
	pilot_CNI_MU_KBD_T = Offset + counter();
	pilot_CNI_MU_KBD_U = Offset + counter();
	pilot_CNI_MU_KBD_V = Offset + counter();
	pilot_CNI_MU_KBD_W = Offset + counter();
	pilot_CNI_MU_KBD_X = Offset + counter();
	pilot_CNI_MU_KBD_Y = Offset + counter();
	pilot_CNI_MU_KBD_Z = Offset + counter();
	pilot_CNI_MU_KBD_UNDERSCORE = Offset + counter();
	pilot_CNI_MU_KBD_FORWARDSLASH = Offset + counter();
	pilot_CNI_MU_KBD_DEL = Offset + counter();
	pilot_CNI_MU_KBD_CLR = Offset + counter();
	PILOT_Network_Sync = Offset + counter();
		------------------------------------------------------------
	copilot_CNI_MU_SelectKey_001 = Offset + counter();
	copilot_CNI_MU_SelectKey_002 = Offset + counter();
	copilot_CNI_MU_SelectKey_003 = Offset + counter();
	copilot_CNI_MU_SelectKey_004 = Offset + counter();
	copilot_CNI_MU_SelectKey_005 = Offset + counter();
	copilot_CNI_MU_SelectKey_006 = Offset + counter();
	copilot_CNI_MU_SelectKey_007 = Offset + counter();
	copilot_CNI_MU_SelectKey_008 = Offset + counter();
	copilot_CNI_MU_SelectKey_009 = Offset + counter();
	copilot_CNI_MU_SelectKey_010 = Offset + counter();
	copilot_CNI_MU_SelectKey_011 = Offset + counter();
	copilot_CNI_MU_SelectKey_012 = Offset + counter();
	copilot_CNI_MU_CommTune = Offset + counter();
	copilot_CNI_MU_TOLD = Offset + counter();
	copilot_CNI_MU_NAV_CTRL = Offset + counter();
	copilot_CNI_MU_INDEX = Offset + counter();
	copilot_CNI_MU_EXEC = Offset + counter();
	copilot_CNI_MU_KBD_1 = Offset + counter();
	copilot_CNI_MU_KBD_2 = Offset + counter();
	copilot_CNI_MU_KBD_3 = Offset + counter();
	copilot_CNI_MU_KBD_4 = Offset + counter();
	copilot_CNI_MU_KBD_5 = Offset + counter();
	copilot_CNI_MU_KBD_6 = Offset + counter();
	copilot_CNI_MU_KBD_7 = Offset + counter();
	copilot_CNI_MU_KBD_8 = Offset + counter();
	copilot_CNI_MU_KBD_9 = Offset + counter();
	copilot_CNI_MU_KBD_dot = Offset + counter();
	copilot_CNI_MU_KBD_0 = Offset + counter();
	copilot_CNI_MU_KBD_plusmin = Offset + counter();
	copilot_CNI_MU_KBD_A = Offset + counter();
	copilot_CNI_MU_KBD_B = Offset + counter();
	copilot_CNI_MU_KBD_C = Offset + counter();
	copilot_CNI_MU_KBD_D = Offset + counter();
	copilot_CNI_MU_KBD_E = Offset + counter();
	copilot_CNI_MU_KBD_F = Offset + counter();
	copilot_CNI_MU_KBD_G = Offset + counter();
	copilot_CNI_MU_KBD_H = Offset + counter();
	copilot_CNI_MU_KBD_I = Offset + counter();
	copilot_CNI_MU_KBD_J = Offset + counter();
	copilot_CNI_MU_KBD_K = Offset + counter();
	copilot_CNI_MU_KBD_L = Offset + counter();
	copilot_CNI_MU_KBD_M = Offset + counter();
	copilot_CNI_MU_KBD_N = Offset + counter();
	copilot_CNI_MU_KBD_O = Offset + counter();
	copilot_CNI_MU_KBD_P = Offset + counter();
	copilot_CNI_MU_KBD_Q = Offset + counter();
	copilot_CNI_MU_KBD_R = Offset + counter();
	copilot_CNI_MU_KBD_S = Offset + counter();
	copilot_CNI_MU_KBD_T = Offset + counter();
	copilot_CNI_MU_KBD_U = Offset + counter();
	copilot_CNI_MU_KBD_V = Offset + counter();
	copilot_CNI_MU_KBD_W = Offset + counter();
	copilot_CNI_MU_KBD_X = Offset + counter();
	copilot_CNI_MU_KBD_Y = Offset + counter();
	copilot_CNI_MU_KBD_Z = Offset + counter();
	copilot_CNI_MU_KBD_UNDERSCORE = Offset + counter();
	copilot_CNI_MU_KBD_FORWARDSLASH = Offset + counter();
	copilot_CNI_MU_KBD_DEL = Offset + counter();
	copilot_CNI_MU_KBD_CLR = Offset + counter();
	COPILOT_Network_Sync = Offset + counter();
		------------------------------------------------------------
}

CURSOR =
{
	Manual_Cursor = Offset + counter();
	Cursor_Reset = Offset + counter();
	Ground_Cursor = Offset + counter();
	Computer_Cursor = Offset + counter();
	Cursor_Forward = Offset + counter();
	Cursor_Aft = Offset + counter();
	Cursor_Left = Offset + counter();
	Cursor_Right = Offset + counter();
	Cursor_Release = Offset + counter();
	Cursor_Next_Target = Offset + counter();
	Cursor_Previous_Target = Offset + counter();
	Cursor_Insert = Offset + counter();
}

FUEL_MANAGEMENT_PANEL =
{
	Left_Dump_Switch_Guard = Offset + counter();
	Left_Dump_Switch = Offset + counter();
	Right_Dump_Switch_Guard = Offset + counter();
	Right_Dump_Switch = Offset + counter();
	Left_External_Transfer_Switch = Offset + counter();
}

AERIAL_DELIVERY_PANEL =
{
	Air_Deflector_Switch = Offset + counter();
	Cockpit_Cargo_DoorRamp_Switch = Offset + counter();
	Computer_Drop_Switch = Offset + counter();
	Bell_Alarm_Switch_Guard = Offset + counter();
	Bell_Alarm_Switch = Offset + counter();
	Chute_Release_Guard = Offset + counter();
	Chute_Release_Trigger_Down = Offset + counter();
	Chute_Release_Trigger_Up = Offset + counter();
	Air_Deflector_Toggle = Offset + counter();
	Air_Deflector_Extend = Offset + counter();
	Air_Deflector_Retract = Offset + counter();
	Caution_Switch_Light = Offset + counter();
	Jump_Switch_Light = Offset + counter();
}

RAMP_CONTROL_PANEL =
{
	Aft_Aux_Hydraulic_Switch = Offset + counter();
	Aft_Cargo_Door_Switch = Offset + counter();
	Aft_Cargo_Ramp_Switch = Offset + counter();
}

LOADMASTER_STATION =
{
	LMPanel_Power = Offset + counter();
	LMPanel_Pages_Select = Offset + counter();
	LMPanel_CofG_Page_Select = Offset + counter();
}

RAMP_EMERGENCY_CONTROL_PANEL =
{
	Loadmaster_Cargo_DoorRamp_Switch = Offset + counter();
	Cargo_Jett_Locks_FWD_Switch_Guard = Offset + counter();
	Cargo_Jett_Locks_FWD_Switch = Offset + counter();
	Cargo_Jett_Locks_MID_Switch_Guard = Offset + counter();
	Cargo_Jett_Locks_MID_Switch = Offset + counter();
	Cargo_Jett_Locks_AFT_Switch_Guard = Offset + counter();
	Cargo_Jett_Locks_AFT_Switch = Offset + counter();
	Cargo_Airdrop_Drogue_Jettison_Guard = Offset + counter();
	Cargo_Airdrop_Drogue_Jettison_Switch = Offset + counter();
	Cargo_Jettison_Locks_Release_Keyb = Offset + counter();
	Cargo_Jettison_FWD_Locks_Release_Keyb = Offset + counter();
	Cargo_Jettison_MID_Locks_Release_Keyb = Offset + counter();
	Cargo_Jettison_AFT_Locks_Release_Keyb = Offset + counter();
}

MISCELLANEOUS =
{
	No_Action = Offset + counter();
	Pilot_Tacview_Attach_Lever = Offset + counter();
	TacView_Pilot_power = Offset + counter();
	Rocket_Assist_Arm_Switch_Guard = Offset + counter();
	Rocket_Assist_Arm_Switch = Offset + counter();
	Rocket_Assist_Fire_Trigger_Button_Down = Offset + counter();
	Rocket_Assist_Fire_Trigger_Button_Up = Offset + counter();
	RocketAssistTakeoff = Offset + counter();--Keyb
	Park_Brake_Mouse = Offset + counter();
	Park_Brake_Toggle = Offset + counter();
	Crew_Entrance_Door_Handle = Offset + counter();
	Crew_Entrance_Door_Toggle = Offset + counter();
	CargoDoorRampOpen = Offset + counter();
	CargoDoorRampClose = Offset + counter();
	BrakesBothOn = Offset + counter();
	BrakesBothOff = Offset + counter();
	NWSLeft = Offset + counter();
	NWSLeftCenter = Offset + counter();
	NWSRight = Offset + counter();
	NWSRightCenter = Offset + counter();
	Paratroop_Port_Door_Handle = Offset + counter();
	Paratroop_Starboard_Door_Handle = Offset + counter();
	Paratroop_Doors_Toggle = Offset + counter();
	Flightdeck_Pilot_Window_Handle = Offset + counter();
	Flightdeck_Copilot_Window_Handle = Offset + counter();
	Flightdeck_Windows_Toggle = Offset + counter();
}

MPCD_INTERFACE =
{
------------------------------------------------------------------------ MPCD_LEFT_INTERFACE
	MPCD1_brightness = Offset + counter();
	MPCD1_Btn1 = Offset + counter();
	MPCD1_Btn2 = Offset + counter();
	MPCD1_Btn3 = Offset + counter();
	MPCD1_Btn4 = Offset + counter();
	MPCD1_Btn5 = Offset + counter();
	MPCD1_Btn6 = Offset + counter();
	MPCD1_Btn7 = Offset + counter();
	MPCD1_Btn8 = Offset + counter();
	MPCD1_Btn9 = Offset + counter();
	MPCD1_Btn10 = Offset + counter();
	MPCD1_Btn11 = Offset + counter();
	MPCD1_Btn12 = Offset + counter();
	MPCD1_Btn13 = Offset + counter();
	MPCD1_Btn14 = Offset + counter();
	MPCD1_Btn15 = Offset + counter();
	MPCD1_Btn16 = Offset + counter();
	MPCD1_Btn17 = Offset + counter();
	MPCD1_Btn18 = Offset + counter();
	MPCD1_Btn19 = Offset + counter();
	MPCD1_Btn20 = Offset + counter();
------------------------------------------------------------------------ MPCD_RIGHT_INTERFACE
	MPCD2_brightness = Offset + counter();
	MPCD2_Btn1 = Offset + counter();
	MPCD2_Btn2 = Offset + counter();
	MPCD2_Btn3 = Offset + counter();
	MPCD2_Btn4 = Offset + counter();
	MPCD2_Btn5 = Offset + counter();
	MPCD2_Btn6 = Offset + counter();
	MPCD2_Btn7 = Offset + counter();
	MPCD2_Btn8 = Offset + counter();
	MPCD2_Btn9 = Offset + counter();
	MPCD2_Btn10 = Offset + counter();
	MPCD2_Btn11 = Offset + counter();
	MPCD2_Btn12 = Offset + counter();
	MPCD2_Btn13 = Offset + counter();
	MPCD2_Btn14 = Offset + counter();
	MPCD2_Btn15 = Offset + counter();
	MPCD2_Btn16 = Offset + counter();
	MPCD2_Btn17 = Offset + counter();
	MPCD2_Btn18 = Offset + counter();
	MPCD2_Btn19 = Offset + counter();
	MPCD2_Btn20 = Offset + counter();
}

BATTLE_STATION_COMMANDS =
{
	Battle_Station_Power = Offset + counter();
	Cannon_Slave_TPOD = Offset + counter();
	Cannon_Stabilizer = Offset + counter();
	FLIR_DMT_Power_switch = Offset + counter();
	TPOD_Direction_select_switch = Offset + counter();
	CAGE_UNCAGE = Offset + counter();
	Sensor_Select_FWD = Offset + counter();
	Sensor_Select_AFT = Offset + counter();
	Sensor_Select_LEFT = Offset + counter();
	Sensor_Select_RIGHT = Offset + counter();
	Sensor_Select_DOWN = Offset + counter();
	Sensor_Select_RELEASE = Offset + counter();
	TGT_Wpt_Designator_DOWN = Offset + counter();
	TGT_Wpt_Designator_RELEASE = Offset + counter();
	Target_UNDESIGNATE = Offset + counter();
	Target_UNDESIGNATE_RELEASE = Offset + counter();
	TDC_DOWN = Offset + counter();
	TDC_DOWN_RELEASE = Offset + counter();
	TDC_ACTION_NOACTION = Offset + counter();
	TDC_LEFT = Offset + counter();
	TDC_FORWARD = Offset + counter();
	TDC_RIGHT = Offset + counter();
	TDC_AFT = Offset + counter();
	TDC_RELEASE = Offset + counter();
	Pylon_Bomb_Fuse_Switch = Offset + counter();
	Master_Arm_Switch_Guard = Offset + counter();
	Master_Arm_Switch = Offset + counter();
	Pylon_Control_Reset_Switch = Offset + counter();
	Pylon1_Control_Switch = Offset + counter();
	Pylon2_Control_Switch = Offset + counter();
	Pylon3_Control_Switch = Offset + counter();
	Pylon4_Control_Switch = Offset + counter();
	Pylons_Jettison_Switch_Guard = Offset + counter();
	Pylons_Jettison_Switch = Offset + counter();
	Cannon_Station_Select = Offset + counter();
	Cannon_Release_On = Offset + counter();
	Cannon_Release_Off = Offset + counter();
	Pylon_Release_On = Offset + counter();
	Pylon_Release_Off = Offset + counter();
	Cannon_Release_Keyb_On = Offset + counter();
	Cannon_Release_Keyb_Off = Offset + counter();
	Pylon_Release_Keyb_On = Offset + counter();
	Pylon_Release_Keyb_Off = Offset + counter();
	Cannon_Slew_UP = Offset + counter();
	Cannon_Slew_DOWN = Offset + counter();
	Cannon_Slew_LEFT = Offset + counter();
	Cannon_Slew_RIGHT = Offset + counter();
	Cannon_Slew_RELEASE = Offset + counter();
}

FLIGHT_CONTROL =
{
	PlaneUpStart = Offset + counter();
	PlaneUpStop = Offset + counter();
	PlaneDownStart = Offset + counter();
	PlaneDownStop = Offset + counter();
	PlaneLeftStart = Offset + counter();
	PlaneLeftStop = Offset + counter();
	PlaneRightStart = Offset + counter();
	PlaneRightStop = Offset + counter();
	PlaneLeftRudderStart = Offset + counter();
	PlaneLeftRudderStop = Offset + counter();
	PlaneRightRudderStart = Offset + counter();
	PlaneRightRudderStop = Offset + counter();
}

TRIM =
{
	Up = Offset + counter();
	Down = Offset + counter();
	Left = Offset + counter();
	Right = Offset + counter();
	RudderLeft = Offset + counter();
	RudderRight = Offset + counter();
	Stop = Offset + counter();
}

THROTTLES =
{
	ATCS_Autothrottle_Disengage = Offset + counter();
	Beta = Offset + counter();
	Beta_Reverse = Offset + counter();
	Full_Reverse = Offset + counter();
	TO_Power_Toggle = Offset + counter();
	TO_Power_On = Offset + counter();
	TO_Power_Off = Offset + counter();
	Throttles_To_Idle = Offset + counter();
	ThrottlesIncrease = Offset + counter();
	ThrottlesDecrease = Offset + counter();
	Throttles12Increase = Offset + counter();
	Throttles12Decrease = Offset + counter();
	Throttles34Increase = Offset + counter();
	Throttles34Decrease = Offset + counter();
}

RWR =
{
	OnOffSwitch = Offset + counter();
	Loudness = Offset + counter();
}

	-- print_message_to_user(string.format("command: %d", KEYBOARD.TrimRightRudder));








