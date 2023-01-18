
-- mount_vfs_texture_archives("Bazar/Textures/AvionicsCommon")
dofile(LockOn_Options.common_script_path.."tools.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."materials.lua")

--------------------------------------------------------------------------------------------------------Hercules
MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua"}

-- Avionics devices initialization example
--	items in <...> are optional
--
-- creators[DEVICE_ID] = {"NAME_OF_CONTROLLER_CLASS",
--						  <"CONTROLLER_SCRIPT_FILE",>
--						  <{devices.LINKED_DEVICE1, devices.LINKED_DEVICE2, ...},>
--						  <"INPUT_COMMANDS_SCRIPT_FILE",>
--						  <{{"NAME_OF_INDICATOR_CLASS", "INDICATOR_SCRIPT_FILE"}, ...}>
--						 }
creators = {}

creators[devices.Electric_System] = {"avSimpleElectricSystem",LockOn_Options.script_path.."Systems/electric_system.lua"}
creators[devices.RWR] = {"avSimpleRWR", LockOn_Options.script_path.."RWR/device/rwr.lua"}

creators[devices.Network_Synchronization] = {"avLuaDevice", LockOn_Options.script_path.."../../Network_Synchronization.lua"}
creators[devices.Performance_Factors] = {"avLuaDevice", LockOn_Options.script_path.."Performance_Factors.lua"}
creators[devices.General_Device] = {"avLuaDevice", LockOn_Options.script_path.."general_device.lua"}
creators[devices.PFD_Device] = {"avLuaDevice", LockOn_Options.script_path.."PFD_Display/indicator/PFD_device.lua"}
creators[devices.Nav_Radar] = {"avLuaDevice", LockOn_Options.script_path.."Nav_Radar_Display/indicator/nav_radar_device.lua"}
creators[devices.Pylon_Release_System] = {"avSimpleWeaponSystem", LockOn_Options.script_path.."Systems/Pylon_Release_System.lua"}
creators[devices.Update_Connectors] = {"avLuaDevice", LockOn_Options.script_path.."Update_Connectors.lua"}

creators[devices.Intercom] = {"avIntercom", LockOn_Options.script_path.."Systems/Radio/Intercom.lua", {devices.UHF_Radio} }
creators[devices.UHF_Radio] = {"avUHF_ARC_164", LockOn_Options.script_path.."Systems/Radio/UHF_radio.lua", {devices.Intercom, devices.Electric_System} }
creators[devices.Radios_control] = {"avLuaDevice",LockOn_Options.script_path.."Systems/Radio/Radios_control.lua"}
creators[devices.Helmet_Device]	= {"avNightVisionGoggles"}

indicators = {}
indicators[#indicators + 1] = {"ccIndicator" ,LockOn_Options.script_path.."HUD/PILOT_HUD/init.lua", nil, {{"HUD001_CENTER_PNT"}, {}}} --HUD capt
indicators[#indicators + 1] = {"ccIndicator" ,LockOn_Options.script_path.."HUD/COPILOT_HUD/init.lua", nil, {{"HUD002_CENTER_PNT"}, {}}} --HUD co-pilot

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HDD/HDD001/indicator/init.lua" , nil,{{"CENTER_HDD001_PNT","DOWN_HDD001_PNT","RIGHT_HDD001_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HDD/HDD002/indicator/init.lua", nil, {{"CENTER_HDD002_PNT","DOWN_HDD002_PNT","RIGHT_HDD002_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HDD/HDD003/indicator/init.lua", nil,{{"CENTER_HDD003_PNT","DOWN_HDD003_PNT","RIGHT_HDD003_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."HDD/HDD004/indicator/init.lua", nil,{{"CENTER_HDD004_PNT","DOWN_HDD004_PNT","RIGHT_HDD004_PNT"}, {}}}

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."AMU_CNBP/PILOT_AMU001/init.lua", nil, {{"AMU001_CENTER_PNT","AMU001_DOWN_PNT","AMU001_RIGHT_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."AMU_CNBP/PILOT_AMU002/init.lua", nil, {{"AMU002_CENTER_PNT","AMU002_DOWN_PNT","AMU002_RIGHT_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."AMU_CNBP/CNBP/init.lua", nil, {{"CNBP_CENTER_PNT","CNBP_DOWN_PNT","CNBP_RIGHT_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."AMU_CNBP/COPILOT_AMU001/init.lua", nil, {{"AMU003_CENTER_PNT","AMU003_DOWN_PNT","AMU003_RIGHT_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."AMU_CNBP/COPILOT_AMU002/init.lua", nil, {{"AMU004_CENTER_PNT","AMU004_DOWN_PNT","AMU004_RIGHT_PNT"}, {}}}

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."CNI_MU/PILOT_CNI_MU/init.lua", nil, {{"CENTER_CNI_MU001_PNT","DOWN_CNI_MU001_PNT","RIGHT_CNI_MU001_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."CNI_MU/COPILOT_CNI_MU/init.lua", nil, {{"CENTER_CNI_MU002_PNT","DOWN_CNI_MU002_PNT","RIGHT_CNI_MU002_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."CNI_MU/PILOT_CNI_MU_NetSync/init.lua", nil, {{"CENTER_NetSync_CNI_MU001_PNT","DOWN_NetSync_CNI_MU001_PNT","RIGHT_NetSync_CNI_MU001_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."CNI_MU/COPILOT_CNI_MU_NetSync/init.lua", nil, {{"CENTER_NetSync_CNI_MU002_PNT","DOWN_NetSync_CNI_MU002_PNT","RIGHT_NetSync_CNI_MU002_PNT"}, {}}}

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/Pilot_Reference_Display/init.lua", nil, {{"Center_REF_SET_001_PNT","Down_REF_SET_001_PNT","Right_REF_SET_001_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/Copilot_Reference_Display/init.lua", nil, {{"Center_REF_SET_002_PNT","Down_REF_SET_002_PNT","Right_REF_SET_002_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/Overhead_Battery_test_display/init.lua", nil, {{"Center_Battery_test_display_PNT","Down_Battery_test_display_PNT","Right_Battery_test_display_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/Bleed_Air_Pressure/init.lua", nil, {{"Bleed_Air_Press_Center_PNT","Bleed_Air_Press_Down_PNT","Bleed_Air_Press_Right_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/APU_rpm/init.lua", nil, {{"Center_APU_rpm_PNT","Down_APU_rpm_PNT","Right_APU_rpm_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/APU_egt/init.lua", nil, {{"Center_APU_egt_PNT","Down_APU_egt_PNT","Right_APU_egt_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/AUX_hyd_psi/init_cockpit.lua", nil, {{"Cockpit_CENTER_AUX_hyd_psi_PNT","Cockpit_DOWN_AUX_hyd_psi_PNT","Cockpit_RIGHT_AUX_hyd_psi_PNT"}, {}}}
indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."Instruments/AUX_hyd_psi/init_ramp.lua", nil, {{"Ramp_CENTER_AUX_hyd_psi_PNT","Ramp_DOWN_AUX_hyd_psi_PNT","Ramp_RIGHT_AUX_hyd_psi_PNT"}, {}}}

indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."LMPanel_Display/indicator/init.lua", nil, {{"LMPanel_CENTER_PNT","LMPanel_DOWN_PNT","LMPanel_RIGHT_PNT"}, {}}}
----------------------------------------------------------------------------------------------------DEBUG
-- creators[devices.Debug] = {"avLuaDevice", LockOn_Options.script_path.."DEBUG/Debug.lua"}
-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."DEBUG/DEBUG7/init.lua", nil, {{"CENTER_DEBUG007_PNT"}, {sw = -0.052, sh = -0.052 }}}
-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."DEBUG/DEBUG1/init.lua", nil, {{"CENTER_DEBUG001_PNT"}, {sw = -0.052, sh = -0.052 }}}
-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."DEBUG/DEBUG2/init.lua", nil, {{"CENTER_DEBUG002_PNT"}, {sw = -0.052, sh = -0.052 }}}
-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."DEBUG/DEBUG3/init.lua", nil, {{"CENTER_DEBUG003_PNT"}, {sw = -0.052, sh = -0.052 }}}
-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."DEBUG/DEBUG4/init.lua", nil, {{"CENTER_DEBUG004_PNT"}, {sw = -0.052, sh = -0.052 }}}
-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."DEBUG/DEBUG5/init.lua", nil, {{"CENTER_DEBUG005_PNT"}, {sw = -0.052, sh = -0.052 }}}
-- indicators[#indicators + 1] = {"ccIndicator", LockOn_Options.script_path.."DEBUG/DEBUG6/init.lua", nil, {{"CENTER_DEBUG006_PNT"}, {sw = -0.052, sh = -0.052 }}}


---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device.lua")
---------------------------------------------
dofile(LockOn_Options.common_script_path.."PADLOCK/PADLOCK_declare.lua")
---------------------------------------------
