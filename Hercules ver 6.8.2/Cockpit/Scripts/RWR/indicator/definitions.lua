--

dofile(LockOn_Options.common_script_path.."elements_defs.lua")
-- dofile(LockOn_Options.script_path.."symbols.lua")
SetScale(FOV)

DISPLAY_DEFAULT_LEVEL = 7

--BrigtnessController
BCont	=
{
	[1] = {"change_color_when_parameter_equal_to_number", 0, 1.0, 1.0, 1.0, 1.0},
	[2] = {"change_color_when_parameter_equal_to_number", 0, 0.9, 0.9, 0.9, 0.9},
	[3] = {"change_color_when_parameter_equal_to_number", 0, 0.8, 0.8, 0.8, 0.8},
	[4] = {"change_color_when_parameter_equal_to_number", 0, 0.7, 0.7, 0.7, 0.7},
	[5] = {"change_color_when_parameter_equal_to_number", 0, 0.6, 0.6, 0.6, 0.6},
	[6] = {"change_color_when_parameter_equal_to_number", 0, 0.5, 0.5, 0.5, 0.5},
	[7] = {"change_color_when_parameter_equal_to_number", 0, 0.4, 0.4, 0.4, 0.4},
	[8] = {"change_color_when_parameter_equal_to_number", 0, 0.3, 0.3, 0.3, 0.3},
	[9] = {"change_color_when_parameter_equal_to_number", 0, 0.2, 0.2, 0.2, 0.2},
	[10] = {"change_color_when_parameter_equal_to_number", 0, 0.1, 0.1, 0.1, 0.1},
}

yellow_contact = {"change_color_when_parameter_equal_to_number", 6, 1.0, 1, 1, 0.1, 1}
magenta_contact = {"change_color_when_parameter_equal_to_number", 6, 2.0, 1, 0.1, 1, 1}

function AddElement(object, level)
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.REWRITE_LEVEL
	object.level			= DISPLAY_DEFAULT_LEVEL
	object.blend_mode 	=  blend_mode.IBM_REGULAR
	object.collimated = true
	object.level = DISPLAY_DEFAULT_LEVEL
    Add(object)
end

MFCD_GREEN = "green" -- = MakeMaterial(nil,{0, 255, 5, 255})
MFCD_GREEN_SOFT = MakeMaterial(nil, {25, 255, 25, 128})
RWR_MAGENTA = MakeMaterial(nil, {255, 25, 255, 255})
RWR_FONT = MakeFont({
    used_DXUnicodeFontData = "font_dejavu_lgc_sans_22"
}, {255, 0, 255, 255})

