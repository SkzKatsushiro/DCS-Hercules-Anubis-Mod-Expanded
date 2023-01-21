
dofile(LockOn_Options.common_script_path.."elements_defs.lua")

-- Used by TAWS
-- 1, 2, 3, 4
HDD_number = ...

-- hdd_001_brightness, hdd_002_brightness, hdd_003_brightness, hdd_004_brightness
local brightness_parameter = "hdd_00" .. HDD_number .. "_brightness"

--------------------------------------------------------------------------------------------------------------------------------------------PFD_Display_Display

-- HDD001_PFD, HDD002_PFD, HDD003_PFD, HDD004_PFD
local PFD_on_parameter = "HDD00" .. HDD_number .. "_PFD"
PFD_on_controller = {"parameter_in_range", PFD_on_parameter, 0.95, 1.05}

if HDD_number == 1 or HDD_number == 2 then
    HDD_on_controller = {"parameter_in_range", "DC", 22, 28.05}
else -- HDD_number == 3 or HDD_number == 4; from HDD003\indicator\AC_base_page.lua and HDD004\indicator\AC_base_page.lua
    HDD_on_controller = {"parameter_in_range", "AC", 111, 116}
end

local PFD_Display_origin = CreateElement "ceSimple"
PFD_Display_origin.name = "PFD_Display_origin"
PFD_Display_origin.init_pos = {0,0}
PFD_Display_origin.element_params   = {PFD_on_parameter} -- {PFD_on_parameter}
PFD_Display_origin.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
Add(PFD_Display_origin)

PFD_brightness_parameter = brightness_parameter
PFD_origin = PFD_Display_origin.name
dofile(LockOn_Options.script_path.."PFD_Display/indicator/indication_page.lua")

--------------------------------------------------------------------------------------------------------------------------------------------TAWS_Display

-- TAWS_on_parameter = "HDD00" .. HDD_number .. "_Nav_Radar_Display"
-- HDD001_TAWS, HDD002_TAWS, HDD003_TAWS, HDD004_TAWS
TAWS_on_parameter = "HDD00" .. HDD_number .. "_TAWS"
local TAWS_Display_origin = CreateElement "ceSimple"
TAWS_Display_origin.name = "TAWS_Display_origin"
TAWS_Display_origin.init_pos = {0,0}
TAWS_Display_origin.element_params   = {TAWS_on_parameter}
TAWS_Display_origin.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
Add(TAWS_Display_origin)

Nav_Radar_Display = TAWS_on_parameter
TAWS_brightness_parameter = brightness_parameter
TAWS_origin = TAWS_Display_origin.name
Nav_Radar_brightness_parameter = brightness_parameter
Nav_Radar_origin = TAWS_Display_origin.name
RWR_Display_origin = TAWS_Display_origin.name
-- IS_TAWS = true
-- if get_plugin_option_value("Hercules","Taws_Enabled") == true then
    -- dofile(LockOn_Options.script_path.."TAWS/indicator/indication_page.lua")
-- end
dofile(LockOn_Options.script_path.."Nav_Radar_Display/indicator/indication_page.lua")
dofile(LockOn_Options.script_path.."RWR/indicator/indication_page.lua")

--------------------------------------------------------------------------------------------------------------------------------------------ENGINE_STATUS_Display

local Engine_Status_Display_origin = CreateElement "ceSimple"
Engine_Status_Display_origin.name = "Engine_Status_Display_origin"
Engine_Status_Display_origin.init_pos = {0,0}
Engine_Status_Display_origin.element_params   = {"HDD00" .. HDD_number .. "_Engine_Status"} -- HDD001_Engine_Status, HDD002_Engine_Status, HDD003_Engine_Status, HDD004_Engine_Status
Engine_Status_Display_origin.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
Add(Engine_Status_Display_origin)

Engine_brightness_parameter = brightness_parameter
Engine_origin = Engine_Status_Display_origin.name
dofile(LockOn_Options.script_path.."Engine_Status_Display/indicator/indication_page.lua")

--------------------------------------------------------------------------------------------------------------------------------------------System_Status_Display

local System_Status_Display_origin = CreateElement "ceSimple"
System_Status_Display_origin.name = "System_Status_Display_origin"
System_Status_Display_origin.init_pos = {0,0}
System_Status_Display_origin.element_params   = {"HDD00" .. HDD_number .. "_System_Status"} -- HDD001_System_Status, HDD002_System_Status, HDD003_System_Status, HDD004_System_Status
System_Status_Display_origin.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
Add(System_Status_Display_origin)

System_brightness_parameter = brightness_parameter
System_origin = System_Status_Display_origin.name
dofile(LockOn_Options.script_path.."System_Status_Display/indicator/indication_page.lua")

--------------------------------------------------------------------------------------------------------------------------------------------Nav_Radar_Display

Nav_Radar_Display = "HDD00" .. HDD_number .. "_Nav_Radar_Display"
local Nav_Radar_Display_origin = CreateElement "ceSimple"
Nav_Radar_Display_origin.name = "Nav_Radar_Display_origin"
Nav_Radar_Display_origin.init_pos = {0,0}
Nav_Radar_Display_origin.element_params   = {Nav_Radar_Display} -- HDD001_Nav_Radar_Display, HDD002_Nav_Radar_Display, HDD003_Nav_Radar_Display, HDD004_Nav_Radar_Display
Nav_Radar_Display_origin.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
Add(Nav_Radar_Display_origin)

Nav_Radar_brightness_parameter = brightness_parameter
Nav_Radar_origin = Nav_Radar_Display_origin.name
RWR_Display_origin = Nav_Radar_Display_origin.name
IS_TAWS = false
dofile(LockOn_Options.script_path.."Nav_Radar_Display/indicator/indication_page.lua")
dofile(LockOn_Options.script_path.."RWR/indicator/indication_page.lua")

--------------------------------------------------------------------------------------------------------------------------------------------Digital_Map_Display

local Digital_Map_Display_origin = CreateElement "ceSimple"
Digital_Map_Display_origin.name = "Digital_Map_Display_origin"
Digital_Map_Display_origin.init_pos = {0,0}
Digital_Map_Display_origin.element_params   = {"HDD00" .. HDD_number .. "_Dig_Map"} -- HDD001_Dig_Map, HDD002_Dig_Map, HDD003_Dig_Map, HDD004_Dig_Map
Digital_Map_Display_origin.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
Add(Digital_Map_Display_origin)

Digital_Map_brightness_parameter = brightness_parameter
Digital_Map_origin = Digital_Map_Display_origin.name
dofile(LockOn_Options.script_path.."Digital_Map_Display/indicator/indication_page.lua")
dofile(LockOn_Options.script_path.."Flightplan_Overlay/indicator/indication_page.lua")





