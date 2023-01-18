

dofile(LockOn_Options.script_path.."AMU_CNBP/Display_definitions.lua")

-------------------------------------------------------------------------------COPILOT_AMU002_Main_Menu

local COPILOT_AMU002_Main_Menu_origin	         = CreateElement "ceSimple"
COPILOT_AMU002_Main_Menu_origin.name 		     = "COPILOT_AMU002_Main_Menu_origin"
COPILOT_AMU002_Main_Menu_origin.init_pos        = {0,0}
COPILOT_AMU002_Main_Menu_origin.element_params   = {
								"COPILOT_AMU002_Main_Menu",
										   } 
COPILOT_AMU002_Main_Menu_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU002_Main_Menu_origin.collimated 		 = true
AddElement(COPILOT_AMU002_Main_Menu_origin)

local COPILOT_AMU002_Main_Menu	    = CreateElement "ceTexPoly" 
COPILOT_AMU002_Main_Menu.name 		= "COPILOT_AMU002_Main_Menu"
COPILOT_AMU002_Main_Menu.material   = "AMU002_Main_Menu"
COPILOT_AMU002_Main_Menu.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU002_Main_Menu.indices			= default_box_indices	
COPILOT_AMU002_Main_Menu.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU002_Main_Menu.init_pos   = {0,0} 
COPILOT_AMU002_Main_Menu.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU002_Main_Menu.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU002_Main_Menu.collimated = true
COPILOT_AMU002_Main_Menu.parent_element = COPILOT_AMU002_Main_Menu_origin.name
COPILOT_AMU002_Main_Menu.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU002_Main_Menu)
-------------------------------------------------------------------------------COPILOT_AMU002_Range

local COPILOT_AMU002_Range_origin	         = CreateElement "ceSimple"
COPILOT_AMU002_Range_origin.name 		     = "COPILOT_AMU002_Range_origin"
COPILOT_AMU002_Range_origin.init_pos        = {0,0}
COPILOT_AMU002_Range_origin.element_params   = {
								"COPILOT_AMU002_Range",
										   } 
COPILOT_AMU002_Range_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU002_Range_origin.collimated 		 = true
AddElement(COPILOT_AMU002_Range_origin)

local COPILOT_AMU002_Range	    = CreateElement "ceTexPoly" 
COPILOT_AMU002_Range.name 		= "COPILOT_AMU002_Range"
COPILOT_AMU002_Range.material   = "AMU002_Range"
COPILOT_AMU002_Range.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU002_Range.indices			= default_box_indices	
COPILOT_AMU002_Range.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU002_Range.init_pos   = {0,0} 
COPILOT_AMU002_Range.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU002_Range.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU002_Range.collimated = true
COPILOT_AMU002_Range.parent_element = COPILOT_AMU002_Range_origin.name
COPILOT_AMU002_Range.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU002_Range)

-------------------------------------------------------------------------------COPILOT_AMU002_Overlays

local COPILOT_AMU002_Overlays_origin	         = CreateElement "ceSimple"
COPILOT_AMU002_Overlays_origin.name 		     = "COPILOT_AMU002_Overlays_origin"
COPILOT_AMU002_Overlays_origin.init_pos        = {0,0}
COPILOT_AMU002_Overlays_origin.element_params   = {
								"COPILOT_AMU002_Overlays",
										   } 
COPILOT_AMU002_Overlays_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU002_Overlays_origin.collimated 		 = true
AddElement(COPILOT_AMU002_Overlays_origin)

local COPILOT_AMU002_Overlays	    = CreateElement "ceTexPoly" 
COPILOT_AMU002_Overlays.name 		= "COPILOT_AMU002_Overlays"
COPILOT_AMU002_Overlays.material   = "AMU002_Overlays"
COPILOT_AMU002_Overlays.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU002_Overlays.indices			= default_box_indices	
COPILOT_AMU002_Overlays.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU002_Overlays.init_pos   = {0,0} 
COPILOT_AMU002_Overlays.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU002_Overlays.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU002_Overlays.collimated = true
COPILOT_AMU002_Overlays.parent_element = COPILOT_AMU002_Overlays_origin.name
COPILOT_AMU002_Overlays.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU002_Overlays)

-------------------------------------------------------------------------------COPILOT_AMU002_HDD_Pos

local COPILOT_AMU002_HDD_Pos_origin	         = CreateElement "ceSimple"
COPILOT_AMU002_HDD_Pos_origin.name 		     = "COPILOT_AMU002_HDD_Pos_origin"
COPILOT_AMU002_HDD_Pos_origin.init_pos        = {0,0}
COPILOT_AMU002_HDD_Pos_origin.element_params   = {
								"COPILOT_AMU002_HDD_Pos",
										   } 
COPILOT_AMU002_HDD_Pos_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU002_HDD_Pos_origin.collimated 		 = true
AddElement(COPILOT_AMU002_HDD_Pos_origin)

local COPILOT_AMU002_HDD_Pos	    = CreateElement "ceTexPoly" 
COPILOT_AMU002_HDD_Pos.name 		= "COPILOT_AMU002_HDD_Pos"
COPILOT_AMU002_HDD_Pos.material   = "AMU002_HDD_Pos"
COPILOT_AMU002_HDD_Pos.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU002_HDD_Pos.indices			= default_box_indices	
COPILOT_AMU002_HDD_Pos.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU002_HDD_Pos.init_pos   = {0,0} 
COPILOT_AMU002_HDD_Pos.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU002_HDD_Pos.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU002_HDD_Pos.collimated = true
COPILOT_AMU002_HDD_Pos.parent_element = COPILOT_AMU002_HDD_Pos_origin.name
COPILOT_AMU002_HDD_Pos.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU002_HDD_Pos)


-------------------------------------------------------------------------------COPILOT_AMU002_CDI

local COPILOT_AMU002_CDI_origin	         = CreateElement "ceSimple"
COPILOT_AMU002_CDI_origin.name 		     = "COPILOT_AMU002_CDI_origin"
COPILOT_AMU002_CDI_origin.init_pos        = {0,0}
COPILOT_AMU002_CDI_origin.element_params   = {
								"COPILOT_AMU002_CDI",
										   } 
COPILOT_AMU002_CDI_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
COPILOT_AMU002_CDI_origin.collimated 		 = true
AddElement(COPILOT_AMU002_CDI_origin)

local COPILOT_AMU002_CDI	    = CreateElement "ceTexPoly" 
COPILOT_AMU002_CDI.name 		= "COPILOT_AMU002_CDI"
COPILOT_AMU002_CDI.material   = "AMU002_CDI"
COPILOT_AMU002_CDI.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
COPILOT_AMU002_CDI.indices			= default_box_indices	
COPILOT_AMU002_CDI.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
COPILOT_AMU002_CDI.init_pos   = {0,0} 
COPILOT_AMU002_CDI.element_params   = {
							"COPILOT_AMU_brightness",
						} 
COPILOT_AMU002_CDI.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
COPILOT_AMU002_CDI.collimated = true
COPILOT_AMU002_CDI.parent_element = COPILOT_AMU002_CDI_origin.name
COPILOT_AMU002_CDI.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(COPILOT_AMU002_CDI)



