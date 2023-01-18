

dofile(LockOn_Options.common_script_path.."elements_defs.lua")
-- dofile(LockOn_Options.script_path.."symbols.lua")
SetScale(FOV)

DISPLAY_DEFAULT_LEVEL = 4

--BrigtnessController
local BCont	=
{
	[1] = {"change_color_when_parameter_equal_to_number", 0, 1.0, 1.0, 1.0, 1.0},
	[2] = {"change_color_when_parameter_equal_to_number", 0, 0.9, 0.9, 0.9, 0.9},
	[3] = {"change_color_when_parameter_equal_to_number", 0, 0.8, 0.8, 0.8, 0.8},
	[4] = {"change_color_when_parameter_equal_to_number", 0, 0.7, 0.7, 0.7, 0.7},
	[5] = {"change_color_when_parameter_equal_to_number", 0, 0.6, 0.6, 0.6, 0.6},
	[6] = {"change_color_when_parameter_equal_to_number", 0, 0.5, 0.5, 0.5, 0.5},
	[7] = {"change_color_when_parameter_equal_to_number", 0, 0.4, 0.4, 0.4, 0.4},
	[8] = {"change_color_when_parameter_equal_to_number", 0, 0.3, 0.3, 0.3, 0.3},
	[9] = {"change_color_when_parameter_equal_to_number", 0, 0.2, 0.2, 0.2, 0.2},
	[10] = {"change_color_when_parameter_equal_to_number", 0, 0.1, 0.1, 0.1, 0.1},
}
						
function AddElement(object, level)
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= DISPLAY_DEFAULT_LEVEL
	object.blend_mode 	=  blend_mode.IBM_REGULAR
	object.collimated = true
	object.indices = default_box_indices	
    Add(object)
end


local width  	   					= 1.0
local height 	   					= width * GetAspect()

--------------------------------------------------------------------------------------------------------------------------------------------

local LMPanel_origin	         = CreateElement "ceSimple"
LMPanel_origin.name 		     = "LMPanel_origin"
LMPanel_origin.init_pos        = {0,0}
LMPanel_origin.element_params   = {
								"LMPanel_Power",
										   } 
LMPanel_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
AddElement(LMPanel_origin)
--------------------------------------------------------------------------------------------------------------------------------------------
local LMPanel_Lock_Control_Page	    = CreateElement "ceTexPoly"
LMPanel_Lock_Control_Page.name 		= "LMPanel_Lock_Control_Page"
LMPanel_Lock_Control_Page.material   = "LMPanel_Lock_Control_Page"
LMPanel_Lock_Control_Page.vertices 	   = {{-width, height},
										  { width, height},
										  { width,-height},
										  {-width,-height}}
LMPanel_Lock_Control_Page.indices			= default_box_indices	
LMPanel_Lock_Control_Page.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
LMPanel_Lock_Control_Page.init_pos   = {0,0} 
LMPanel_Lock_Control_Page.element_params   = {
							"LMPanel_Screen_brightness",
							"LMPanel_Lock_Control_Page",
						} 
LMPanel_Lock_Control_Page.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],
							{"parameter_in_range",1,-0.05,0.05},
							}
LMPanel_Lock_Control_Page.collimated = true
LMPanel_Lock_Control_Page.parent_element = LMPanel_origin.name
LMPanel_Lock_Control_Page.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(LMPanel_Lock_Control_Page)
--------------------------------------------------------------------------------------------------------------------------------------------
local LMPanel_Compartment_Limitations_Page	    = CreateElement "ceTexPoly"
LMPanel_Compartment_Limitations_Page.name 		= "LMPanel_Compartment_Limitations_Page"
LMPanel_Compartment_Limitations_Page.material   = "LMPanel_Compartment_Limitations_Page"
LMPanel_Compartment_Limitations_Page.vertices 	   = {{-width, height},
										  { width, height},
										  { width,-height},
										  {-width,-height}}
LMPanel_Compartment_Limitations_Page.indices			= default_box_indices	
LMPanel_Compartment_Limitations_Page.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
LMPanel_Compartment_Limitations_Page.init_pos   = {0,0} 
LMPanel_Compartment_Limitations_Page.element_params   = {
							"LMPanel_Screen_brightness",
							"LMPanel_Compartment_Limitations_Page",
						} 
LMPanel_Compartment_Limitations_Page.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],
							{"parameter_in_range",1,0.95,1.05},
							}
LMPanel_Compartment_Limitations_Page.collimated = true
LMPanel_Compartment_Limitations_Page.parent_element = LMPanel_origin.name
LMPanel_Compartment_Limitations_Page.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(LMPanel_Compartment_Limitations_Page)
--------------------------------------------------------------------------------------------------------------------------------------------
local LMPanel_Characteristics_Page	    = CreateElement "ceTexPoly"
LMPanel_Characteristics_Page.name 		= "LMPanel_Characteristics_Page"
LMPanel_Characteristics_Page.material   = "LMPanel_Characteristics_Page"
LMPanel_Characteristics_Page.vertices 	   = {{-width, height},
										  { width, height},
										  { width,-height},
										  {-width,-height}}
LMPanel_Characteristics_Page.indices			= default_box_indices	
LMPanel_Characteristics_Page.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
LMPanel_Characteristics_Page.init_pos   = {0,0} 
LMPanel_Characteristics_Page.element_params   = {
							"LMPanel_Screen_brightness",
							"LMPanel_Characteristics_Page",
						} 
LMPanel_Characteristics_Page.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],
							{"parameter_in_range",1,0.95,1.05},
							}
LMPanel_Characteristics_Page.collimated = true
LMPanel_Characteristics_Page.parent_element = LMPanel_origin.name
LMPanel_Characteristics_Page.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(LMPanel_Characteristics_Page)
--------------------------------------------------------------------------------------------------------------------------------------------
local LMPanel_Planning_Data_Page	    = CreateElement "ceTexPoly"
LMPanel_Planning_Data_Page.name 		= "LMPanel_Planning_Data_Page"
LMPanel_Planning_Data_Page.material   = "LMPanel_Planning_Data_Page"
LMPanel_Planning_Data_Page.vertices 	   = {{-width, height},
										  { width, height},
										  { width,-height},
										  {-width,-height}}
LMPanel_Planning_Data_Page.indices			= default_box_indices	
LMPanel_Planning_Data_Page.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
LMPanel_Planning_Data_Page.init_pos   = {0,0} 
LMPanel_Planning_Data_Page.element_params   = {
							"LMPanel_Screen_brightness",
							"LMPanel_Planning_Data_Page",
						} 
LMPanel_Planning_Data_Page.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],
							{"parameter_in_range",1,0.95,1.05},
							}
LMPanel_Planning_Data_Page.collimated = true
LMPanel_Planning_Data_Page.parent_element = LMPanel_origin.name
LMPanel_Planning_Data_Page.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(LMPanel_Planning_Data_Page)
--------------------------------------------------------------------------------------------------------------------------------------------
local LMPanel_CofG_Page	    = CreateElement "ceTexPoly"
LMPanel_CofG_Page.name 		= "LMPanel_CofG_Page"
LMPanel_CofG_Page.material   = "LMPanel_CofG_Page"
LMPanel_CofG_Page.vertices 	   = {{-width, height},
								  { width, height},
								  { width,-height},
								  {-width,-height}}
LMPanel_CofG_Page.indices			= default_box_indices	
LMPanel_CofG_Page.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
LMPanel_CofG_Page.init_pos   = {0,0} 
LMPanel_CofG_Page.element_params   = {
							"LMPanel_Screen_brightness",
							"LMPanel_CofG_Page",
						} 
LMPanel_CofG_Page.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],
							{"parameter_in_range",1,0.95,1.05},
							}
LMPanel_CofG_Page.collimated = true
LMPanel_CofG_Page.parent_element = LMPanel_origin.name
LMPanel_CofG_Page.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(LMPanel_CofG_Page)
--------------------------------------------------------------------------------------------------------------------------------------------
local LMPanel_YellowCross	    = CreateElement "ceTexPoly"
LMPanel_YellowCross.name 		= "LMPanel_YellowCross"
LMPanel_YellowCross.material   = "LMPanel_YellowCross"
LMPanel_YellowCross.vertices 	   = {{-0.05, 0.05},
								  { 0.05, 0.05},
								  { 0.05,-0.05},
								  {-0.05,-0.05}}
LMPanel_YellowCross.indices			= default_box_indices	
LMPanel_YellowCross.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
LMPanel_YellowCross.init_pos   = {0,0} 
LMPanel_YellowCross.element_params   = {
							"LMPanel_Screen_brightness",
							"LMPanel_CofG_Page",
							"LMPanel_YellowCross_Show",
							"LMPanel_CofG_Page_GrossWeight",
							"LMPanel_CofG_Page_CofG",
						} 
LMPanel_YellowCross.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],
							{"parameter_in_range",1,0.95,1.05},
							{"parameter_in_range",2,0.95,1.05},
							{"move_up_down_using_parameter",3, 1.0 },
							{"move_left_right_using_parameter",4, 1.0 },
							}
LMPanel_YellowCross.collimated = true
LMPanel_YellowCross.parent_element = LMPanel_origin.name
LMPanel_YellowCross.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(LMPanel_YellowCross)
--------------------------------------------------------------------------------------------------------------------------------------------
local LMPanel_RedCross	    = CreateElement "ceTexPoly"
LMPanel_RedCross.name 		= "LMPanel_RedCross"
LMPanel_RedCross.material   = "LMPanel_RedCross"
LMPanel_RedCross.vertices 	   = {{-0.05, 0.05},
								  { 0.05, 0.05},
								  { 0.05,-0.05},
								  {-0.05,-0.05}}
LMPanel_RedCross.indices			= default_box_indices	
LMPanel_RedCross.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
LMPanel_RedCross.init_pos   = {0,0} 
LMPanel_RedCross.element_params   = {
							"LMPanel_Screen_brightness",
							"LMPanel_CofG_Page",
							"LMPanel_RedCross_Show",
							"LMPanel_CofG_Page_GrossWeight",
							"LMPanel_CofG_Page_CofG",
						} 
LMPanel_RedCross.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],
							{"parameter_in_range",1,0.95,1.05},
							{"parameter_in_range",2,0.95,1.05},
							{"move_up_down_using_parameter",3, 1.0 },
							{"move_left_right_using_parameter",4, 1.0 },
							}
LMPanel_RedCross.collimated = true
LMPanel_RedCross.parent_element = LMPanel_origin.name
LMPanel_RedCross.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(LMPanel_RedCross)
































