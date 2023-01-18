dofile(LockOn_Options.script_path.."PFD_Display/indicator/definitions.lua")


------------------------------------------------------------------------------------------------------------------------------------------Original PFD_Display
-- PFD_brightness_parameter = ""   ---- Declared in the HDD indicator files
-- PFD_origin = ""   ---- Declared in the HDD indicator files

local width  	   					= 1.0
local height 	   					= width * GetAspect()

local PFD_Display = CreateElement "ceTexPoly"
PFD_Display.name = "PFD_Display"
PFD_Display.material = "PFD_Background"
PFD_Display.vertices = {
						{-width, height},
						{ width, height},
						{ width,-height},
						{-width,-height}
					}
PFD_Display.indices = default_box_indices	
PFD_Display.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
PFD_Display.init_pos = {0,0}
PFD_Display.element_params = {
						PFD_brightness_parameter,
					}
PFD_Display.controllers = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
						}
PFD_Display.parent_element = PFD_origin
AddElement(PFD_Display)
------------------------------------------------------------------------------------------------------------------------------------------End Original PFD_Display
