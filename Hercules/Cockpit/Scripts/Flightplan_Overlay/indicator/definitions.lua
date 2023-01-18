-- 

dofile(LockOn_Options.common_script_path.."elements_defs.lua")
-- dofile(LockOn_Options.script_path.."symbols.lua")
SetScale(FOV)

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
						
function AddElement(object, level)
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= level or DISPLAY_DEFAULT_LEVEL
	object.blend_mode 	=  blend_mode.IBM_REGULAR
	object.collimated = true
	object.indices = default_box_indices	
    Add(object)
end

