dofile(LockOn_Options.script_path.."Gear_lights/indicator/definitions.lua")


local width  	   					= 1.0
local height 	   					= width * GetAspect()

-- Flightplan_Overlay_brightness_parameter = ""   ---- Declared in the HDD indicator files
-- Flightplan_origin = ""   ---- Declared in the HDD indicator files

--------------------------------------------------------------------------------------------------------------------------------------------Nav_Radar_Flightplan_Overlay
local Nav_Radar_Flightplan_Overlay = CreateElement "ceTexPoly"
Nav_Radar_Flightplan_Overlay.name = "Nav_Radar_Flightplan_Overlay"
Nav_Radar_Flightplan_Overlay.material = "Nav_Radar_Display_Flightplan"
Nav_Radar_Flightplan_Overlay.vertices = {
						{-width, height},
						{ width, height},
						{ width,-height},
						{-width,-height}
					}
Nav_Radar_Flightplan_Overlay.indices = default_box_indices	
Nav_Radar_Flightplan_Overlay.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
Nav_Radar_Flightplan_Overlay.init_pos = {0,0}
Nav_Radar_Flightplan_Overlay.element_params = {
						Flightplan_Overlay_brightness_parameter,
						"Nav_Radar_FLT_PLN_Overlay",
					}
Nav_Radar_Flightplan_Overlay.controllers = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							{"parameter_in_range",1,0.9,1.5},
						}
Nav_Radar_Flightplan_Overlay.blend_mode = blend_mode.IBM_REGULAR_RGB_ONLY
Nav_Radar_Flightplan_Overlay.parent_element = Flightplan_origin
AddElement(Nav_Radar_Flightplan_Overlay)
