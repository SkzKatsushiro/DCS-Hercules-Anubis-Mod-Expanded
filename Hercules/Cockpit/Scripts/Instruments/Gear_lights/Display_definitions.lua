--Display_definitions
dofile(LockOn_Options.common_script_path.."elements_defs.lua")

SetScale(FOV)

width  	   = 1.0;
height 	   = width * GetAspect()

DISPLAY_DEFAULT_LEVEL = 4

--BrigtnessController
BCont	=
{
	[1] = {"change_color_when_parameter_equal_to_number", 0, 0.999, 0.999, 0.999, 0.999},
	[2] = {"change_color_when_parameter_equal_to_number", 0, 0.775, 0.775, 0.775, 0.775},
	[3] = {"change_color_when_parameter_equal_to_number", 0, 0.589, 0.589, 0.589, 0.589},
	[4] = {"change_color_when_parameter_equal_to_number", 0, 0.437, 0.437, 0.437, 0.437},
	[5] = {"change_color_when_parameter_equal_to_number", 0, 0.315, 0.315, 0.315, 0.315},
	[6] = {"change_color_when_parameter_equal_to_number", 0, 0.220, 0.220, 0.220, 0.220},
	[7] = {"change_color_when_parameter_equal_to_number", 0, 0.149, 0.149, 0.149, 0.149},
	[8] = {"change_color_when_parameter_equal_to_number", 0, 0.098, 0.098, 0.098, 0.098},
	[9] = {"change_color_when_parameter_equal_to_number", 0, 0.063, 0.063, 0.063, 0.063},
	[10] = {"change_color_when_parameter_equal_to_number", 0, 0.041, 0.041, 0.041, 0.041},
	[11] = {"change_color_when_parameter_equal_to_number", 0, 0.029, 0.029, 0.029, 0.029},
	[12] = {"change_color_when_parameter_equal_to_number", 0, 0.023, 0.023, 0.023, 0.023},
	[13] = {"change_color_when_parameter_equal_to_number", 0, 0.019, 0.019, 0.019, 0.019},
	[14] = {"change_color_when_parameter_equal_to_number", 0, 0.014, 0.014, 0.014, 0.014},
	[15] = {"change_color_when_parameter_equal_to_number", 0, 0.005, 0.005, 0.005, 0.005},
}
						
function AddElement(object)
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= DISPLAY_DEFAULT_LEVEL
    Add(object)
end

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

