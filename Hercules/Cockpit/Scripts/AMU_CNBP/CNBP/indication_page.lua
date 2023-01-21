

dofile(LockOn_Options.script_path.."AMU_CNBP/Display_definitions.lua")

-------------------------------------------------------------------------------CNBP_CB

local CNBP_CB_origin	         = CreateElement "ceSimple"
CNBP_CB_origin.name 		     = "CNBP_CB_origin"
CNBP_CB_origin.init_pos        = {0,0}
CNBP_CB_origin.element_params   = {
								"CNBP_CB",
										   } 
CNBP_CB_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
CNBP_CB_origin.collimated 		 = true
AddElement(CNBP_CB_origin)

local CNBP_CB	    = CreateElement "ceTexPoly" 
CNBP_CB.name 		= "CNBP_CB"
CNBP_CB.material   = "CNBP_CB_page"
CNBP_CB.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
CNBP_CB.indices			= default_box_indices	
CNBP_CB.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
CNBP_CB.init_pos   = {0,0} 
CNBP_CB.element_params   = {
							"CNBP_brightness",
						} 
CNBP_CB.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
CNBP_CB.collimated = true
CNBP_CB.parent_element = CNBP_CB_origin.name
CNBP_CB.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(CNBP_CB)

-------------------------------------------------------------------------------CNBP_Comm

local CNBP_Comm_origin	         = CreateElement "ceSimple"
CNBP_Comm_origin.name 		     = "CNBP_Comm_origin"
CNBP_Comm_origin.init_pos        = {0,0}
CNBP_Comm_origin.element_params   = {
								"CNBP_Comm",
										   } 
CNBP_Comm_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
CNBP_Comm_origin.collimated 		 = true
AddElement(CNBP_Comm_origin)

local CNBP_Comm	    = CreateElement "ceTexPoly" 
CNBP_Comm.name 		= "CNBP_Comm"
CNBP_Comm.material   = "CNBP_Comm_page"
CNBP_Comm.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
CNBP_Comm.indices			= default_box_indices	
CNBP_Comm.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
CNBP_Comm.init_pos   = {0,0} 
CNBP_Comm.element_params   = {
							"CNBP_brightness",
						} 
CNBP_Comm.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
CNBP_Comm.collimated = true
CNBP_Comm.parent_element = CNBP_Comm_origin.name
CNBP_Comm.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(CNBP_Comm)

-------------------------------------------------------------------------------CNBP_NAV

local CNBP_NAV_origin	         = CreateElement "ceSimple"
CNBP_NAV_origin.name 		     = "CNBP_NAV_origin"
CNBP_NAV_origin.init_pos        = {0,0}
CNBP_NAV_origin.element_params   = {
								"CNBP_NAV",
										   } 
CNBP_NAV_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
CNBP_NAV_origin.collimated 		 = true
AddElement(CNBP_NAV_origin)

local CNBP_NAV	    = CreateElement "ceTexPoly" 
CNBP_NAV.name 		= "CNBP_NAV"
CNBP_NAV.material   = "CNBP_NAV_page"
CNBP_NAV.vertices 	   = {{-width, height},
					  { width, height},
					  { width,-height},
					  {-width,-height}}
CNBP_NAV.indices			= default_box_indices	
CNBP_NAV.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
CNBP_NAV.init_pos   = {0,0} 
CNBP_NAV.element_params   = {
							"CNBP_brightness",
						} 
CNBP_NAV.controllers 	   = {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
							}
CNBP_NAV.collimated = true
CNBP_NAV.parent_element = CNBP_NAV_origin.name
CNBP_NAV.blend_mode 	=  blend_mode.IBM_REGULAR
AddElement(CNBP_NAV)





