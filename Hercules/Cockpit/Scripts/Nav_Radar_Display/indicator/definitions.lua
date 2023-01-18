--

dofile(LockOn_Options.common_script_path.."elements_defs.lua")
-- dofile(LockOn_Options.script_path.."symbols.lua")
SetScale(FOV)

DISPLAY_DEFAULT_LEVEL = 7
NAV_FONT = MakeFont({
    used_DXUnicodeFontData = "font_dejavu_lgc_sans_22"
}, {30, 255, 5, 255})

NAV_FONT_WHITE = MakeFont({
    used_DXUnicodeFontData = "font_dejavu_lgc_sans_22"
}, {255, 255, 255, 255})

NAV_FONT_WHITE_SMALL = MakeFont({
    used_DXUnicodeFontData = "font_dejavu_lgc_sans_22"
}, {128, 128, 128, 255})

NAV_FONT_CYAN = MakeFont({
    used_DXUnicodeFontData = "font_dejavu_lgc_sans_22"
}, {50, 255, 255, 255})


MFCD_GREEN = MakeMaterial(nil,{30, 255, 5, 255})
MFCD_GREEN_SOFT = MakeMaterial(nil, {25, 255, 25, 128})
-- MFCD_CYAN = MakeMaterial(nil, {25, 255, 25, 128})

CURSOR_TARGET_MAT = MakeMaterial(nil,{175,175,175,170})
CURSOR_TARGET_MAT_SOFT = MakeMaterial(nil,{175,175,175,90})
FLPN_WHITE = MakeMaterial(nil, {255, 255, 255, 255})
FLPN_BLACK = MakeMaterial(nil, {0, 0, 0, 255})
FLPN_CYAN = MakeMaterial(nil, {0, 255, 255, 255})

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
	local lvl
	if level then
		lvl = level
	else
		lvl = DISPLAY_DEFAULT_LEVEL
	end
    object.use_mipfilter    = true
	object.additive_alpha   = true
	-- object.h_clip_relation  = h_clip_relations.COMPARE
	object.h_clip_relation  = h_clip_relations.REWRITE_LEVEL
	object.level			= lvl
	object.blend_mode 	=  blend_mode.IBM_REGULAR
	object.collimated = true
    Add(object)
end



function VectorAdd (ang1, mag1, ang2, mag2)
	local x1 = math.cos(ang1)*mag1
	local y1 = math.sin(ang1)*mag1
	local x2 = math.cos(ang2)*mag2
	local y2 = math.sin(ang2)*mag2

	return math.atan2(y2+y1, x2+x1), math.sqrt((x2+x1)^2+(y2+y1)^2)
end