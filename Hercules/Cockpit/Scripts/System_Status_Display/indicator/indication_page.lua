

dofile(LockOn_Options.script_path.."System_Status_Display/indicator/definitions.lua")

-- System_brightness_parameter = ""   ---- Declared in the HDD indicator files
-- System_origin = ""   ---- Declared in the HDD indicator files
--------------------------------------------------------------------------------------------------------------------------------------------System_Status

SetScale(FOV)

local aspect 	   = GetAspect()
local verts = {{-1, aspect},
			   { 1, aspect},
			   { 1,-aspect},
			   {-1,-aspect}}
				  
--------------------------------------------------------------------------------------------------------System_Status			  
local System_Status				= CreateElement "ceTexPoly" -- System_Statuschrome
System_Status.name				= "System_Status"
System_Status.vertices			= verts
System_Status.indices			= {0, 1, 2, 0, 2, 3}
System_Status.tex_coords 		= {{0,0},{1,0},{1,1},{0,1}}
System_Status.material		=  "System_Status"
System_Status.element_params		= {
										System_brightness_parameter,
										}
System_Status.controllers		= {
							BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
									}
System_Status.use_mipfilter     	= true
System_Status.collimated			= false
System_Status.additive_alpha    	= true
System_Status.blend_mode 		= blend_mode.IBM_REGULAR
System_Status.h_clip_relation	= h_clip_relations.COMPARE
System_Status.level				= DISPLAY_DEFAULT_LEVEL
System_Status.parent_element		= System_origin
System_Status.isvisible		= true -- visible ou pas pour debug
Add(System_Status)
-------------------------------------------------------------------------------------------------------------------------------------------System_Status data
------------------------------------------------------------------------------------------------------------Engine1_GEN data
Add_System_Status_Text(Engine1_GEN_A, "Engine1_GEN_A", "font_Arial_white", "RightCenter", System_origin, "Engine1_GEN", 0.5, 120.5, {"%.0f"}, 398, 188.5)--pixel pos on image
Add_System_Status_Text(Engine1_GEN_A_LOW, "Engine1_GEN_A_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine1_GEN", -0.5, 0.5, {"%.0f"}, 380, 188.5)
Add_System_Status_Text(Engine1_GEN_B, "Engine1_GEN_B", "font_Arial_white", "RightCenter", System_origin, "Engine1_GEN", 0.5, 120.5, {"%.0f"}, 398, 229.5)
Add_System_Status_Text(Engine1_GEN_B_LOW, "Engine1_GEN_B_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine1_GEN", -0.5, 0.5, {"%.0f"}, 380, 229.5)
Add_System_Status_Text(Engine1_GEN_C, "Engine1_GEN_C", "font_Arial_white", "RightCenter", System_origin, "Engine1_GEN", 0.5, 120.5, {"%.0f"}, 398, 273.5)
Add_System_Status_Text(Engine1_GEN_C_LOW, "Engine1_GEN_C_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine1_GEN", -0.5, 0.5, {"%.0f"}, 380, 273.5)
Add_System_Status_Text(Engine1_GEN_LOAD, "Engine1_GEN_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine1_GEN_LOAD", 0.1, 10.5, {"%.1f"}, 400, 321.5)
Add_System_Status_Text(Engine1_GEN_LOAD_LOW, "Engine1_GEN_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine1_GEN_LOAD", -0.1, 0.1, {"%.0f"}, 380, 321.5)
Add_System_Status_Text(Engine1_GEN_TR_LOAD, "Engine1_GEN_TR_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine1_GEN_TR_LOAD", 0.1, 10.5, {"%.1f"}, 400, 395.5)
Add_System_Status_Text(Engine1_GEN_TR_LOAD_LOW, "Engine1_GEN_TR_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine1_GEN_TR_LOAD", -0.1, 0.1, {"%.0f"}, 380, 395.5)
Add_System_Status_Text(Engine1_DC_BUS_V, "Engine1_DC_BUS_V", "font_Arial_white", "RightCenter", System_origin, "Engine1_DC_BUS_V", 25, 28.5, {"%.0f"}, 398, 443.5)
Add_System_Status_Text(Engine1_DC_BUS_V_LOW, "Engine1_DC_BUS_V_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine1_DC_BUS_V", -0.5, 25, {"%.0f"}, 380, 443.5)
------------------------------------------------------------------------------------------------------------Engine2_GEN data
Add_System_Status_Text(Engine2_GEN_A, "Engine2_GEN_A", "font_Arial_white", "RightCenter", System_origin, "Engine2_GEN", 0.5, 120.5, {"%.0f"}, 518, 188.5)--pixel pos on image
Add_System_Status_Text(Engine2_GEN_A_LOW, "Engine2_GEN_A_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine2_GEN", -0.5, 0.5, {"%.0f"}, 500, 188.5)
Add_System_Status_Text(Engine2_GEN_B, "Engine2_GEN_B", "font_Arial_white", "RightCenter", System_origin, "Engine2_GEN", 0.5, 120.5, {"%.0f"}, 518, 229.5)
Add_System_Status_Text(Engine2_GEN_B_LOW, "Engine2_GEN_B_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine2_GEN", -0.5, 0.5, {"%.0f"}, 500, 229.5)
Add_System_Status_Text(Engine2_GEN_C, "Engine2_GEN_C", "font_Arial_white", "RightCenter", System_origin, "Engine2_GEN", 0.5, 120.5, {"%.0f"}, 518, 273.5)
Add_System_Status_Text(Engine2_GEN_C_LOW, "Engine2_GEN_C_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine2_GEN", -0.5, 0.5, {"%.0f"}, 500, 273.5)
Add_System_Status_Text(Engine2_GEN_LOAD, "Engine2_GEN_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine2_GEN_LOAD", 0.1, 10.5, {"%.1f"}, 520, 321.5)
Add_System_Status_Text(Engine2_GEN_LOAD_LOW, "Engine2_GEN_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine2_GEN_LOAD", -0.1, 0.1, {"%.0f"}, 500, 321.5)
Add_System_Status_Text(Engine2_GEN_TR_LOAD, "Engine2_GEN_TR_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine2_GEN_TR_LOAD", 0.1, 10.5, {"%.1f"}, 520, 395.5)
Add_System_Status_Text(Engine2_GEN_TR_LOAD_LOW, "Engine2_GEN_TR_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine2_GEN_TR_LOAD", -0.1, 0.1, {"%.0f"}, 500, 395.5)
Add_System_Status_Text(Engine2_DC_BUS_V, "Engine2_DC_BUS_V", "font_Arial_white", "RightCenter", System_origin, "Engine2_DC_BUS_V", 25, 28.5, {"%.0f"}, 518, 443.5)
Add_System_Status_Text(Engine2_DC_BUS_V_LOW, "Engine2_DC_BUS_V_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine2_DC_BUS_V", -0.5, 25, {"%.0f"}, 500, 443.5)
------------------------------------------------------------------------------------------------------------Engine3_GEN data
Add_System_Status_Text(Engine3_GEN_A, "Engine3_GEN_A", "font_Arial_white", "RightCenter", System_origin, "Engine3_GEN", 0.5, 120.5, {"%.0f"}, 638, 188.5)--pixel pos on image
Add_System_Status_Text(Engine3_GEN_A_LOW, "Engine3_GEN_A_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine3_GEN", -0.5, 0.5, {"%.0f"}, 620, 188.5)
Add_System_Status_Text(Engine3_GEN_B, "Engine3_GEN_B", "font_Arial_white", "RightCenter", System_origin, "Engine3_GEN", 0.5, 120.5, {"%.0f"}, 638, 229.5)
Add_System_Status_Text(Engine3_GEN_B_LOW, "Engine3_GEN_B_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine3_GEN", -0.5, 0.5, {"%.0f"}, 620, 229.5)
Add_System_Status_Text(Engine3_GEN_C, "Engine3_GEN_C", "font_Arial_white", "RightCenter", System_origin, "Engine3_GEN", 0.5, 120.5, {"%.0f"}, 638, 273.5)
Add_System_Status_Text(Engine3_GEN_C_LOW, "Engine3_GEN_C_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine3_GEN", -0.5, 0.5, {"%.0f"}, 620, 273.5)
Add_System_Status_Text(Engine3_GEN_LOAD, "Engine3_GEN_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine3_GEN_LOAD", 0.1, 10.5, {"%.1f"}, 640, 321.5)
Add_System_Status_Text(Engine3_GEN_LOAD_LOW, "Engine3_GEN_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine3_GEN_LOAD", -0.1, 0.1, {"%.0f"}, 620, 321.5)
Add_System_Status_Text(Engine3_GEN_TR_LOAD, "Engine3_GEN_TR_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine3_GEN_TR_LOAD", 0.1, 10.5, {"%.1f"}, 640, 395.5)
Add_System_Status_Text(Engine3_GEN_TR_LOAD_LOW, "Engine3_GEN_TR_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine3_GEN_TR_LOAD", -0.1, 0.1, {"%.0f"}, 620, 395.5)
Add_System_Status_Text(Engine3_DC_BUS_V, "Engine3_DC_BUS_V", "font_Arial_white", "RightCenter", System_origin, "Engine3_DC_BUS_V", 25, 28.5, {"%.0f"}, 638, 443.5)
Add_System_Status_Text(Engine3_DC_BUS_V_LOW, "Engine3_DC_BUS_V_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine3_DC_BUS_V", -0.5, 25, {"%.0f"}, 620, 443.5)
------------------------------------------------------------------------------------------------------------Engine4_GEN data
Add_System_Status_Text(Engine4_GEN_A, "Engine4_GEN_A", "font_Arial_white", "RightCenter", System_origin, "Engine4_GEN", 0.5, 120.5, {"%.0f"}, 758, 188.5)--pixel pos on image
Add_System_Status_Text(Engine4_GEN_A_LOW, "Engine4_GEN_A_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine4_GEN", -0.5, 0.5, {"%.0f"}, 740, 188.5)
Add_System_Status_Text(Engine4_GEN_B, "Engine4_GEN_B", "font_Arial_white", "RightCenter", System_origin, "Engine4_GEN", 0.5, 120.5, {"%.0f"}, 758, 229.5)
Add_System_Status_Text(Engine4_GEN_B_LOW, "Engine4_GEN_B_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine4_GEN", -0.5, 0.5, {"%.0f"}, 740, 229.5)
Add_System_Status_Text(Engine4_GEN_C, "Engine4_GEN_C", "font_Arial_white", "RightCenter", System_origin, "Engine4_GEN", 0.5, 120.5, {"%.0f"}, 758, 273.5)
Add_System_Status_Text(Engine4_GEN_C_LOW, "Engine4_GEN_C_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine4_GEN", -0.5, 0.5, {"%.0f"}, 740, 273.5)
Add_System_Status_Text(Engine4_GEN_LOAD, "Engine4_GEN_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine4_GEN_LOAD", 0.1, 10.5, {"%.1f"}, 760, 321.5)
Add_System_Status_Text(Engine4_GEN_LOAD_LOW, "Engine4_GEN_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine4_GEN_LOAD", -0.1, 0.1, {"%.0f"}, 740, 321.5)
Add_System_Status_Text(Engine4_GEN_TR_LOAD, "Engine4_GEN_TR_LOAD", "font_Arial_white", "RightCenter", System_origin, "Engine4_GEN_TR_LOAD", 0.1, 10.5, {"%.1f"}, 760, 395.5)
Add_System_Status_Text(Engine4_GEN_TR_LOAD_LOW, "Engine4_GEN_TR_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "Engine4_GEN_TR_LOAD", -0.1, 0.1, {"%.0f"}, 740, 395.5)
Add_System_Status_Text(Engine4_DC_BUS_V, "Engine4_DC_BUS_V", "font_Arial_white", "RightCenter", System_origin, "Engine4_DC_BUS_V", 25, 28.5, {"%.0f"}, 758, 443.5)
Add_System_Status_Text(Engine4_DC_BUS_V_LOW, "Engine4_DC_BUS_V_LOW", "font_Arial_red", "RightCenter", System_origin, "Engine4_DC_BUS_V", -0.5, 25, {"%.0f"}, 740, 443.5)
------------------------------------------------------------------------------------------------------------APU_GEN data
Add_System_Status_Text(APU_GEN_Off, "APU_GEN_Off", "font_Arial_white", "RightCenter", System_origin, "APU_GEN", -0.5, 0.5, {"off"}, 878, 188.5)--pixel pos on image
Add_System_Status_Text(APU_GEN_A, "APU_GEN_A", "font_Arial_white", "RightCenter", System_origin, "APU_GEN", 0.5, 120.5, {"%.0f"}, 878, 188.5)--pixel pos on image
Add_System_Status_Text(APU_GEN_B, "APU_GEN_B", "font_Arial_white", "RightCenter", System_origin, "APU_GEN", 0.5, 120.5, {"%.0f"}, 878, 229.5)
Add_System_Status_Text(APU_GEN_C, "APU_GEN_C", "font_Arial_white", "RightCenter", System_origin, "APU_GEN", 0.5, 120.5, {"%.0f"}, 878, 273.5)
Add_System_Status_Text(APU_GEN_LOAD, "APU_GEN_LOAD", "font_Arial_white", "RightCenter", System_origin, "APU_GEN_LOAD", 0.1, 10.5, {"%.1f"}, 880, 321.5)
Add_System_Status_Text(APU_GEN_LOAD_LOW, "APU_GEN_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "APU_GEN_LOAD", -0.1, 0.1, {"%.0f"}, 860, 321.5)
Add_System_Status_Text(APU_GEN_TR_LOAD, "APU_GEN_TR_LOAD", "font_Arial_white", "RightCenter", System_origin, "APU_GEN_TR_LOAD", 0.1, 10.5, {"%.1f"}, 880, 395.5)
Add_System_Status_Text(APU_GEN_TR_LOAD_LOW, "APU_GEN_TR_LOAD_LOW", "font_Arial_white", "RightCenter", System_origin, "APU_GEN_TR_LOAD", -0.1, 0.1, {"%.0f"}, 860, 395.5)
Add_System_Status_Text(APU_DC_BUS_V, "APU_DC_BUS_V", "font_Arial_white", "RightCenter", System_origin, "APU_DC_BUS_V", 25, 28.5, {"%.0f"}, 878, 443.5)
------------------------------------------------------------------------------------------------------------HYD_PRESS data
Add_System_Status_Text(HYD_PRESS_SYSTEM_UTILITY, "HYD_PRESS_SYSTEM_UTILITY", "font_Arial_white", "CenterCenter", System_origin, "UTILITY_HYD_PRESS", 2240, 3002, {"%.0f"}, 406.5, 603.5)
Add_System_Status_Text(HYD_PRESS_SYSTEM_UTILITY_LOW, "HYD_PRESS_SYSTEM_UTILITY_LOW", "font_Arial_red", "CenterCenter", System_origin, "UTILITY_HYD_PRESS", -0.5, 2240, {"%.0f"}, 406.5, 603.5)
Add_System_Status_Text(HYD_PRESS_SYSTEM_BOOST, "HYD_PRESS_SYSTEM_BOOST", "font_Arial_white", "CenterCenter", System_origin, "BOOSTER_HYD_PRESS", 2240, 3002, {"%.0f"}, 643.5, 603.5)
Add_System_Status_Text(HYD_PRESS_SYSTEM_BOOST_LOW, "HYD_PRESS_SYSTEM_BOOST_LOW", "font_Arial_red", "CenterCenter", System_origin, "BOOSTER_HYD_PRESS", -0.5, 2240, {"%.0f"}, 643.5, 603.5)
Add_System_Status_Text(HYD_PRESS_SYSTEM_AUX, "HYD_PRESS_SYSTEM_AUX", "font_Arial_white", "CenterCenter", System_origin, "AUX_HYD_PRESS", 2240, 3002, {"%.0f"}, 854.9, 603.5)
Add_System_Status_Text(HYD_PRESS_SYSTEM_AUX_LOW, "HYD_PRESS_SYSTEM_AUX_LOW", "font_Arial_red", "CenterCenter", System_origin, "AUX_HYD_PRESS", -0.5, 2240, {"%.0f"}, 854.9, 603.5)
Add_System_Status_Text(HYD_PRESS_RUDDER_BOOST_UTILITY, "HYD_PRESS_RUDDER_BOOST_UTILITY", "font_Arial_white", "CenterCenter", System_origin, "UTILITY_HYD_PRESS", 2240, 3002, {"%.0f"}, 406.5, 650.5)
Add_System_Status_Text(HYD_PRESS_RUDDER_BOOST_UTILITY_LOW, "HYD_PRESS_RUDDER_BOOST_UTILITY_LOW", "font_Arial_red", "CenterCenter", System_origin, "UTILITY_HYD_PRESS", -0.5, 2240, {"%.0f"}, 406.5, 650.5)
Add_System_Status_Text(HYD_PRESS_RUDDER_BOOST_BOOST, "HYD_PRESS_RUDDER_BOOST_BOOST", "font_Arial_white", "CenterCenter", System_origin, "BOOSTER_HYD_PRESS", 2240, 3002, {"%.0f"}, 643.5, 650.5)
Add_System_Status_Text(HYD_PRESS_RUDDER_BOOST_BOOST_LOW, "HYD_PRESS_RUDDER_BOOST_BOOST_LOW", "font_Arial_red", "CenterCenter", System_origin, "BOOSTER_HYD_PRESS", -0.5, 2240, {"%.0f"}, 643.5, 650.5)
Add_System_Status_Text(HYD_PRESS_BRAKES_NORMAL, "HYD_PRESS_BRAKES_NORMAL", "font_Arial_white", "CenterCenter", System_origin, "UTILITY_HYD_PRESS", 2240, 3002, {"%.0f"}, 406.5, 741.5)
Add_System_Status_Text(HYD_PRESS_BRAKES_NORMAL_LOW, "HYD_PRESS_BRAKES_NORMAL_LOW", "font_Arial_red", "CenterCenter", System_origin, "UTILITY_HYD_PRESS", -0.5, 2240, {"%.0f"}, 406.5, 741.5)
Add_System_Status_Text(HYD_PRESS_BRAKES_EMERG, "HYD_PRESS_BRAKES_EMERG", "font_Arial_white", "CenterCenter", System_origin, "AUX_HYD_PRESS", 2240, 3002, {"%.0f"}, 854.9, 741.5)
Add_System_Status_Text(HYD_PRESS_BRAKES_EMERG_LOW, "HYD_PRESS_BRAKES_EMERG_LOW", "font_Arial_red", "CenterCenter", System_origin, "AUX_HYD_PRESS", -0.5, 2240, {"%.0f"}, 854.9, 741.5)
------------------------------------------------------------------------------------------------------------OIL_CPF_PER data
Add_System_Status_Text(Engine1_OIL_CPF_PER, "Engine1_OIL_CPF_PER", "font_Arial_white", "RightCenter", System_origin, "", -0.5, 100, "80", 215.5, 911.5)
Add_System_Status_Text(Engine2_OIL_CPF_PER, "Engine2_OIL_CPF_PER", "font_Arial_white", "RightCenter", System_origin, "", -0.5, 100, "80", 427.5, 911.5)
Add_System_Status_Text(Engine3_OIL_CPF_PER, "Engine3_OIL_CPF_PER", "font_Arial_white", "RightCenter", System_origin, "", -0.5, 100, "80", 629.5, 911.5)
Add_System_Status_Text(Engine4_OIL_CPF_PER, "Engine4_OIL_CPF_PER", "font_Arial_white", "RightCenter", System_origin, "", -0.5, 100, "80", 825.5, 911.5)
------------------------------------------------------------------------------------------------------------FUEL_QUANTITY data
Add_System_Status_Text(TANK1_FUEL_W, "TANK1_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "TANK1_FUEL_W", 798.35, 10000, {"%.0f"}, 95.5, 1083.5)
Add_System_Status_Text(TANK1_FUEL_W_LOW, "TANK1_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "TANK1_FUEL_W", -0.5, 798.35, {"%.0f"}, 95.5, 1083.5)
Add_System_Status_Text(TANK2_FUEL_W, "TANK2_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "TANK2_FUEL_W", 798.35, 10000, {"%.0f"}, 279.5, 1083.5)
Add_System_Status_Text(TANK2_FUEL_W_LOW, "TANK2_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "TANK2_FUEL_W", -0.5, 798.35, {"%.0f"}, 279.5, 1083.5)
Add_System_Status_Text(TANK3_FUEL_W, "TANK3_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "TANK3_FUEL_W", 798.35, 10000, {"%.0f"}, 467.5, 1083.5)
Add_System_Status_Text(TANK3_FUEL_W_LOW, "TANK3_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "TANK3_FUEL_W", -0.5, 798.35, {"%.0f"}, 467.5, 1083.5)
Add_System_Status_Text(TANK4_FUEL_W, "TANK4_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "TANK4_FUEL_W", 798.35, 10000, {"%.0f"}, 655.5, 1083.5)
Add_System_Status_Text(TANK4_FUEL_W_LOW, "TANK4_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "TANK4_FUEL_W", -0.5, 798.35, {"%.0f"}, 655.5, 1083.5)
Add_System_Status_Text(TOTAL_FUEL_W, "TOTAL_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "FUEL_WEIGHT", 4345, 43570, {"%.0f"}, 869.5, 1083.5)
Add_System_Status_Text(TOTAL_FUEL_W_LOW, "TOTAL_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "FUEL_WEIGHT", -0.5, 10000, {"%.0f"}, 869.5, 1083.5)
Add_System_Status_Text(L_EXT_FUEL_W, "L_EXT_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "L_EXT_FUEL_W", 890.1, 10000, {"%.0f"}, 98.5, 1181.5)
Add_System_Status_Text(L_EXT_FUEL_W_LOW, "L_EXT_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "L_EXT_FUEL_W", -0.5, 890.1, {"%.0f"}, 98.5, 1181.5)
Add_System_Status_Text(L_AUX_FUEL_W, "L_AUX_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "L_AUX_FUEL_W", 581.4, 10000, {"%.0f"}, 279.5, 1181.5)
Add_System_Status_Text(L_AUX_FUEL_W_LOW, "L_AUX_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "L_AUX_FUEL_W", -0.5, 581.4, {"%.0f"}, 279.5, 1181.5)
Add_System_Status_Text(R_AUX_FUEL_W, "R_AUX_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "R_AUX_FUEL_W", 581.4, 10000, {"%.0f"}, 467.5, 1181.5)
Add_System_Status_Text(R_AUX_FUEL_W_LOW, "R_AUX_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "R_AUX_FUEL_W", -0.5, 581.4, {"%.0f"}, 467.5, 1181.5)
Add_System_Status_Text(R_EXT_FUEL_W, "R_EXT_FUEL_W", "font_Arial_white", "CenterCenter", System_origin, "R_EXT_FUEL_W", 890.1, 10000, {"%.0f"}, 655.5, 1181.5)
Add_System_Status_Text(R_EXT_FUEL_W_LOW, "R_EXT_FUEL_W_LOW", "font_Arial_red", "CenterCenter", System_origin, "R_EXT_FUEL_W", -0.5, 890.1, {"%.0f"}, 655.5, 1181.5)
Add_System_Status_Text(TOTAL_FUEL_PER, "TOTAL_FUEL_PER", "font_Arial_white", "CenterCenter", System_origin, "FUEL_PERCENT", 10, 100.5, {"%.0f"}, 869.5, 1181.5)
Add_System_Status_Text(TOTAL_FUEL_PER_LOW, "TOTAL_FUEL_PER_LOW", "font_Arial_red", "CenterCenter", System_origin, "FUEL_PERCENT", -0.5, 10, {"%.0f"}, 869.5, 1181.5)
------------------------------------------------------------------------------------------------------------LOX data
Add_System_Status_Text(LOX_PER, "LOX_PER", "font_Arial_white", "RightCenter", System_origin, "", -0.5, 100, "90", 291.5, 1286.5)


