

dofile(LockOn_Options.script_path.."HUD/PILOT_HUD/definitions.lua")
-- dofile(LockOn_Options.script_path.."symbols.lua")

-- alignment options:
--"RightBottom"
--"LeftTop"
--"RightTop"
--"LeftCenter"
--"RightCenter"
--"CenterBottom"
--"CenterTop"
--"CenterCenter"
--"LeftBottom"
-------MATERIALS-------
-- materials = {}
-- materials["WHITE"]  = {255, 255, 255, 255}
-- materials["GREEN"]   = {0, 255, 0, 255}
-- materials["YELLOW"]   = {243, 116, 13, 255}
-- materials["RED"]    = {255, 0, 0, 255}
-- materials["BLACK"]    = {0, 0, 0, 255}
-- materials["AMBER"]    = {255, 194, 0, 255}

-- local aspect       = GetAspect() -- GetHalfHeight()/GetHalfWidth()
-- local width  	   = 1.0
-- local height 	   = width * GetAspect()
-- local initpixelposx
-- local initpixelposy
-- local imagepixelsizex
-- local imagepixelsizey

--------------------------------------------------------------------------------------------------------------------------------------------HUD

local HUD_origin	         = CreateElement "ceSimple"
HUD_origin.name 		     = "HUD_origin"
HUD_origin.collimated = true
HUD_origin.init_pos        = {0, 0, 0}
Add(HUD_origin)

----------------------------------------------------------------------------------------------------------------HUD_Airspeed_carets
Add_Origin(HUD_V1AirspeedCaret_origin, "HUD_V1AirspeedCaret_origin", "HUD_origin",
					33.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudV1AirspeedCaret",
						"PILOT_HudV1AirspeedCaretOn",
						"PILOT_CNI_MU_Take_Off_Data",
					},
					{--controllers
						{"rotate_using_parameter",0, 1.0 },
						{"parameter_in_range",1,0.9,1.5},
						{"parameter_in_range",2,0.9,1.5},
					}
				)

Add_Image(HUD_V1AirspeedCaretImg, "HUD_V1AirspeedCaretImg", "HUD_V1AirspeedCaret_origin",
					"AirspeedAltitude_caret",
					167.0,--imagepixelsizex
					167.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)
Add_Image(HUD_V1AirspeedCaretSym, "HUD_V1AirspeedCaretSym", "HUD_V1AirspeedCaret_origin",
					"V1",
					30.0,--imagepixelsizex
					30.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512 - 100,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
						"PILOT_HudV1AirspeedCaret",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, -1.0 },
					}
				)

Add_Origin(HUD_VrAirspeedCaret_origin, "HUD_VrAirspeedCaret_origin", "HUD_origin",
					33.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudVrAirspeedCaret",
						"PILOT_HudVrAirspeedCaretOn",
						"PILOT_CNI_MU_Take_Off_Data",
					},
					{--controllers
						{"rotate_using_parameter",0, 1.0 },
						{"parameter_in_range",1,0.9,1.5},
						{"parameter_in_range",2,0.9,1.5},
					}
				)

Add_Image(HUD_VrAirspeedCaretImg, "HUD_VrAirspeedCaretImg", "HUD_VrAirspeedCaret_origin",
					"AirspeedAltitude_caret",
					167.0,--imagepixelsizex
					167.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Image(HUD_VrAirspeedCaretSym, "HUD_VrAirspeedCaretSym", "HUD_VrAirspeedCaret_origin",
					"Vr",
					30.0,--imagepixelsizex
					30.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512 - 100,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
						"PILOT_HudVrAirspeedCaret",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, -1.0 },
					}
				)

Add_Origin(HUD_APPAirspeedCaret_origin, "HUD_APPAirspeedCaret_origin", "HUD_origin",
					33.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudAPPAirspeedCaret",
						"PILOT_HudAPPAirspeedCaretOn",
						"PILOT_CNI_MU_Landing_Data",
					},
					{--controllers
						{"rotate_using_parameter",0, 1.0 },
						{"parameter_in_range",1,0.9,1.5},
						{"parameter_in_range",2,0.9,1.5},
					}
				)

Add_Image(HUD_APPAirspeedCaretImg, "HUD_APPAirspeedCaretImg", "HUD_APPAirspeedCaret_origin",
					"AirspeedAltitude_caret",
					167.0,--imagepixelsizex
					167.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Image(HUD_APPAirspeedCaretSym, "HUD_APPAirspeedCaretSym", "HUD_APPAirspeedCaret_origin",
					"Vap",
					30.0,--imagepixelsizex
					30.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512 - 100,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
						"PILOT_HudAPPAirspeedCaret",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, -1.0 },
					}
				)

Add_Origin(HUD_STALLAirspeedCaret_origin, "HUD_STALLAirspeedCaret_origin", "HUD_origin",
					33.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudSTALLAirspeedCaretOn",
						"PILOT_HudSTALLAirspeedCaret",
					},
					{--controllers
						{"parameter_in_range",0,0.9,1.5},
						{"rotate_using_parameter",1, 1.0 },
					}
				)

Add_Image(HUD_STALLAirspeedCaret, "HUD_STALLAirspeedCaret", "HUD_STALLAirspeedCaret_origin",
					"AirspeedAltitude_caret",
					167.0,--imagepixelsizex
					167.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Image(HUD_STALLAirspeedCaret, "HUD_STALLAirspeedCaret", "HUD_STALLAirspeedCaret_origin",
					"Vs",
					30.0,--imagepixelsizex
					30.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512 - 100,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
						"PILOT_HudSTALLAirspeedCaret",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, -1.0 },
					}
				)

Add_Text(HUD_STALLAirspeedCaret, "HUD_STALLAirspeedCaret", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_HudSTALLAirspeedCaretOn",
						"PILOT_HudSTALLAirspeedCaretVal",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.9,1.5},
						{"text_using_parameter",2,0},
					},
					{"%.0f"}, {0.0045,0.0045, 0, 0},
					35,--initpixelposx
					297.5--initpixelposy
					)

Add_Image(HUD_STALLAirspeedCaret, "HUD_STALLAirspeedCaret", "HUD_origin",
					"Vs",
					25,--imagepixelsizex
					25,--imagepixelsizey
					52,--initpixelposx
					297,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"PILOT_HudSTALLAirspeedCaretOn",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.9,1.5},
					}
				)

Add_Origin(HUD_RefAirspeedCaret_origin, "HUD_RefAirspeedCaret_origin", "HUD_origin",
					33.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudRefAirspeedCaret",
						"PILOT_HudRefAirspeedCaretOn",
					},
					{--controllers
						{"rotate_using_parameter",0, 1.0 },
						{"parameter_in_range",1,0.9,1.5},
					}
				)

Add_Image(HUD_RefAirspeedCaret, "HUD_RefAirspeedCaret", "HUD_RefAirspeedCaret_origin",
					"AirspeedAltitude_caret",
					167.0,--imagepixelsizex
					167.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)
Add_Text(HUD_RefAirspeedCaret, "HUD_RefAirspeedCaret", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_RefAirspeedValOn",
						"PILOT_RefAirspeedVal",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.9,1.5},
						{"text_using_parameter",2,0},
					},
					{"%.0f"}, {0.0045,0.0045, 0, 0},
					35,--initpixelposx
					322.5--initpixelposy
					)

--------------------------------------------------------------------------------------------------------------------------------------Airspeed

Add_Image(HUD_Airspeed_back, "HUD_Airspeed_back", "HUD_origin",
					"AirspeedAltitude_back",
					155.0,--imagepixelsizex
					155.0,--imagepixelsizey
					33.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Image(HUD_Airspeed_pointer, "HUD_Airspeed_pointer", "HUD_origin",
					"AirspeedAltitude_pointer",
					155.0,--imagepixelsizex
					155.0,--imagepixelsizey
					33.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"IAS",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, -2 * math.pi / 100 },
					}
				)


Add_Text(HUD_Airspeed, "HUD_Airspeed", "font_HUD_green", "CenterCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"IAS",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%.0f"}, {0.0065,0.0065, 0, 0},
					33.5,--initpixelposx
					445--initpixelposy
					)

Add_Clip_Circular(HUD_Airspeed_clip, "HUD_Airspeed_clip", "HUD_origin",
					"AirspeedAltitude_back",--invisible, any material will do
					157.0,--imagepixelradius
					33.5,--initpixelposx
					445--initpixelposy
				)

----------------------------------------------------------------------------------------------------------------HUD_Altitude_carets
Add_Origin(HUD_RefAltitudeCaret_origin, "HUD_RefAltitudeCaret_origin", "HUD_origin",
					1001.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudRefAltitudeCaret",
						"PILOT_HudRefAltitudeCaretOn",
					},
					{--controllers
						{"rotate_using_parameter",0, 1.0 },
						{"parameter_in_range",1,0.9,1.5},
					}
				)

Add_Image(HUD_RefAltitudeCaret, "HUD_RefAltitudeCaret", "HUD_RefAltitudeCaret_origin",
					"AirspeedAltitude_caret",
					167.0,--imagepixelsizex
					167.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)
Add_Text(HUD_RefAltitudeCaret, "HUD_RefAltitudeCaret", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_HudRefAltitudeCaretValOn",
						"PILOT_HudRefAltitudeCaretVal",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.9,1.5},
						{"text_using_parameter",2,0},
					},
					{"%.0f"}, {0.0045,0.0045, 0, 0},
					1020,--initpixelposx
					322.5--initpixelposy
					)

----------------------------------------------------------------------------------------------------------------HUD_Altitude
Add_Image(HUD_Altitude_back, "HUD_Altitude_back", "HUD_origin",
					"AirspeedAltitude_back",
					155.0,--imagepixelsizex
					155.0,--imagepixelsizey
					1001.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Image(HUD_Altitude_pointer, "HUD_Altitude_pointer", "HUD_origin",
					"AirspeedAltitude_pointer",
					155.0,--imagepixelsizex
					155.0,--imagepixelsizey
					1001.5,--initpixelposx
					445,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"ALT_BARO",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, -2 * math.pi / 1000},
					}
				)

Add_Text(HUD_Altitude, "HUD_Altitude", "font_HUD_green", "CenterCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"ALT_BARO",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%.0f"}, {0.0065,0.0065, 0, 0},
					1001.5,--initpixelposx
					445--initpixelposy
					)

Add_Clip_Circular(HUD_Altitude_clip, "HUD_Altitude_clip", "HUD_origin",
					"AirspeedAltitude_back",--invisible, any material will do
					157.0,--imagepixelradius
					1001.5,--initpixelposx
					445--initpixelposy
				)

--------------------------------------------------------------------------------------------------------------------------------------RoC
Add_Text(HUD_VVI, "HUD_VVI", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"VVIsign",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.4,0.6},
						{"text_using_parameter",1,0},
					},
					{"+"}, {0.0085,0.0085, 0, 0},
					950,--initpixelposx
					612.5--initpixelposy
					)

Add_Text(HUD_VVI, "HUD_VVI", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"VVIsign",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,-0.6,-0.4},
						{"text_using_parameter",1,0},
					},
					{"-"}, {0.0085,0.0085, 0, 0},
					950,--initpixelposx
					612.5--initpixelposy
					)
Add_Text(HUD_VVI, "HUD_VVI", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"VVI",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%.1f"}, {0.0065,0.0065, 0, 0},
					975,--initpixelposx
					612.5--initpixelposy
					)

--------------------------------------------------------------------------------------------------------------------------------------Radar Altitude
Add_Text(HUD_Ralt, "HUD_Ralt", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"RADAR_ALTITUDE",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,-0.9,5000},
						{"text_using_parameter",1,0},
					},
					{"R"}, {0.0085,0.0085, 0, 0},
					930,--initpixelposx
					660--initpixelposy
					)
Add_Text(HUD_Ralt, "HUD_Ralt", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"RADAR_ALTITUDE",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,-0.9,5000},
						{"text_using_parameter",1,0},
					},
					{"%.0f"}, {0.0085,0.0085, 0, 0},
					970,--initpixelposx
					660--initpixelposy
					)
--------------------------------------------------------------------------------------------------------------------------------------Baro_Setting
Add_Text(HUD_Baro, "HUD_Baro", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"Baro_unit",
						"QNH_inHg",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,-0.05,0.05},
						{"text_using_parameter",2,0},
					},
					{"%.2f"}, {0.0065,0.0065, 0, 0},
					950,--initpixelposx
					960--initpixelposy
					)
Add_Text(HUD_Baro, "HUD_Baro", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"Baro_unit",
						"QNH_mbar",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.95,1.05},
						{"text_using_parameter",2,0},
					},
					{"%.0f"}, {0.0065,0.0065, 0, 0},
					950,--initpixelposx
					960--initpixelposy
					)
--------------------------------------------------------------------------------------------------------------------------------------G force
Add_Text(HUD_G_force, "HUD_G_force", "font_Arial_green", "Center", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"g"}, {0.0085,0.0085, 0, 0},
					22,--initpixelposx
					635--initpixelposy
					)

Add_Text(HUD_G_force_value, "HUD_G_force_value", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"GFORCE",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%.1f"}, {0.0065,0.0065, 0, 0},
					28,--initpixelposx
					618--initpixelposy
					)

----------------------------------------------------------------------------------------------------------------HUD_WindIndicator

Add_Origin(HUD_WindIndicator_origin, "HUD_WindIndicator_origin", "HUD_origin",
					5,--initpixelposx
					664,--initpixelposy
					{--params
						"WIND_RAD",
						"WIND_KNTS",
					},
					{--controllers
						{"rotate_using_parameter",0, -1.0 },
						{"parameter_in_range",1,6,200},
					}
				)

Add_Image(HUD_WindIndicator, "HUD_WindIndicator", "HUD_WindIndicator_origin",
					"WindIndicator",
					13.0,--imagepixelsizex
					52.0,--imagepixelsizey
					512,--initpixelposx - make init_pos 0 for new origin
					512,--initpixelposy - make init_pos 0 for new origin
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_WindIndicator, "HUD_WindIndicator", "font_HUD_green", "CenterCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"WIND_KNTS",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,6,200},
						{"text_using_parameter",1,0},
					},
					{"%.0f"}, {0.0045,0.0045, 0, 0},
					5,--initpixelposx
					705--initpixelposy
					)

--------------------------------------------------------------------------------------------------------------------------------------Ground speed
Add_Text(HUD_GS, "HUD_GS", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"G"}, {0.0065,0.0065, 0, 0},
					-30,--initpixelposx
					735--initpixelposy
					)

Add_Text(HUD_GS_value, "HUD_GS_value", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"GS",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%.0f"}, {0.0065,0.0065, 0, 0},
					50,--initpixelposx
					735--initpixelposy
					)

--------------------------------------------------------------------------------------------------------------------------------------Stopwatch
Add_Text(HUD_Stopwatch, "HUD_Stopwatch", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_StopWatchOnOff",
						"PILOT_StopWatchHour",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.5,4},
						{"text_using_parameter",2,0},
					},
					{"%.0f"}, {0.0055,0.0055, 0, 0},
					950,--initpixelposx
					700--initpixelposy
					)

Add_Text(HUD_Stopwatch, "HUD_Stopwatch", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_StopWatchOnOff",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.5,4},
						{"text_using_parameter",2,0},
					},
					{":"}, {0.0085,0.0085, 0, 0},
					975,--initpixelposx
					700--initpixelposy
					)

Add_Text(HUD_Stopwatch, "HUD_Stopwatch", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_StopWatchOnOff",
						"PILOT_StopWatchMin",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.5,4},
						{"text_using_parameter",2,0},
					},
					{"%.0f"}, {0.0055,0.0055, 0, 0},
					993,--initpixelposx
					700--initpixelposy
					)

Add_Text(HUD_Stopwatch, "HUD_Stopwatch", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_StopWatchOnOff",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.5,4},
						{"text_using_parameter",2,0},
					},
					{":"}, {0.0085,0.0085, 0, 0},
					1018,--initpixelposx
					700--initpixelposy
					)

Add_Text(HUD_Stopwatch, "HUD_Stopwatch", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_StopWatchOnOff",
						"PILOT_StopWatchSec",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.5,4},
						{"text_using_parameter",2,0},
					},
					{"%.0f"}, {0.0055,0.0055, 0, 0},
					1037,--initpixelposx
					700--initpixelposy
					)

--------------------------------------------------------------------------------------------------------------------------------------HUD_Messages
Add_Text(HUD_1_Pre, "HUD_1_Pre", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"HUD_1_Pre",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%s"}, {0.004,0.004, 0, 0},
					552.0,--initpixelposx
					152--initpixelposy
					)

Add_Text(HUD_1_Post, "HUD_1_Post", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"HUD_1_Post",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%s"}, {0.004,0.004, 0, 0},
					552.0,--initpixelposx
					152--initpixelposy
					)
Add_Text(HUD_2_Pre, "HUD_2_Pre", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"HUD_2_Pre",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%s"}, {0.004,0.004, 0, 0},
					552.0,--initpixelposx
					185--initpixelposy
					)

Add_Text(HUD_2_Post, "HUD_2_Post", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"HUD_2_Post",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%s"}, {0.004,0.004, 0, 0},
					552.0,--initpixelposx
					185--initpixelposy
					)

Add_Text(HUD_3_Pre, "HUD_3_Pre", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"HUD_3_Pre",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%s"}, {0.004,0.004, 0, 0},
					552.0,--initpixelposx
					218--initpixelposy
					)

Add_Text(HUD_3_Post, "HUD_3_Post", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"HUD_3_Post",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%s"}, {0.004,0.004, 0, 0},
					552.0,--initpixelposx
					218--initpixelposy
					)

----------------------------------------------------------------------------------------------------------------Autopilot
Add_Text(HUD_Autopilot, "HUD_Autopilot", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_AFCS_Engage_Lever",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.9,1.1},
						{"text_using_parameter",2,0},
					},
					{"<AP"}, {0.0050,0.0050, 0, 0},
					40,--initpixelposx
					225--initpixelposy
					)

Add_Text(HUD_Autopilot, "HUD_Autopilot", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_AFCS_Engage_Lever",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.9,1.1},
						{"text_using_parameter",2,0},
					},
					{"AP>"}, {0.0050,0.0050, 0, 0},
					61,--initpixelposx
					225--initpixelposy
					)

--------------------------------------------------------------------------------------------------------------------------------------Heading
Add_Clip_Rectangular(HUD_Headingtape_clip_left, "HUD_Headingtape_clip_left", "HUD_origin",
					MakeMaterial(nil,{255,0,0,50}),--red,--invisible, any material will do
					3700,--imagepixelsizex
					60.0,--imagepixelsizey
					-1507,--initpixelposx
					95--initpixelposy
				)

Add_Clip_Rectangular(HUD_Headingtape_clip_right, "HUD_Headingtape_clip_right", "HUD_origin",
					MakeMaterial(nil,{255,0,0,50}),--red,--invisible, any material will do
					3700,--imagepixelsizex
					60.0,--imagepixelsizey
					2527,--initpixelposx
					95--initpixelposy
				)

Add_Image(HUD_Headingtape_back, "HUD_Headingtape_back", "HUD_origin",
					"HUD_Heading_Tape",
					3721,--imagepixelsizex
					60.0,--imagepixelsizey
					2208.0,--initpixelposx
					95,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HEADING_RAD",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_left_right_using_parameter",1, -0.128496},
					}
				)

Add_Image(HUD_Heading_bracket, "HUD_Heading_bracket", "HUD_origin",
					"HeadingBracket",
					68.0,--imagepixelsizex
					46.6,--imagepixelsizey
					512.0,--initpixelposx
					47.3,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Clip_Rectangular(HUD_Headingtape_clip_back, "HUD_Headingtape_clip_back", "HUD_origin",
					MakeMaterial(nil,{0, 255, 0,50}),--green,--invisible, any material will do
					340,--imagepixelsizex
					60.0,--imagepixelsizey
					512.0,--initpixelposx
					95--initpixelposy
				)

Add_Text(HUD_Heading_bracket_value, "HUD_Heading_bracket_value", "font_HUD_green", "CenterCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"HEADING_DEG",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%03.0f"}, {0.0065,0.0065, 0, 0},
					512.0,--initpixelposx
					43.5--initpixelposy
					)

Add_Text(HUD_HDG_Selector, "HUD_HDG_Selector", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"HDG"}, {0.0050,0.0050, 0, 0},
					330,--initpixelposx
					43.5--initpixelposy
					)

Add_Text(HUD_HDG_Selector_value, "HUD_HDG_Selector_value", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_Hdg_Set",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%03.0f"}, {0.0050,0.0050, 0, 0},
					420,--initpixelposx
					43.5--initpixelposy
					)

Add_Text(HUD_CRS_Selector, "HUD_CRS_Selector", "font_HUD_green", "LeftCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"CRS"}, {0.0050,0.0050, 0, 0},
					606,--initpixelposx
					43.5--initpixelposy
					)

Add_Text(HUD_CRS_Selector_value, "HUD_CRS_Selector_value", "font_HUD_green", "RightCenter", "HUD_origin",
					{--params
						"PILOT_HudBrightness",
						"PILOT_CRS_Selector_Control",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"text_using_parameter",1,0},
					},
					{"%03.0f"}, {0.0050,0.0050, 0, 0},
					696,--initpixelposx
					43.5--initpixelposy
					)

Add_Clip_Rectangular(HUD_Heading_clip, "HUD_Heading_clip", "HUD_origin",
					MakeMaterial(nil,{255, 194, 0,50}),--amber,--invisible, any material will do
					375,--imagepixelsizex
					60.0,--imagepixelsizey
					512.0,--initpixelposx
					50--initpixelposy
				)

----------------------------------------------------------------------------------------------------------------BankAngleScale
local BankAngleIndicatorX = 0
local BankAngleIndicatorY = 130
Add_Image(BankAngleIndicator, "BankAngleIndicator", "HUD_origin",
					"BankAngleIndicator",
					-- {88.5/texture_size, 22.5/texture_size, 0.0103365770414103, 0.0103365770414103},
					35.0,--imagepixelsizex
					662.5,--imagepixelsizey
					512.0 + BankAngleIndicatorX,--initpixelposx
					480 + BankAngleIndicatorY,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudLadderRoll",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, 1.0 },
					}
				)

Add_Image(BankAngleScale, "BankAngleScale", "HUD_origin",
					"BankAngleScale",
					-- {88.5/texture_size, 22.5/texture_size, 0.0103365770414103, 0.0103365770414103},
					390.0,--imagepixelsizex
					77.5,--imagepixelsizey
					512.0 + BankAngleIndicatorX,--initpixelposx
					800 + BankAngleIndicatorY,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

----------------------------------------------------------------------------------------------------------------HUD_Waterline
Add_Image(HUD_Waterline, "HUD_Waterline", "HUD_origin",
					"HudWaterline",
					-- {88.5/texture_size, 22.5/texture_size, 0.0103365770414103, 0.0103365770414103},
					114.0,--imagepixelsizex
					22.0,--imagepixelsizey
					512.0,--initpixelposx
					480,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)


----------------------------------------------------------------------------------------------------------------HUD_ladder

Add_Origin(HUD_HudHorizonLine_origin, "HUD_HudHorizonLine_origin", "HUD_origin",
					512,--initpixelposx
					480,--initpixelposy
					{--params
						"HudLadderRoll",
					},
					{--controllers
						{"rotate_using_parameter",0, 1.0 },
					}
				)

Add_Image(HUD_HudHorizonLine, "HUD_HudHorizonLine", "HUD_HudHorizonLine_origin",
					"HudHorizonLine",
					1300.0,--imagepixelsizex
					4.0,--imagepixelsizey
					512,--initpixelposx
					544,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudHorsLineVertOffset",
						"HudGostHorsLine",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2,-0.05,0.05},
					}
				)

Add_Image(HUD_HudGostHorizonLine, "HUD_HudGostHorizonLine", "HUD_HudHorizonLine_origin",
					"HudGostHorizonLine",
					1300.0,--imagepixelsizex
					4.0,--imagepixelsizey
					512,--initpixelposx
					544,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudGostHorsLineOffset",
						"HudGostHorsLine",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2,0.9,1.5},
					}
				)

----------------------------------------------------------------------------------------------------------------Positive ladder

Add_Origin(HUD_Ladder_origin, "HUD_Ladder_origin", "HUD_origin",
					512,--initpixelposx
					512,--initpixelposy
					{--params
						"HudLadderRoll",
						"HudHorsLineVertOffset",
					},
					{--controllers
						{"rotate_using_parameter",0, 1.0 },
						{"move_up_down_using_parameter",1, 1.0 },
					}
				)

Add_Image(HUD_LadderPositive5, "HUD_LadderPositive5", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					282.17,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive5, "HUD_LadderPositive5", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"5", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					282.17--initpixelposy
					)

Add_Image(HUD_LadderPositive10, "HUD_LadderPositive10", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					51.43,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive10, "HUD_LadderPositive10", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"10", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					51.43--initpixelposy
					)

Add_Image(HUD_LadderPositive15, "HUD_LadderPositive15", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-195.24,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive15, "HUD_LadderPositive15", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"15", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-195.24--initpixelposy
					)
Add_Image(HUD_LadderPositive20, "HUD_LadderPositive20", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-445.55,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive20, "HUD_LadderPositive20", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"20", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-445.55--initpixelposy
					)

Add_Image(HUD_LadderPositive25, "HUD_LadderPositive25", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-716.8,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive25, "HUD_LadderPositive25", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"25", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-716.8--initpixelposy
					)

Add_Image(HUD_LadderPositive30, "HUD_LadderPositive30", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-1005.8,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive30, "HUD_LadderPositive30", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"30", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-1005.8--initpixelposy
					)

Add_Image(HUD_LadderPositive35, "HUD_LadderPositive35", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-1333.48,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive35, "HUD_LadderPositive35", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"35", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-1333.48--initpixelposy
					)

Add_Image(HUD_LadderPositive40, "HUD_LadderPositive40", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-1705.3,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive40, "HUD_LadderPositive40", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"40", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-1705.3--initpixelposy
					)

Add_Image(HUD_LadderPositive45, "HUD_LadderPositive45", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-2124.0,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive45, "HUD_LadderPositive45", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"45", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-2124.0--initpixelposy
					)

Add_Image(HUD_LadderPositive50, "HUD_LadderPositive50", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-2631.91,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive50, "HUD_LadderPositive50", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"50", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-2631.91--initpixelposy
					)

Add_Image(HUD_LadderPositive55, "HUD_LadderPositive55", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-3256.32,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive55, "HUD_LadderPositive55", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"55", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-3256.32--initpixelposy
					)

Add_Image(HUD_LadderPositive60, "HUD_LadderPositive60", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-4057.77,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudLadderVertOffset",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive60, "HUD_LadderPositive60", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"60", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-4057.77--initpixelposy
					)

Add_Image(HUD_LadderPositive65, "HUD_LadderPositive65", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-5160.51,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive65, "HUD_LadderPositive65", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"65", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-5160.51--initpixelposy
					)

Add_Image(HUD_LadderPositive70, "HUD_LadderPositive70", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-6787.53,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive70, "HUD_LadderPositive70", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"70", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-6787.53--initpixelposy
					)

Add_Image(HUD_LadderPositive75, "HUD_LadderPositive75", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-9317.95,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive75, "HUD_LadderPositive75", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"75", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-9317.95--initpixelposy
					)

Add_Image(HUD_LadderPositive80, "HUD_LadderPositive80", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-15912.05,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive80, "HUD_LadderPositive80", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"80", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-15912.05--initpixelposy
					)

Add_Image(HUD_LadderPositive85, "HUD_LadderPositive85", "HUD_Ladder_origin",
					"HudLadderPositive",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					-30167.04,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderPositive85, "HUD_LadderPositive85", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"85", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					-30167.04--initpixelposy
					)

----------------------------------------------------------------------------------------------------------------Negative ladder

Add_Image(HUD_LadderNegative5, "HUD_LadderNegative5", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					743.2,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						-- "HudLadderVertOffset",
					},
					{--controllers
						{"opacity_using_parameter",0},
						-- {"move_up_down_using_parameter",1, 1.0 },
					}
				)

Add_Text(HUD_LadderNegative5, "HUD_LadderNegative5", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-5", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					743.2--initpixelposy
					)

Add_Image(HUD_LadderNegative10, "HUD_LadderNegative10", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					973.94,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative10, "HUD_LadderNegative10", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-10", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					973.94--initpixelposy
					)

Add_Image(HUD_LadderNegative15, "HUD_LadderNegative15", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					1220.61,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative15, "HUD_LadderNegative15", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-15", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					1220.61--initpixelposy
					)
Add_Image(HUD_LadderNegative20, "HUD_LadderNegative20", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					1470.92,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative20, "HUD_LadderNegative20", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-20", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					1470.92--initpixelposy
					)

Add_Image(HUD_LadderNegative25, "HUD_LadderNegative25", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					1742.17,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative25, "HUD_LadderNegative25", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-25", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					1742.17--initpixelposy
					)

Add_Image(HUD_LadderNegative30, "HUD_LadderNegative30", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					2031.17,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative30, "HUD_LadderNegative30", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-30", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					2031.17--initpixelposy
					)

Add_Image(HUD_LadderNegative35, "HUD_LadderNegative35", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					2358.85,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative35, "HUD_LadderNegative35", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-35", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					2358.85--initpixelposy
					)

Add_Image(HUD_LadderNegative40, "HUD_LadderNegative40", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					2730.67,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative40, "HUD_LadderNegative40", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-40", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					2730.67--initpixelposy
					)

Add_Image(HUD_LadderNegative45, "HUD_LadderNegative45", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					3149.37,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative45, "HUD_LadderNegative45", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-45", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					3149.37--initpixelposy
					)

Add_Image(HUD_LadderNegative50, "HUD_LadderNegative50", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					3657.28,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative50, "HUD_LadderNegative50", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-50", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					3657.28--initpixelposy
					)

Add_Image(HUD_LadderNegative55, "HUD_LadderNegative55", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					4281.69,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative55, "HUD_LadderNegative55", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-55", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					4281.69--initpixelposy
					)

Add_Image(HUD_LadderNegative60, "HUD_LadderNegative60", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					5083.14,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudLadderVertOffset",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative60, "HUD_LadderNegative60", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-60", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					5083.14--initpixelposy
					)

Add_Image(HUD_LadderNegative65, "HUD_LadderNegative65", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					6185.88,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative65, "HUD_LadderNegative65", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-65", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					6185.88--initpixelposy
					)

Add_Image(HUD_LadderNegative70, "HUD_LadderNegative70", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					7812.9,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative70, "HUD_LadderNegative70", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-70", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					7812.9--initpixelposy
					)

Add_Image(HUD_LadderNegative75, "HUD_LadderNegative75", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					10343.32,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative75, "HUD_LadderNegative75", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-75", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					10343.32--initpixelposy
					)

Add_Image(HUD_LadderNegative80, "HUD_LadderNegative80", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					16937.42,--initpixelposy
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					}
				)

Add_Text(HUD_LadderNegative80, "HUD_LadderNegative80", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-80", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					16937.42--initpixelposy
					)

Add_Image(HUD_LadderNegative85, "HUD_LadderNegative85", "HUD_Ladder_origin",
					"HudLadderNegative",
					288.0,--imagepixelsizex
					16.0,--imagepixelsizey
					512.0,--initpixelposx
					31192.41,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						-- "HudLadderVertOffset",
					},
					{--controllers
						{"opacity_using_parameter",0},
						-- {"move_up_down_using_parameter",1, 1.0 },
					}
				)

Add_Text(HUD_LadderNegative85, "HUD_LadderNegative85", "font_HUD_green", "RightCenter", "HUD_Ladder_origin",
					{--params
						"PILOT_HudBrightness",
					},
					{--controllers
						{"opacity_using_parameter",0},
					},
					"-85", {0.005,0.005, 0, 0},
					360.0,--initpixelposx
					31192.41--initpixelposy
					)

----------------------------------------------------------------------------------------------------------------HUD_GhostFPM
Add_Image(HUD_GhostFPM, "HUD_GhostFPM", "HUD_Ladder_origin",
					"GhostFPM",
					114,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudFPMVertOffset",
						"HudFPMHorsOffset",
						"HudLadderRoll",
						"HudGhostFPM_X",
						"HudActive",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"move_left_right_using_parameter",2, 1.0 },
						{"rotate_using_parameter",3, -1.0 },
						{"parameter_in_range",4,-0.5,0.5},
						{"parameter_in_range",5,0.95,1.5},
					}
				)

Add_Image(HUD_GhostFPM_X, "HUD_GhostFPM_X", "HUD_Ladder_origin",
					"GhostFPM_X",
					114,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudFPMVertOffset",
						"HudFPMHorsOffset",
						"HudLadderRoll",
						"HudGhostFPM_X",
						"HudActive",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"move_left_right_using_parameter",2, 1.0 },
						{"rotate_using_parameter",3, -1.0 },
						{"parameter_in_range",4,0.95,1.5},
						{"parameter_in_range",5,0.95,1.5},
					}
				)

Add_Image(HUD_GhostFPM_Inactive, "HUD_GhostFPM_Inactive", "HUD_origin",
					"GhostFPM",
					114,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					474,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudActive",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,-0.5,0.5},
					}
				)

----------------------------------------------------------------------------------------------------------------HUD_CDM
Add_Image(HUD_CDM, "HUD_CDM", "HUD_Ladder_origin",
					"CDM",
					114,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudCDMVertOffset",
						"HudLadderRoll",
						"HudCDM_X",
						"HudActive",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"rotate_using_parameter",2, -1.0 },
						{"parameter_in_range",3,-0.5,0.5},
						{"parameter_in_range",4,0.95,1.5},
					}
				)

Add_Image(HUD_CDM_X, "HUD_CDM_X", "HUD_Ladder_origin",
					"CDM_X",
					114,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudCDMVertOffset",
						"HudLadderRoll",
						"HudCDM_X",
						"HudActive",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"rotate_using_parameter",2, -1.0 },
						{"parameter_in_range",3,0.95,1.5},
						{"parameter_in_range",4,0.95,1.5},
					}
				)

Add_Image(HUD_CDM_Inactive, "HUD_CDM_Inactive", "HUD_origin",
					"CDM",
					114,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					474,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudActive",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,-0.5,0.5},
					}
				)

----------------------------------------------------------------------------------------------------------------Side slip indicator
Add_Image(HUD_SideForce, "HUD_SideForce", "HUD_CDM",
					"SideForceIndicator",
					32,--imagepixelsizex
					40,--imagepixelsizey
					512.0,--initpixelposx
					555,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudSideForceActive",
						"HudSideForceHorsOffset",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.95,1.5},
						{"move_left_right_using_parameter",2, 1.0 },
					}
				)

Add_Image(HUD_SideSlip, "HUD_SideSlip", "HUD_SideForce",
					"SideSlipIndicator",
					32,--imagepixelsizex
					40,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudSideSlipActive",
						"HudSideSlipHorsOffset",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"parameter_in_range",1,0.95,1.5},
						{"move_left_right_using_parameter",2, 1.0 },
					}
				)

local aaa	         = -1
local bbb	         = -85
----------------------------------------------------------------------------------------------------------------Ref_Airspeed_Error_Cue
Add_Clip_Rectangular(Ref_Airspeed_Error_Cue_clip, "Ref_Airspeed_Error_Cue_clip", "HUD_CDM",
					MakeMaterial(nil,{255,0,0,50}),--red,--invisible, any material will do
					16,--imagepixelsizex
					80,--imagepixelsizey
					474,--initpixelposx
					470,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"PILOT_Ref_Airspeed_Error_Cue_clip_move",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0},
					}
				)

Add_Image(Ref_Airspeed_Error_Cue, "Ref_Airspeed_Error_Cue", "HUD_CDM",
					"Ref_Airspeed_Error_Cue",
					16,--imagepixelsizex
					80,--imagepixelsizey
					474,--initpixelposx
					554,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"PILOT_Ref_Airspeed_Error_Cue_rotate",
						"PILOT_Ref_Airspeed_Error_Cue_move",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, 1.0},
						{"move_up_down_using_parameter",2, 1.0},
					}
				)

Add_Clip_Rectangular(Ref_Airspeed_Error_Cue_clip, "Ref_Airspeed_Error_Cue_clip", "HUD_CDM_Inactive",
					MakeMaterial(nil,{255,0,0,50}),--red,--invisible, any material will do
					16,--imagepixelsizex
					80,--imagepixelsizey
					474,--initpixelposx
					470,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"PILOT_Ref_Airspeed_Error_Cue_clip_move",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0},
					}
				)
Add_Image(Ref_Airspeed_Error_Cue, "Ref_Airspeed_Error_Cue", "HUD_CDM_Inactive",
					"Ref_Airspeed_Error_Cue",
					16,--imagepixelsizex
					80,--imagepixelsizey
					474,--initpixelposx
					554,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"PILOT_Ref_Airspeed_Error_Cue_rotate",
						"PILOT_Ref_Airspeed_Error_Cue_move",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"rotate_using_parameter",1, 1.0 },
						{"move_up_down_using_parameter",2, 1.0 },
					}
				)

----------------------------------------------------------------------------------------------------------------HUD_EnergyCue
Add_Image(HUD_EnergyCue, "HUD_EnergyCue", "HUD_CDM",
					"EnergyCue",
					175,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudEnergyCueVertOffset",
						"HudEnergyCueAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2,-0.05,0.05},
					}
				)

Add_Image(HUD_EnergyCue, "HUD_EnergyCue", "HUD_CDM",
					"EnergyCueAT",
					175,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudEnergyCueVertOffset",
						"HudEnergyCueAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2, 0.95, 1.05},
					}
				)

Add_Image(HUD_EnergyCue, "HUD_EnergyCue", "HUD_CDM_X",
					"EnergyCue",
					175,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudEnergyCueVertOffset",
						"HudEnergyCueAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2,-0.05,0.05},
					}
				)

Add_Image(HUD_EnergyCue, "HUD_EnergyCue", "HUD_CDM_X",
					"EnergyCueAT",
					175,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudEnergyCueVertOffset",
						"HudEnergyCueAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2, 0.95, 1.05},
					}
				)

Add_Image(HUD_EnergyCue, "HUD_EnergyCue", "HUD_CDM_Inactive",
					"EnergyCue",
					175,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudEnergyCueVertOffset",
						"HudEnergyCueAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2,-0.05,0.05},
					}
				)

Add_Image(HUD_EnergyCue, "HUD_EnergyCue", "HUD_CDM_Inactive",
					"EnergyCueAT",
					175,--imagepixelsizex
					66,--imagepixelsizey
					512.0,--initpixelposx
					512,--initpixelposy
					{--params
						"PILOT_HudBrightness",
						"HudEnergyCueVertOffset",
						"HudEnergyCueAT",
					},
					{--controllers
						{"opacity_using_parameter",0},
						{"move_up_down_using_parameter",1, 1.0 },
						{"parameter_in_range",2, 0.95, 1.05},
					}
				)































