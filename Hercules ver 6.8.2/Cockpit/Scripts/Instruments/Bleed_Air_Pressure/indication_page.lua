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

local Bleed_Air_origin	         = CreateElement "ceSimple"
Bleed_Air_origin.name 		     = "Bleed_Air_origin"
Bleed_Air_origin.init_pos        = {0,0}
Bleed_Air_origin.use_mipfilter    = true
Bleed_Air_origin.additive_alpha   = true
Bleed_Air_origin.h_clip_relation  = h_clip_relations.COMPARE
Bleed_Air_origin.level			= DISPLAY_DEFAULT_LEVEL
Add(Bleed_Air_origin)

Add_Object_Text(Bleed_Air, "Bleed_Air", Bleed_Air_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"__ _"},--format_value
					{0.009,0.009,  -0.0042, 0},--stringdefs_value
					-30.0,--initpixelposx
					200.0,--initpixelposy
					{--params
						"Bleed_Air_Pressure",
					},
					{--controllers
						{"text_using_parameter",0,0},
						{"parameter_in_range",0, -0.5, 1},
					}
				)

Add_Object_Text(Bleed_Air, "Bleed_Air", Bleed_Air_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.1f"},--format_value
					{0.009,0.009,  -0.0042, 0},--stringdefs_value
					-30.0,--initpixelposx
					200.0,--initpixelposy
					{--params
						"Bleed_Air_Pressure",
					},
					{--controllers
						{"text_using_parameter",0,0},
						{"parameter_in_range",0, 1, 45},
					}
				)

































