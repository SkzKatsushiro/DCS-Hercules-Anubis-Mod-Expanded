

dofile(LockOn_Options.script_path.."AMU_CNBP/Display_definitions.lua")

-------------------------------------------------------------------------------COPILOT_AMU001_Main_Menu

local COPILOT_AMU001_Main_Menu_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_Main_Menu_origin.name 		     = "COPILOT_AMU001_Main_Menu_origin"
COPILOT_AMU001_Main_Menu_origin.init_pos        = {0,0}
COPILOT_AMU001_Main_Menu_origin.element_params   = {
								"COPILOT_AMU001_Main_Menu",
										   } 
COPILOT_AMU001_Main_Menu_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_Main_Menu_origin.collimated 		 = true
AddElement(COPILOT_AMU001_Main_Menu_origin)

local COPILOT_AMU001_Main_Menu	    = CreateElement "ceTexPoly"
COPILOT_AMU001_Main_Menu.name 		= "COPILOT_AMU001_Main_Menu"
COPILOT_AMU001_Main_Menu.material   = "AMU001_Main_Menu"
COPILOT_AMU001_Main_Menu.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_Main_Menu.indices			= default_box_indices	
COPILOT_AMU001_Main_Menu.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_Main_Menu.init_pos   = {0,0} 
COPILOT_AMU001_Main_Menu.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_Main_Menu.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_Main_Menu.collimated = true
COPILOT_AMU001_Main_Menu.parent_element = COPILOT_AMU001_Main_Menu_origin.name
COPILOT_AMU001_Main_Menu.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_Main_Menu)

-------------------------------------------------------------------------------COPILOT_AMU001_PFD

local COPILOT_AMU001_PFD_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_PFD_origin.name 		     = "COPILOT_AMU001_PFD_origin"
COPILOT_AMU001_PFD_origin.init_pos        = {0,0}
COPILOT_AMU001_PFD_origin.element_params   = {
								"COPILOT_AMU001_PFD",
										   } 
COPILOT_AMU001_PFD_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_PFD_origin.collimated 		 = true
AddElement(COPILOT_AMU001_PFD_origin)

local COPILOT_AMU001_PFD	    = CreateElement "ceTexPoly"
COPILOT_AMU001_PFD.name 		= "COPILOT_AMU001_PFD"
COPILOT_AMU001_PFD.material   = "AMU001_PFD_Display"
COPILOT_AMU001_PFD.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_PFD.indices			= default_box_indices	
COPILOT_AMU001_PFD.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_PFD.init_pos   = {0,0} 
COPILOT_AMU001_PFD.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_PFD.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_PFD.collimated = true
COPILOT_AMU001_PFD.parent_element = COPILOT_AMU001_PFD_origin.name
COPILOT_AMU001_PFD.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_PFD)

-------------------------------------------------------------------------------COPILOT_AMU001_Engine_Status

local COPILOT_AMU001_Engine_Status_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_Engine_Status_origin.name 		     = "COPILOT_AMU001_Engine_Status_origin"
COPILOT_AMU001_Engine_Status_origin.init_pos        = {0,0}
COPILOT_AMU001_Engine_Status_origin.element_params   = {
								"COPILOT_AMU001_Engine_Status",
										   } 
COPILOT_AMU001_Engine_Status_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_Engine_Status_origin.collimated 		 = true
AddElement(COPILOT_AMU001_Engine_Status_origin)

local COPILOT_AMU001_Engine_Status	    = CreateElement "ceTexPoly"
COPILOT_AMU001_Engine_Status.name 		= "COPILOT_AMU001_Engine_Status"
COPILOT_AMU001_Engine_Status.material   = "AMU001_ENGINE_Display"
COPILOT_AMU001_Engine_Status.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_Engine_Status.indices			= default_box_indices	
COPILOT_AMU001_Engine_Status.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_Engine_Status.init_pos   = {0,0} 
COPILOT_AMU001_Engine_Status.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_Engine_Status.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_Engine_Status.collimated = true
COPILOT_AMU001_Engine_Status.parent_element = COPILOT_AMU001_Engine_Status_origin.name
COPILOT_AMU001_Engine_Status.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_Engine_Status)

-------------------------------------------------------------------------------COPILOT_AMU001_System_Status

local COPILOT_AMU001_System_Status_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_System_Status_origin.name 		     = "COPILOT_AMU001_System_Status_origin"
COPILOT_AMU001_System_Status_origin.init_pos        = {0,0}
COPILOT_AMU001_System_Status_origin.element_params   = {
								"COPILOT_AMU001_System_Status",
										   } 
COPILOT_AMU001_System_Status_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_System_Status_origin.collimated 		 = true
AddElement(COPILOT_AMU001_System_Status_origin)

local COPILOT_AMU001_System_Status	    = CreateElement "ceTexPoly"
COPILOT_AMU001_System_Status.name 		= "COPILOT_AMU001_System_Status"
COPILOT_AMU001_System_Status.material   = "AMU001_SYTEM_STATUS_Display"
COPILOT_AMU001_System_Status.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_System_Status.indices			= default_box_indices	
COPILOT_AMU001_System_Status.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_System_Status.init_pos   = {0,0} 
COPILOT_AMU001_System_Status.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_System_Status.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_System_Status.collimated = true
COPILOT_AMU001_System_Status.parent_element = COPILOT_AMU001_System_Status_origin.name
COPILOT_AMU001_System_Status.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_System_Status)

-------------------------------------------------------------------------------COPILOT_AMU001_Nav_Radar_Display

local COPILOT_AMU001_Nav_Radar_Display_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_Nav_Radar_Display_origin.name 		     = "COPILOT_AMU001_Nav_Radar_Display_origin"
COPILOT_AMU001_Nav_Radar_Display_origin.init_pos        = {0,0}
COPILOT_AMU001_Nav_Radar_Display_origin.element_params   = {
								"COPILOT_AMU001_Nav_Radar_Display",
										   } 
COPILOT_AMU001_Nav_Radar_Display_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_Nav_Radar_Display_origin.collimated 		 = true
AddElement(COPILOT_AMU001_Nav_Radar_Display_origin)

local COPILOT_AMU001_Nav_Radar_Display	    = CreateElement "ceTexPoly"
COPILOT_AMU001_Nav_Radar_Display.name 		= "COPILOT_AMU001_Nav_Radar_Display"
COPILOT_AMU001_Nav_Radar_Display.material   = "AMU001_Nav_Radar_Display"
COPILOT_AMU001_Nav_Radar_Display.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_Nav_Radar_Display.indices			= default_box_indices	
COPILOT_AMU001_Nav_Radar_Display.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_Nav_Radar_Display.init_pos   = {0,0} 
COPILOT_AMU001_Nav_Radar_Display.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_Nav_Radar_Display.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_Nav_Radar_Display.collimated = true
COPILOT_AMU001_Nav_Radar_Display.parent_element = COPILOT_AMU001_Nav_Radar_Display_origin.name
COPILOT_AMU001_Nav_Radar_Display.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_Nav_Radar_Display)

-------------------------------------------------------------------------------COPILOT_AMU001_Dig_Map

local COPILOT_AMU001_Dig_Map_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_Dig_Map_origin.name 		     = "COPILOT_AMU001_Dig_Map_origin"
COPILOT_AMU001_Dig_Map_origin.init_pos        = {0,0}
COPILOT_AMU001_Dig_Map_origin.element_params   = {
								"COPILOT_AMU001_Digital_Map",
										   } 
COPILOT_AMU001_Dig_Map_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_Dig_Map_origin.collimated 		 = true
AddElement(COPILOT_AMU001_Dig_Map_origin)

local COPILOT_AMU001_Dig_Map	    = CreateElement "ceTexPoly"
COPILOT_AMU001_Dig_Map.name 		= "COPILOT_AMU001_Dig_Map"
COPILOT_AMU001_Dig_Map.material   = "AMU001_Digital_Map"   
COPILOT_AMU001_Dig_Map.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_Dig_Map.indices			= default_box_indices	
COPILOT_AMU001_Dig_Map.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_Dig_Map.init_pos   = {0,0} 
COPILOT_AMU001_Dig_Map.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_Dig_Map.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_Dig_Map.collimated = true
COPILOT_AMU001_Dig_Map.parent_element = COPILOT_AMU001_Dig_Map_origin.name
COPILOT_AMU001_Dig_Map.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_Dig_Map)

-------------------------------------------------------------------------------COPILOT_AMU001_TAWS_Display

local COPILOT_AMU001_TAWS_Display_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_TAWS_Display_origin.name 		     = "COPILOT_AMU001_TAWS_Display_origin"
COPILOT_AMU001_TAWS_Display_origin.init_pos        = {0,0}
COPILOT_AMU001_TAWS_Display_origin.element_params   = {
								"COPILOT_AMU001_TAWS_Display",
										   } 
COPILOT_AMU001_TAWS_Display_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_TAWS_Display_origin.collimated 		 = true
AddElement(COPILOT_AMU001_TAWS_Display_origin)

local COPILOT_AMU001_TAWS_Display	    = CreateElement "ceTexPoly"
COPILOT_AMU001_TAWS_Display.name 		= "COPILOT_AMU001_TAWS_Display"
COPILOT_AMU001_TAWS_Display.material   = "AMU001_TAWS_Display"
COPILOT_AMU001_TAWS_Display.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_TAWS_Display.indices			= default_box_indices	
COPILOT_AMU001_TAWS_Display.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_TAWS_Display.init_pos   = {0,0} 
COPILOT_AMU001_TAWS_Display.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_TAWS_Display.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_TAWS_Display.collimated = true
COPILOT_AMU001_TAWS_Display.parent_element = COPILOT_AMU001_TAWS_Display_origin.name
COPILOT_AMU001_TAWS_Display.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_TAWS_Display)

-------------------------------------------------------------------------------COPILOT_AMU001_Nav_Select

local COPILOT_AMU001_Nav_Select_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_Nav_Select_origin.name 		     = "COPILOT_AMU001_Nav_Select_origin"
COPILOT_AMU001_Nav_Select_origin.init_pos        = {0,0}
COPILOT_AMU001_Nav_Select_origin.element_params   = {
								"COPILOT_AMU001_Nav_Select",
										   } 
COPILOT_AMU001_Nav_Select_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_Nav_Select_origin.collimated 		 = true
AddElement(COPILOT_AMU001_Nav_Select_origin)

local COPILOT_AMU001_Nav_Select	    = CreateElement "ceTexPoly"
COPILOT_AMU001_Nav_Select.name 		= "COPILOT_AMU001_Nav_Select"
COPILOT_AMU001_Nav_Select.material   = "AMU001_Nav_Select"
COPILOT_AMU001_Nav_Select.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_Nav_Select.indices			= default_box_indices	
COPILOT_AMU001_Nav_Select.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_Nav_Select.init_pos   = {0,0} 
COPILOT_AMU001_Nav_Select.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_Nav_Select.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_Nav_Select.collimated = true
COPILOT_AMU001_Nav_Select.parent_element = COPILOT_AMU001_Nav_Select_origin.name
COPILOT_AMU001_Nav_Select.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_Nav_Select)

-------------------------------------------------------------------------------COPILOT_AMU001_Unit_Settings

local COPILOT_AMU001_Unit_Settings_origin	         = CreateElement "ceSimple"
COPILOT_AMU001_Unit_Settings_origin.name 		     = "COPILOT_AMU001_Unit_Settings_origin"
COPILOT_AMU001_Unit_Settings_origin.init_pos        = {0,0}
COPILOT_AMU001_Unit_Settings_origin.element_params   = {
								"COPILOT_AMU001_Unit_Settings",
										   } 
COPILOT_AMU001_Unit_Settings_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU001_Unit_Settings_origin.collimated 		 = true
AddElement(COPILOT_AMU001_Unit_Settings_origin)

local COPILOT_AMU001_Unit_Settings	    = CreateElement "ceTexPoly"
COPILOT_AMU001_Unit_Settings.name 		= "COPILOT_AMU001_Unit_Settings"
COPILOT_AMU001_Unit_Settings.material   = "AMU001_Unit_Settings"
COPILOT_AMU001_Unit_Settings.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU001_Unit_Settings.indices			= default_box_indices	
COPILOT_AMU001_Unit_Settings.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU001_Unit_Settings.init_pos   = {0,0} 
COPILOT_AMU001_Unit_Settings.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU001_Unit_Settings.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU001_Unit_Settings.collimated = true
COPILOT_AMU001_Unit_Settings.parent_element = COPILOT_AMU001_Unit_Settings_origin.name
COPILOT_AMU001_Unit_Settings.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU001_Unit_Settings)

Add_Object_Text(COPILOT_Alt_Set, "COPILOT_Alt_Set", COPILOT_AMU001_Unit_Settings.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"feet"},--format_value
					{0.007,0.007,  -0.003, 0},--stringdefs_value
					210.0,--initpixelposx
					73.0,--initpixelposy
					{--params
						"COPILOT_AMU_brightness",
						"",
						"Alt_unit",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
						{"parameter_in_range",2,-0.05,0.05},
					}
				)
Add_Object_Text(COPILOT_Alt_Set, "COPILOT_Alt_Set", COPILOT_AMU001_Unit_Settings.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"meter"},--format_value
					{0.007,0.007,  -0.003, 0},--stringdefs_value
					210.0,--initpixelposx
					73.0,--initpixelposy
					{--params
						"COPILOT_AMU_brightness",
						"",
						"Alt_unit",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
						{"parameter_in_range",2,0.95,1.05},
					}
				)

Add_Object_Text(COPILOT_Baro_Set, "COPILOT_Baro_Set", COPILOT_AMU001_Unit_Settings.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"inHg"},--format_value
					{0.007,0.007,  -0.003, 0},--stringdefs_value
					150.0,--initpixelposx
					140.0,--initpixelposy
					{--params
						"COPILOT_AMU_brightness",
						"",
						"Baro_unit",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
						{"parameter_in_range",2,-0.05,0.05},
					}
				)
Add_Object_Text(COPILOT_Baro_Set, "COPILOT_Baro_Set", COPILOT_AMU001_Unit_Settings.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"mbar"},--format_value
					{0.007,0.007,  -0.003, 0},--stringdefs_value
					150.0,--initpixelposx
					140.0,--initpixelposy
					{--params
						"COPILOT_AMU_brightness",
						"",
						"Baro_unit",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
						{"parameter_in_range",2,0.95,1.05},
					}
				)













