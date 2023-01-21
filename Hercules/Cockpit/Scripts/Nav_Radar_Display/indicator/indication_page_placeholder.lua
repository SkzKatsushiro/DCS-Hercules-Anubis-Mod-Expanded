
dofile(LockOn_Options.script_path.."Nav_Radar_Display/indicator/definitions.lua")

pct_display_fill = 0.90
local width  	   					= 1.0
local height 	   					= width * GetAspect()

-- Nav_Radar_brightness_parameter = ""   ---- Declared in the HDD indicator files
-- Nav_Radar_origin = ""   ---- Declared in the HDD indicator files

--------------------------------------------------------------------------------------------------------------------------------------------Nav_Radar_Display

	local Nav_Radar_Display = CreateElement "ceTexPoly"
	Nav_Radar_Display.name = "Nav_Radar_Display"
	Nav_Radar_Display.material = "Nav_Radar_Display"
	Nav_Radar_Display.vertices = {
											{-width, height},
											{ width, height},
											{ width,-height},
											{-width,-height}
										}
	Nav_Radar_Display.indices = default_box_indices
	Nav_Radar_Display.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
	Nav_Radar_Display.init_pos = {0,0}
	Nav_Radar_Display.element_params = {
												Nav_Radar_brightness_parameter,
											}
	Nav_Radar_Display.controllers = {
								BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
											}
	Nav_Radar_Display.blend_mode = blend_mode.IBM_REGULAR_RGB_ONLY
	Nav_Radar_Display.parent_element = Nav_Radar_origin
	AddElement(Nav_Radar_Display)
