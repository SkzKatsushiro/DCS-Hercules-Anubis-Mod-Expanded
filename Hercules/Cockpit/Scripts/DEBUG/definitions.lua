dofile(LockOn_Options.common_script_path.."elements_defs.lua")
SetScale(FOV)

DEBUG_DEFAULT_LEVEL = 20

function AddDebugNumber(init_pos, element_params)
	local number           = CreateElement "ceStringPoly"
	number.name            = create_guid_string()
	number.material        = "font_Arial_white"
	number.init_pos        = init_pos
	number.alignment       = "LeftCenter"
	number.stringdefs      = {0.004,0.004, -0.0018, 0}--VerticalSize, HorizontalSize, HorizontalSpacing, VerticalSpacing
	number.formats         = {"%.8f"} 
	number.element_params   = {element_params} 
	number.controllers 	   = {{"text_using_parameter",0,0},}
	number.additive_alpha  = true
	number.collimated     = true
    number.use_mipfilter    = true
	number.additive_alpha   = true
	number.h_clip_relation  = h_clip_relations.COMPARE
	number.level			= DEBUG_DEFAULT_LEVEL
    Add(number)
end

function AddDebugString(init_pos, element_params)
	local String           = CreateElement "ceStringPoly"
	String.name            = create_guid_string()
	String.material        = "font_Arial_white"
	String.init_pos        = init_pos
	String.alignment       = "LeftCenter"
	String.stringdefs      = {0.004,0.004, -0.0018, 0}--VerticalSize, HorizontalSize, HorizontalSpacing, VerticalSpacing
	String.formats         = {"%s"} 
	String.element_params   = {element_params} 
	String.controllers 	   = {{"text_using_parameter",0,0},}
	String.additive_alpha  = true
	String.collimated     = true
    String.use_mipfilter    = true
	String.additive_alpha   = true
	String.h_clip_relation  = h_clip_relations.COMPARE
	String.level			= DEBUG_DEFAULT_LEVEL
    Add(String)
end

function AddClickString(init_pos, Clickstring)
	local String           = CreateElement "ceStringPoly"
	String.name            = create_guid_string()
	String.material        = "font_Arial_cyan"
	String.init_pos        = init_pos
	String.alignment       = "RightCenter"
	String.stringdefs      = {0.004,0.004, -0.0018, 0}--VerticalSize, HorizontalSize, HorizontalSpacing, VerticalSpacing
	String.formats         = {Clickstring} 
	String.element_params   = {""} 
	String.controllers 	   = {{"text_using_parameter",0,0},}
	String.additive_alpha  = true
	String.collimated     = true
    String.use_mipfilter    = true
	String.additive_alpha   = true
	String.h_clip_relation  = h_clip_relations.COMPARE
	String.level			= DEBUG_DEFAULT_LEVEL
    Add(String)
end
-- {"%s\n","%s"}%25s%