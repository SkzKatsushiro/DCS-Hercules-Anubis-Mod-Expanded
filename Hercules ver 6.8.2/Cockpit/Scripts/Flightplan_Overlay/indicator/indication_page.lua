dofile(LockOn_Options.script_path.."Flightplan_Overlay/indicator/definitions.lua")


local width  	   					= 1.0
local height 	   					= width * GetAspect()

-- Digital_Map_brightness_parameter = ""   ---- Declared in the HDD indicator files
-- Digital_Map_origin = ""   ---- Declared in the HDD indicator files

--------------------------------------------------------------------------------------------------------------------------------------------Flightplan_Overlay
local Flightplan_Overlay_origin = CreateElement "ceSimple"
Flightplan_Overlay_origin.name = "Flightplan_Overlay_origin"
Flightplan_Overlay_origin.init_pos = {0,0}
Flightplan_Overlay_origin.element_params   = {"FLT_PLN_Overlay"} 
Flightplan_Overlay_origin.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
Flightplan_Overlay_origin.parent_element = Digital_Map_origin
Add(Flightplan_Overlay_origin)

local Flightplan_Overlay = CreateElement "ceTexPoly"
Flightplan_Overlay.name = "Flightplan_Overlay"
Flightplan_Overlay.material = "DigMap_Flightplanroute"
Flightplan_Overlay.vertices = {
						{-width, height},
						{ width, height},
						{ width,-height},
						{-width,-height}
					}
Flightplan_Overlay.indices = default_box_indices	
Flightplan_Overlay.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
Flightplan_Overlay.init_pos = {0,0}
Flightplan_Overlay.element_params = {
						Digital_Map_brightness_parameter,
						-- "Nav_Radar_FLT_PLN_Overlay",
					}
Flightplan_Overlay.controllers = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							-- {"parameter_in_range",1,0.9,1.5},
						}
Flightplan_Overlay.blend_mode = blend_mode.IBM_REGULAR_RGB_ONLY
Flightplan_Overlay.parent_element = Flightplan_Overlay_origin.name
AddElement(Flightplan_Overlay)

