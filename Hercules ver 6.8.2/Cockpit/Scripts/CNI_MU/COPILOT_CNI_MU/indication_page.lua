

dofile(LockOn_Options.script_path.."CNI_MU/Display_definitions.lua")

-------------------------------------------------------------------------------COPILOT_CNI_MU_POWERUP

local POWERUP_origin	         = CreateElement "ceSimple"
POWERUP_origin.name 		     = "POWERUP_origin"
POWERUP_origin.init_pos        = {0,0}
POWERUP_origin.element_params   = {
								"COPILOT_CNI_MU_Powerup",
								"COPILOT_Network_Sync",
										   }
POWERUP_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
POWERUP_origin.collimated 		 = true
AddElement(POWERUP_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"POWER UP"},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Left column
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" NAV DB Hercules SP SW"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" DCS WORLD 678634-345"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					84,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" 08JAN18FEB21"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" 05JAN18MAR21"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					136,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" ALIGN POS"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					188,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" S38 28.36"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" E144 24.37"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					240,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" FOM 1"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" GPS/LAST/REF"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					292,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" DATA XFR"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Right column
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"DATE "},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					565,--initpixelposx
					84,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"26FEB21 "},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					565,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"TIME "},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					565,--initpixelposx
					136,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"2259:162 "},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					565,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"MSTR AV ON "},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"AUTONAV "},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					565,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(POWERUP, "POWERUP", POWERUP_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"ROUTE 1 "},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					565,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)

-------------------------------------------------------------------------------COPILOT_CNI_MU_Index

local TOLD_INDEX_origin	         = CreateElement "ceSimple"
TOLD_INDEX_origin.name 		     = "TOLD_INDEX_origin"
TOLD_INDEX_origin.init_pos        = {0,0}
TOLD_INDEX_origin.element_params   = {
								"COPILOT_CNI_MU_Index",
								"COPILOT_Network_Sync",
										   }
TOLD_INDEX_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
TOLD_INDEX_origin.collimated 		 = true
AddElement(TOLD_INDEX_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"TOLD INDEX"},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Left column
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<TOLD INIT"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<T/O DATA"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<LDG DATA"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" DRAG INDEX"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"  44"},--format_value
					{0.006,0.006,  -0.0032, 0},--stringdefs_value
					10,--initpixelposx
					292,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Right column
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"------/--- "},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"------/--- "},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"------/--- "},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"------/--- "},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"------/--- "},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TOLD_INDEX, "TOLD_INDEX", TOLD_INDEX_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"------/--- "},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)

-------------------------------------------------------------------------------COPILOT_CNI_MU_Told_INIT

local Told_INIT_origin	         = CreateElement "ceSimple"
Told_INIT_origin.name 		     = "Told_INIT_origin"
Told_INIT_origin.init_pos        = {0,0}
Told_INIT_origin.element_params   = {
								"COPILOT_CNI_MU_Told_INIT",
								"COPILOT_Network_Sync",
										   }
Told_INIT_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
Told_INIT_origin.collimated 		 = true
AddElement(Told_INIT_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"TOLD INIT"},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Left column
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Aircraft Weight"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Take-off Rwy Conditions"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Landing Rwy Conditions"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
----------------------------------------------------------Local sunrise
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Local sunrise:"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					350,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Sunrise_Hr",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{": "},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					390,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					410,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Sunrise_Min",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
----------------------------------------------------------Local sunset
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"       sunset:"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					350,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_SunSet_Hr",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{": "},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					390,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Told_INIT, "Told_INIT", Told_INIT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					410,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_SunSet_Min",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)

--------------------------------------------------------------------------------------------------------COPILOT_CNI_MU_NAV_CTRL

local NAV_CTRL_origin	         = CreateElement "ceSimple"
NAV_CTRL_origin.name 		     = "NAV_CTRL_origin"
NAV_CTRL_origin.init_pos        = {0,0}
NAV_CTRL_origin.element_params   = {
								"COPILOT_CNI_MU_NAV_CTRL",
								"COPILOT_Network_Sync",
										   }
NAV_CTRL_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
NAV_CTRL_origin.collimated 		 = true
AddElement(NAV_CTRL_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(NAV_CTRL, "NAV_CTRL", NAV_CTRL_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"NAV CONTROL"},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Wpt_nr
Add_Object_Text(Wpt_nr, "Wpt_nr", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"< Wpt Nr:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_nr, "Wpt_nr", NAV_CTRL_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					200,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"WPT_ACTIVE_IDX",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_nr, "Wpt_nr", NAV_CTRL_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.012,  0, 0},--stringdefs_value
					195,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Wpt_Name
Add_Object_Text(Wpt_Name, "Wpt_Name", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_Name, "Wpt_Name", NAV_CTRL_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%s"},--format_value
					{0.007,0.009,  -0.0040, 0},--stringdefs_value
					40,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wpt_Name",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_nr, "Wpt_nr", NAV_CTRL_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{"    "},--format_value
					{0.007,0.012,  0, 0},--stringdefs_value
					40,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Wpt_nr_Inc
Add_Object_Text(Wpt_nr_Inc, "Wpt_nr_Inc", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Inc +"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					450,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_nr_Inc, "Wpt_nr_Inc", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{" >"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Wpt_nr_Dec
Add_Object_Text(Wpt_nr_Dec, "Wpt_nr_Dec", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Dec -"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					450,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_nr_Dec, "Wpt_nr_Dec", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{" >"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Wpt_Horz_Dist
Add_Object_Text(Wpt_Horz_Dist, "Wpt_Horz_Dist", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Dist:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_Horz_Dist, "Wpt_Horz_Dist", NAV_CTRL_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.1f "},--format_value
					{0.007,0.009,  -0.0040, 0},--stringdefs_value
					110,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wpt_Horz_Dist",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------ Wpt_Bearing
Add_Object_Text(Wpt_Bearing, "Wpt_Bearing", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Bear:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_Bearing, "Wpt_Bearing", NAV_CTRL_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.1f "},--format_value
					{0.007,0.009,  -0.0040, 0},--stringdefs_value
					110,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wpt_Bearing",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Wpt_Lat_dmm
Add_Object_Text(Wpt_Lat_dmm, "Wpt_Lat_dmm", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_Lat_dmm, "Wpt_Lat_dmm", NAV_CTRL_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%s"},--format_value
					{0.007,0.009,  -0.0040, 0},--stringdefs_value
					40,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wpt_Lat_dmm",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_Lat_dmm, "Wpt_Lat_dmm", NAV_CTRL_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{"       "},--format_value
					{0.007,0.0086,  0, 0},--stringdefs_value
					40,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Wpt_Lon_dmm
Add_Object_Text(Wpt_Lon_dmm, "Wpt_Lon_dmm", NAV_CTRL_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_Lon_dmm, "Wpt_Lon_dmm", NAV_CTRL_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%s"},--format_value
					{0.007,0.009,  -0.0040, 0},--stringdefs_value
					40,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wpt_Lon_dmm",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(Wpt_Lon_dmm, "Wpt_Lon_dmm", NAV_CTRL_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{"        "},--format_value
					{0.007,0.0082,  0, 0},--stringdefs_value
					40,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------------------------------COPILOT_CNI_MU_CommTune

local CommTune_origin	         = CreateElement "ceSimple"
CommTune_origin.name 		     = "CommTune_origin"
CommTune_origin.init_pos        = {0,0}
CommTune_origin.element_params   = {
								"COPILOT_CNI_MU_CommTune",
								"COPILOT_Network_Sync",
										   }
CommTune_origin.controllers 	   = {
								{"parameter_in_range",0,0.9,1.1},
								{"parameter_in_range",1,-0.1,0.1},
								}
CommTune_origin.collimated 		 = true
AddElement(CommTune_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"COMM TUNE INDEX"},--format_value
					{0.0065,0.0065,  0.001, 0},--stringdefs_value
					300,--initpixelposx
					12,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"IDENT"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					130,--initpixelposx
					36,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"CH"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					330,--initpixelposx
					36,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"FREQ"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					440,--initpixelposx
					36,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------------------------- U1
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_amber",--objectmaterial
					"LeftCenter",--objectalignment
					{"<U1"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- U1 IDENT
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_amber",--objectmaterial
					"LeftCenter",--objectalignment
					{"ICAO"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					130,--initpixelposx
					60,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"BRABC"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					130,--initpixelposx
					82,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- U1 CH
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_amber",--objectmaterial
					"LeftCenter",--objectalignment
					{"R%.0f"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					330,--initpixelposx
					60,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"UHF1_ARC_164_Radio_Chan",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"R15"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					330,--initpixelposx
					82,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- U1 FREQ
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_amber",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.3f"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					440,--initpixelposx
					60,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"UHF1_ARC_164_Radio_Freq",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"264.575"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					440,--initpixelposx
					82,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------------------------- U2
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<U2"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- U2 IDENT
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"GUARD"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					127,--initpixelposx
					114,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Hokey"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					130,--initpixelposx
					134,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- U2 CH
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{""},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					330,--initpixelposx
					60 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"R12"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					330,--initpixelposx
					82 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- U2 FREQ
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"243.000"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					440,--initpixelposx
					60 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"250.850"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					440,--initpixelposx
					82 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------------------------- V1
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<V1"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- V1 IDENT
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"------"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					127,--initpixelposx
					167,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{""},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					130,--initpixelposx
					167 + 20,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- V1 CH
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{""},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					330,--initpixelposx
					60 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{""},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					330,--initpixelposx
					82 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- V1 FREQ
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"122.900"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					440,--initpixelposx
					60 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{""},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					440,--initpixelposx
					82 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------------------------- V2
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<V2"},--format_value
					{0.007,0.007,  -0.0030, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- V2 IDENT
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"AMGRD"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					127,--initpixelposx
					219,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"BERRY"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					130,--initpixelposx
					219 + 20,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- V2 CH
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"R15"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					330,--initpixelposx
					60 + 50 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"R08"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					330,--initpixelposx
					82 + 50 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
------------------------------------------------------------------------------- V2 FREQ
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"399.900"},--format_value
					{0.005,0.005,  -0.0020, 0},--stringdefs_value
					440,--initpixelposx
					60 + 50 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(CommTune, "CommTune", CommTune_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"225.000"},--format_value
					{0.004,0.004,  -0.0015, 0},--stringdefs_value
					440,--initpixelposx
					82 + 50 + 50 + 50,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-----------------------------------------------------------------------------------------------------------------------AC_WEIGHT

local AC_WEIGHT_origin	         = CreateElement "ceSimple"
AC_WEIGHT_origin.name 		     = "AC_WEIGHT_origin"
AC_WEIGHT_origin.init_pos        = {0,0}
AC_WEIGHT_origin.element_params   = {
								"COPILOT_CNI_MU_Aircraft_Weight",
								"COPILOT_Network_Sync",
										   }
AC_WEIGHT_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
AC_WEIGHT_origin.collimated 		 = true
AddElement(AC_WEIGHT_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"AIRCRAFT WGT EXT DATA"},--format_value
					{0.008,0.008,  0.0007, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Bold_Arial_cyan",--objectmaterial
					"CenterCenter",--objectalignment
					{"AIRCRAFT WGT CALC DATA"},--format_value
					{0.008,0.008,  0.0007, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.1,0.1},
						{"text_using_parameter",2,0},
					}
				)
-------------------------------------------------------------------------------- FuellingPersentage
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Fuel persentage:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f ?  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					450,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_FuellingPersentage",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.020,  0, 0},--stringdefs_value
					440,--initpixelposx
					58,--initpixelposy
					{--params
						"COCOPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Fuel weight
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Fuel weight:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0flbs  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					435,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_FuelWeight_lb",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Cargo_Weight
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Cargo weight:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0flbs  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					440,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_CargoWeight_lb",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{"  "},--format_value
					{0.007,0.0165,  0, 0},--stringdefs_value
					442,--initpixelposx
					162,--initpixelposy
					{--params
						"COCOPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Grossweight
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Gross weight:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0flbs  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					455,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_GrossWeight_lb",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 164000},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_amber",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0flbs  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					455,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_GrossWeight_lb",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 164000, 175000},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_red",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0flbs  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					455,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_GrossWeight_lb",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 175000, 1750000},
						{"text_using_parameter",1,0},
					}
				)

--------------------------------------------------------------------------------Critical Field Length
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Crit field length:"},--format_value
					{0.007,0.007,  -0.0042, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					335,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_CFL_too_short",
						"COPILOT_CNI_MU_CFL_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.5},
						{"text_using_parameter",2,0},
					}
				)

Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_red",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					335,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_CFL_too_short",
						"COPILOT_CNI_MU_CFL_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)

--------------------------------------------------------------------------------Take-off distance
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Take-off dist:"},--format_value
					{0.007,0.007,  -0.0042, 0},--stringdefs_value
					10,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					270,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_TOD_too_short",
						"COPILOT_CNI_MU_TOD_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.5},
						{"text_using_parameter",2,0},
					}
				)

Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_red",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					270,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_TOD_too_short",
						"COPILOT_CNI_MU_TOD_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
-------------------------------------------------------------------------------- Ext Data Recall
Add_Object_Text(AC_WEIGHT, "AC_WEIGHT", AC_WEIGHT_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Ext Data>"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------------------------------TO_RWY_COND

local TO_RWY_COND_origin	         = CreateElement "ceSimple"
TO_RWY_COND_origin.name 		     = "TO_RWY_COND_origin"
TO_RWY_COND_origin.init_pos        = {0,0}
TO_RWY_COND_origin.element_params   = {
								"COPILOT_CNI_MU_TO_Rwy_Conditions",
								"COPILOT_Network_Sync",
										   }
TO_RWY_COND_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
TO_RWY_COND_origin.collimated 		 = true
AddElement(TO_RWY_COND_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"TO RWY COND EXT DATA"},--format_value
					{0.008,0.008,  0.0007, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Bold_Arial_cyan",--objectmaterial
					"CenterCenter",--objectalignment
					{"TO RWY COND CALC DATA"},--format_value
					{0.008,0.008,  0.0007, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.1,0.1},
						{"text_using_parameter",2,0},
					}
				)
-------------------------------------------------------------------------------- Length
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Rwy Length:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					230,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Runway_Length_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.022,  0, 0},--stringdefs_value
					235,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Flap extension
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Flaps"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					354,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f ?  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_TO_FlapSetting",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.019,  0, 0},--stringdefs_value
					556,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{" >"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- RWY ELEV
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Rwy Elev:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					190,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Runway_Elev_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.025,  0, 0},--stringdefs_value
					195,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Anti_skid
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{">"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					565,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"on"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					547,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_AntiSkid_switch_Off",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"off"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					547,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_AntiSkid_switch_Off",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.010,  0, 0},--stringdefs_value
					560,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Anti-skid"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					485,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- RWY HDG
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Rwy hdg:"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f$"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					210,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Runway_Hdg",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.015,  0, 0},--stringdefs_value
					210,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- RWY OAT
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{">"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					565,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.1f$C  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					578,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_OAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.023,  0, 0},--stringdefs_value
					561,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"oat:"},--format_value
					{0.007,0.007,  -0.0042, 0},--stringdefs_value
					415,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Surface Wind
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Wind hdg:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f$"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					186,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wind_hdg",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.015,  0, 0},--stringdefs_value
					193,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{">"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f kt "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					555,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wind_spd",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.018,  0, 0},--stringdefs_value
					555,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Wind spd:"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					455,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)

--------------------------------------------------------------------------------Critical Field Length
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Crit Field Length:"},--format_value
					{0.007,0.007,  -0.0042, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					332,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_CFL_too_short",
						"COPILOT_CNI_MU_CFL_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.5},
						{"text_using_parameter",2,0},
					}
				)

Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_red",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					332,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_CFL_too_short",
						"COPILOT_CNI_MU_CFL_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)

--------------------------------------------------------------------------------Take-off distance
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Take-off Dist:"},--format_value
					{0.007,0.007,  -0.0042, 0},--stringdefs_value
					10,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					272,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_TOD_too_short",
						"COPILOT_CNI_MU_TOD_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.5},
						{"text_using_parameter",2,0},
					}
				)

Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_red",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					272,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_TOD_too_short",
						"COPILOT_CNI_MU_TOD_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)

----------------------------------------------------------------------------------------------------Ext Data
Add_Object_Text(TO_RWY_COND, "TO_RWY_COND", TO_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Ext Data>"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)

-----------------------------------------------------------------------------------------------------------------------LND_RWY_COND

local LND_RWY_COND_origin	         = CreateElement "ceSimple"
LND_RWY_COND_origin.name 		     = "LND_RWY_COND_origin"
LND_RWY_COND_origin.init_pos        = {0,0}
LND_RWY_COND_origin.element_params   = {
								"COPILOT_CNI_MU_LND_Rwy_Conditions",
								"COPILOT_Network_Sync",
										   }
LND_RWY_COND_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
LND_RWY_COND_origin.collimated 		 = true
AddElement(LND_RWY_COND_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"LND RWY COND EXT DATA"},--format_value
					{0.008,0.008,  0.0007, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Bold_Arial_cyan",--objectmaterial
					"CenterCenter",--objectalignment
					{"LND RWY COND CALC DATA"},--format_value
					{0.008,0.008,  0.0007, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.1,0.1},
						{"text_using_parameter",2,0},
					}
				)
-------------------------------------------------------------------------------- Length
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Rwy Length:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					222,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Runway_Length_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.022,  0, 0},--stringdefs_value
					227,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Flap extension
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"Flaps"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					354,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f ?  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_LAND_FlapSetting",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.019,  0, 0},--stringdefs_value
					556,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{" >"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- RWY ELEV
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Rwy Elev:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					190,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Runway_Elev_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.025,  0, 0},--stringdefs_value
					195,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Anti_skid
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{">"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					565,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"on"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					547,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_AntiSkid_switch_Off",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"off"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					547,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_AntiSkid_switch_Off",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.010,  0, 0},--stringdefs_value
					560,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Anti-skid"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					492,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- RWY HDG
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Rwy hdg:"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f$"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					210,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Runway_Hdg",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.015,  0, 0},--stringdefs_value
					210,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- RWY OAT
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{">"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					565,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.1f$C  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					578,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_OAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.023,  0, 0},--stringdefs_value
					561,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"oat:"},--format_value
					{0.007,0.007,  -0.0042, 0},--stringdefs_value
					435,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- Surface Wind
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Wind hdg:"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f$"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					186,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wind_hdg",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.015,  0, 0},--stringdefs_value
					193,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{">"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f kt "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					555,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Wind_spd",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.018,  0, 0},--stringdefs_value
					555,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Wind spd:"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					455,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Landing Ground Roll
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Landing Ground Roll:"},--format_value
					{0.007,0.007,  -0.0042, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					360,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_LGR_too_short",
						"COPILOT_CNI_MU_LGR_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.5},
						{"text_using_parameter",2,0},
					}
				)

Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_red",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0fft "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					360,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_LGR_too_short",
						"COPILOT_CNI_MU_LGR_ft",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)

-------------------------------------------------------------------------------- Beta_Reverse
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"<Beta Reverse:"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"on"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					312,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Beta_Reverse_Off",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.5, 0.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"off"},--format_value
					{0.007,0.007,  -0.0044, 0},--stringdefs_value
					312,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Beta_Reverse_Off",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green_background",--objectmaterial
					"LeftCenter",--objectalignment
					{" "},--format_value
					{0.007,0.013,  0, 0},--stringdefs_value
					310,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
----------------------------------------------------------------------------------------------------Ext Data
Add_Object_Text(LND_RWY_COND, "LND_RWY_COND", LND_RWY_COND_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Ext Data>"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-----------------------------------------------------------------------------------------------------------------------T_O_DATA

local TO_DATA_origin	         = CreateElement "ceSimple"
TO_DATA_origin.name 		     = "TO_DATA_origin"
TO_DATA_origin.init_pos        = {0,0}
TO_DATA_origin.element_params   = {
								"COPILOT_CNI_MU_Take_Off_Data",
								"COPILOT_Network_Sync",
										   }
TO_DATA_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
TO_DATA_origin.collimated 		 = true
AddElement(TO_DATA_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"TAKE-OFF EXT DATA"},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Bold_Arial_cyan",--objectmaterial
					"CenterCenter",--objectalignment
					{""},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.1,0.1},
						{"text_using_parameter",2,0},
					}
				)
--------------------------------------------------------------------------------V1 (refusal)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" V1 (refusal)"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_V1speed",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Vr (rotate)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Vr (rotate)"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_VrSpeed",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------V2 (climb)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" V2 (climb)"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_V2speed",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Flap extension
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Flap extension"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f ?  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_TO_FlapSetting",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.025,  0, 0},--stringdefs_value
					556,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{" >"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Wind component knts
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" X wind component"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Cross_Wc",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Recall Ext Data
Add_Object_Text(TO_DATA, "TO_DATA", TO_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Ext Data>"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------------------------------------------LND_DATA

local LND_DATA_origin	         = CreateElement "ceSimple"
LND_DATA_origin.name 		     = "LND_DATA_origin"
LND_DATA_origin.init_pos        = {0,0}
LND_DATA_origin.element_params   = {
								"COPILOT_CNI_MU_Landing_Data",
								"COPILOT_Network_Sync",
										   }
LND_DATA_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								{"parameter_in_range",1,-0.1,0.1},
								}
LND_DATA_origin.collimated 		 = true
AddElement(LND_DATA_origin)

-------------------------------------------------------------------------------- Header
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Bold_Arial_green",--objectmaterial
					"CenterCenter",--objectalignment
					{"LANDING EXT DATA"},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, 0.9, 1.1},
						{"text_using_parameter",2,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Bold_Arial_cyan",--objectmaterial
					"CenterCenter",--objectalignment
					{"LANDING CALC DATA"},--format_value
					{0.008,0.008,  0.0010, 0},--stringdefs_value
					300,--initpixelposx
					16,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Ext_Data_Used",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1, -0.1,0.1},
						{"text_using_parameter",2,0},
					}
				)
-------------------------------------------------------------------------------- V Approach
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Approach speed"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					58,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_APPspeed",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- V Threshold
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Threshold speed"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					110,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_THRESspeed",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------- V Touchdown
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Touchdown speed"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					162,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_LNDspeed",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Flap extension
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" Flap extension"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f ?  "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_LAND_FlapSetting",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green_background",--objectmaterial
					"RightCenter",--objectalignment
					{" "},--format_value
					{0.007,0.025,  0, 0},--stringdefs_value
					556,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{" >"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					214,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
--------------------------------------------------------------------------------Wind component knts
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{" X wind component"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					10,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_white",--objectmaterial
					"RightCenter",--objectalignment
					{"%.0f knots "},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					266,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_Cross_Wc",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)

--------------------------------------------------------------------------------Recall Ext Data
Add_Object_Text(LND_DATA, "LND_DATA", LND_DATA_origin.name,
					"font_Arial_green",--objectmaterial
					"RightCenter",--objectalignment
					{"Ext Data>"},--format_value
					{0.007,0.007,  -0.0040, 0},--stringdefs_value
					565,--initpixelposx
					318,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)
-------------------------------------------------------------------------------COPILOT_CNI_MU_KBD

local KBD_origin	         = CreateElement "ceSimple"
KBD_origin.name 		     = "KBD_origin"
KBD_origin.init_pos        = {0,0}
KBD_origin.collimated 		 = true
AddElement(KBD_origin)

Add_Object_Text(KBD, "KBD", KBD_origin.name,
					"font_Arial_white",--objectmaterial
					"LeftCenter",--objectalignment
					{"%s"},--format_value
					{0.007,0.007,  -0.0034, 0},--stringdefs_value
					10,--initpixelposx
					370,--initpixelposy
					{--params
						"COPILOT_CNI_MU_brightness",
						"COPILOT_CNI_MU_KBD_charval",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					}
				)



