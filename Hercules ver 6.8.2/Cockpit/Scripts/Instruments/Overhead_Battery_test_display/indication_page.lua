dofile(LockOn_Options.common_script_path.."elements_defs.lua")
SetScale(FOV)

DISPLAY_DEFAULT_LEVEL = 4

						

function Add_Object_Text(object, objectname, objectparent, objectmaterial, objectalignment, format_value, stringdefs_value, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	local object           = CreateElement "ceStringPoly"
	object.name            = objectname
	object.material        = objectmaterial
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.init_pos = {(0.003333 * initpixelposx) - 1, ((-0.005 * initpixelposy) + 1) * GetAspect()}
	object.alignment		= objectalignment
	if format_value ~= nil then
		if type(format_value) == "table" then
			object.formats = format_value
		else
			object.value = format_value
		end
	end
	object.stringdefs		= stringdefs_value--VerticalSize, HorizontalSize, HorizontalSpacing, VerticalSpacing
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.collimated		= false
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= DISPLAY_DEFAULT_LEVEL
	object.parent_element = objectparent
    Add(object)
end



--------------------------------------------------------------------------------------------------------------------------------------------Engine_Status

Add_Object_Text(ISO_DC_Volts, "ISO_DC_Volts", nil,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.1f"},--format_value
					{0.009,0.009,  -0.0042, 0},--stringdefs_value
					-30.0,--initpixelposx
					200.0,--initpixelposy
					{--params
						"Utility_battery_Test_state",
						"Avionics_battery_Test_state",
						"ISO_DC",
					},
					{--controllers
						{"parameter_in_range",0,-0.05,0.05},
						{"parameter_in_range",1,-0.05,0.05},
						{"parameter_in_range",2,22,28.05},
						{"text_using_parameter",2,0},
					}
				)

local Utility_battery_Volts_origin	         = CreateElement "ceSimple"
Utility_battery_Volts_origin.name 		     = "Utility_battery_Volts_origin"
Utility_battery_Volts_origin.init_pos        = {0,0}
Utility_battery_Volts_origin.element_params   = {
								"Utility_battery_Test_state",
										   } 
Utility_battery_Volts_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
Utility_battery_Volts_origin.use_mipfilter    = true
Utility_battery_Volts_origin.additive_alpha   = true
Utility_battery_Volts_origin.h_clip_relation  = h_clip_relations.COMPARE
Utility_battery_Volts_origin.level			= DISPLAY_DEFAULT_LEVEL
Add(Utility_battery_Volts_origin)

Add_Object_Text(Utility_battery_Volts, "Utility_battery_Volts", Utility_battery_Volts_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.1f"},--format_value
					{0.009,0.009,  -0.0042, 0},--stringdefs_value
					-30.0,--initpixelposx
					200.0,--initpixelposy
					{--params
						"Utility_battery",
						-- "FlatscreenBrightness",
					},
					{--controllers
						{"text_using_parameter",0,0},
						-- {"opacity_using_parameter",1},
					}
				)

local Avionics_battery_Volts_origin	         = CreateElement "ceSimple"
Avionics_battery_Volts_origin.name 		     = "Avionics_battery_Volts_origin"
Avionics_battery_Volts_origin.init_pos        = {0,0}
Avionics_battery_Volts_origin.element_params   = {
								"Avionics_battery_Test_state",
										   } 
Avionics_battery_Volts_origin.controllers 	   = {
								{"parameter_in_range",0,0.95,1.05},
								}
Avionics_battery_Volts_origin.use_mipfilter    = true
Avionics_battery_Volts_origin.additive_alpha   = true
Avionics_battery_Volts_origin.h_clip_relation  = h_clip_relations.COMPARE
Avionics_battery_Volts_origin.level			= DISPLAY_DEFAULT_LEVEL
Add(Avionics_battery_Volts_origin)

Add_Object_Text(Avionics_battery_Volts, "Avionics_battery_Volts", Avionics_battery_Volts_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.1f"},--format_value
					{0.009,0.009,  -0.0042, 0},--stringdefs_value
					-30.0,--initpixelposx
					200.0,--initpixelposy
					{--params
						"Avionics_battery",
						-- "FlatscreenBrightness",
					},
					{--controllers
						{"text_using_parameter",0,0},
						-- {"opacity_using_parameter",1},
					}
				)

































