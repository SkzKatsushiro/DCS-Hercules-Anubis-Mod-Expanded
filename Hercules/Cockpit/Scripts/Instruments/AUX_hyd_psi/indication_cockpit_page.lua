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

local AUX_hyd_psi_origin	         = CreateElement "ceSimple"
AUX_hyd_psi_origin.name 		     = "AUX_hyd_psi_origin"
AUX_hyd_psi_origin.init_pos        = {0,0}
AUX_hyd_psi_origin.use_mipfilter    = true
AUX_hyd_psi_origin.additive_alpha   = true
AUX_hyd_psi_origin.h_clip_relation  = h_clip_relations.COMPARE
AUX_hyd_psi_origin.level			= DISPLAY_DEFAULT_LEVEL
Add(AUX_hyd_psi_origin)

Add_Object_Text(AUX_hyd_psi, "AUX_hyd_psi", AUX_hyd_psi_origin.name,
					"font_Arial_green",--objectmaterial
					"LeftCenter",--objectalignment
					{"%.0f"},--format_value
					{0.009,0.009,  -0.0042, 0},--stringdefs_value
					100.0,--initpixelposx
					200.0,--initpixelposy
					{--params
						"AUX_hyd_psi",
					},
					{--controllers
						{"text_using_parameter",0,0},
						{"parameter_in_range",0, -0.5, 9000},
					}
				)


