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

local PILOT_RefAirspeedVal_origin	         = CreateElement "ceSimple"
PILOT_RefAirspeedVal_origin.name 		     = "PILOT_RefAirspeedVal_origin"
PILOT_RefAirspeedVal_origin.init_pos        = {0,0}
PILOT_RefAirspeedVal_origin.use_mipfilter    = true
PILOT_RefAirspeedVal_origin.additive_alpha   = true
PILOT_RefAirspeedVal_origin.h_clip_relation  = h_clip_relations.COMPARE
PILOT_RefAirspeedVal_origin.level			= DISPLAY_DEFAULT_LEVEL
Add(PILOT_RefAirspeedVal_origin)

Add_Object_Text(PILOT_RefAirspeedVal, "PILOT_RefAirspeedVal", PILOT_RefAirspeedVal_origin.name,
	"font_Arial_green",--objectmaterial
	"RightCenter",--objectalignment
	{"%.0f"},--format_value
	{0.013,0.013,  -0.0033, 0},--stringdefs_value
	560.0,--initpixelposx
	200.0,--initpixelposy
	{--params
		"PILOT_RefAirspeedVal",
		"PILOT_RefAirspeedDisp",
		-- "FlatscreenBrightness",
	},
	{--controllers
		{"text_using_parameter",0,0},
		{"parameter_in_range",1,0.95,1.05},
	}
)

Add_Object_Text(PILOT_RefAltVal, "PILOT_RefAltVal", PILOT_RefAirspeedVal_origin.name,
	"font_Arial_green",--objectmaterial
	"RightCenter",--objectalignment
	{"%.0f"},--format_value
	{0.013,0.013,  -0.0033, 0},--stringdefs_value
	560.0,--initpixelposx
	200.0,--initpixelposy
	{--params
		"PILOT_RefAltVal",
		"PILOT_RefAltDisp",
		-- "FlatscreenBrightness",
	},
	{--controllers
		{"text_using_parameter",0,0},
		{"parameter_in_range",1,0.95,1.05},
	}
)

Add_Object_Text(PILOT_RefHPVal, "PILOT_RefHPVal", PILOT_RefAirspeedVal_origin.name,
	"font_Arial_green",--objectmaterial
	"RightCenter",--objectalignment
	{"%.0f"},--format_value
	{0.013,0.013,  -0.0033, 0},--stringdefs_value
	560.0,--initpixelposx
	200.0,--initpixelposy
	{--params
		"PILOT_RefHPVal",
		"PILOT_RefHPDisp",
		-- "FlatscreenBrightness",
	},
	{--controllers
		{"text_using_parameter",0,0},
		{"parameter_in_range",1,0.95,1.05},
	}
)

Add_Object_Text(PILOT_RefFPAVal, "PILOT_RefFPAVal", PILOT_RefAirspeedVal_origin.name,
	"font_Arial_green",--objectmaterial
	"RightCenter",--objectalignment
	{"%0.1f"},--format_value
	{0.013,0.013,  -0.0065, 0},--stringdefs_value
	530.0,--initpixelposx
	200.0,--initpixelposy
	{--params
		"PILOT_RefFPAVal",
		"PILOT_RefFPADisp",
		-- "FlatscreenBrightness",
	},
	{--controllers
		{"text_using_parameter",0,0},
		{"parameter_in_range",1,0.95,1.05},
	}
)

Add_Object_Text(PILOT_RefMinsVal, "PILOT_RefMinsVal", PILOT_RefAirspeedVal_origin.name,
	"font_Arial_green",--objectmaterial
	"RightCenter",--objectalignment
	{"%.0f"},--format_value
	{0.013,0.013,  -0.0033, 0},--stringdefs_value
	560.0,--initpixelposx
	200.0,--initpixelposy
	{--params
		"PILOT_RefMinsVal",
		"PILOT_RefMinsDisp",
		-- "FlatscreenBrightness",
	},
	{--controllers
		{"text_using_parameter",0,0},
		{"parameter_in_range",1,0.95,1.05},
	}
)

































