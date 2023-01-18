dofile(LockOn_Options.script_path.."Digital_Map_Display/indicator/definitions.lua")


local width  	   					= 1.0
local height 	   					= width * GetAspect()

-- Digital_Map_brightness_parameter = ""   ---- Declared in the HDD indicator files
-- Digital_Map_origin = ""   ---- Declared in the HDD indicator files

--------------------------------------------------------------------------------------------------------------------------------------------Digital_Map_Display
local Digital_Map_Display = CreateElement "ceTexPoly"
Digital_Map_Display.name = "Digital_Map_Display"
Digital_Map_Display.material = "DigMap_background"
Digital_Map_Display.vertices = {
						{-width, height},
						{ width, height},
						{ width,-height},
						{-width,-height}
					}
Digital_Map_Display.indices = default_box_indices	
Digital_Map_Display.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
Digital_Map_Display.init_pos = {0,0}
Digital_Map_Display.element_params = {
						Digital_Map_brightness_parameter,
					}
Digital_Map_Display.controllers = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
						}
Digital_Map_Display.blend_mode = blend_mode.IBM_REGULAR_RGB_ONLY
Digital_Map_Display.parent_element = Digital_Map_origin
AddElement(Digital_Map_Display)

