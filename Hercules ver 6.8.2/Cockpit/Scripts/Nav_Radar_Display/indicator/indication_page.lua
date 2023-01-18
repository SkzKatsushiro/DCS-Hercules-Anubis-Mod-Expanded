-- {"change_color_when_parameter_equal_to_number", param_nr, number, red, green, blue}
-- {"text_using_parameter", param_nr, format_nr}
-- {"move_left_right_using_parameter", param_nr, gain}
-- {"move_up_down_using_parameter", param_nr, gain}
-- {"opacity_using_parameter", param_nr}
-- {"rotate_using_parameter", param_nr, gain}
-- {"compare_parameters", param1_nr, param2_nr} -- if param1 == param2 then visible
-- {"parameter_in_range", param_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < param < lessthanvalue then visible
-- {"parameter_compare_with_number", param_nr, number} -- if param == number then visible
-- {"draw_argument_in_range", arg_nr, greaterthanvalue, lessthanvalue} -- if greaterthanvalue < arg < lessthanvalue then visible
-- {"line_object_set_point_using_parameters", point_nr, param_x, param_y, gain_x, gain_y} -- applies to ceSimpleLineObject at least


local function make_rectangle_vertices(half_width, half_height)
	return {
		{-half_width,  half_height},
		{ half_width,  half_height},
		{ half_width, -half_height},
		{-half_width, -half_height}
	}
end

dofile(LockOn_Options.script_path.."Nav_Radar_Display/indicator/definitions.lua")


pct_display_fill = 0.90
local width  	   					= 1.0
local height 	   					= width * GetAspect()

local HDG_box = CreateElement "ceTexPoly"
HDG_box.name = "HDG_box"
HDG_box.material = "Nav_Radar_HDG_Box"
HDG_box.vertices = make_rectangle_vertices(0.12,0.12)
HDG_box.indices = default_box_indices
HDG_box.tex_coords = {{0,0.02},{1,0.02},{1,1},{0,1}}
HDG_box.init_pos = {0,1.02}
HDG_box.element_params = {Nav_Radar_brightness_parameter}
HDG_box.controllers = {{"opacity_using_parameter", 0}}
HDG_box.parent_element = Nav_Radar_origin
AddElement(HDG_box)


local Pntr1 = CreateElement "ceTexPoly"
Pntr1.name = "Pntr1"
Pntr1.material = "Nav_Radar_Pntr1"
Pntr1.vertices = make_rectangle_vertices(0.07,0.07)
Pntr1.indices = default_box_indices
Pntr1.tex_coords = {{0,0.02},{1,0.02},{1,1},{0,1}}
Pntr1.init_pos = {0.695,-0.85}
Pntr1.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
Pntr1.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05} }
Pntr1.parent_element = Nav_Radar_origin
AddElement(Pntr1)


local Pntr2 = CreateElement "ceTexPoly"
Pntr2.name = "Pntr2"
Pntr2.material = "Nav_Radar_Pntr2"
Pntr2.vertices = make_rectangle_vertices(0.072,0.072)
Pntr2.indices = default_box_indices
Pntr2.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
Pntr2.init_pos = {0.857,-0.851}
Pntr2.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
Pntr2.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05} }
Pntr2.parent_element = Nav_Radar_origin
AddElement(Pntr2)


-- local maskDim				    = 0.9
-- local compass_elem          	= CreateElement "ceTexPoly"
-- compass_elem.name           	= "Nav_radar_CompassRose"
-- compass_elem.material       	= "NAV_RADAR_COMPASS"
-- compass_elem.vertices       	= make_rectangle_vertices(maskDim, maskDim)
-- compass_elem.indices        	= default_box_indices
-- compass_elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
-- compass_elem.init_pos       = {0, 0}
-- compass_elem.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD"}
-- compass_elem.controllers =  {{"opacity_using_parameter", 0}, {"rotate_using_parameter", 1, 1.0}}
-- compass_elem.parent_element 	= Nav_Radar_origin
-- AddElement(compass_elem)


local txtsize_center = 0.009
local strdefcenter = {txtsize_center, txtsize_center / 4, -txtsize_center /15, 0}
local boxw = 0.05
local boxh = pct_display_fill*0.90

local box_elem          	= CreateElement "ceTexPoly"
box_elem.name           	= "ns_scaff"
box_elem.vertices       	= {{0-boxw, boxh}, {0+boxw, boxh},  {0+boxw, -boxh}, {0-boxw,-boxh}}
box_elem.indices        	= default_box_indices
box_elem.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD"}
box_elem.controllers =  {{"opacity_using_parameter", 0},  {"rotate_using_parameter", 1, 1.0}, }
-- box_elem.parent_element 	= Nav_Radar_origin
AddElement(box_elem)

local indic = {}
local n_indic = CreateElement "ceStringPoly"
n_indic.name = "n_indic"
n_indic.material = NAV_FONT
n_indic.stringdefs = strdefcenter
n_indic.init_pos = {0, boxh, 0}
n_indic.alignment = "CenterCenter"
n_indic.value = "N"
n_indic.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD", Nav_Radar_Display}
n_indic.controllers = {
	{"opacity_using_parameter", 0},
	{"rotate_using_parameter", 1, -1.0},
	{"parameter_in_range",2,0.95,1.05}
}
n_indic.parent_element = "ns_scaff"
AddElement(n_indic)


local s_indic = CreateElement "ceStringPoly"
s_indic.name = "s_indic"
s_indic.material = NAV_FONT
s_indic.stringdefs = strdefcenter
s_indic.init_pos = {0, -boxh, 0}
s_indic.alignment = "CenterCenter"
s_indic.value = "S"
s_indic.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD", Nav_Radar_Display}
s_indic.controllers = {
	{"opacity_using_parameter", 0},
	{"rotate_using_parameter", 1, -1.0},
	{"parameter_in_range",2,0.95,1.05}
}
s_indic.parent_element = "ns_scaff"
AddElement(s_indic)



local box_elem          	= CreateElement "ceTexPoly"
box_elem.name           	= "ew_sacff"
box_elem.vertices       	= {{0-boxw, boxh}, {0+boxw, boxh},  {0+boxw, -boxh}, {0-boxw,-boxh}}
box_elem.indices        	= default_box_indices
box_elem.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD"}
box_elem.init_rot     = {90,0,0}
box_elem.controllers =  {{"opacity_using_parameter", 0},  {"rotate_using_parameter", 1, 1.0}}
--box_elem.parent_element 	= Nav_Radar_origin
AddElement(box_elem)

local n_indic = CreateElement "ceStringPoly"
n_indic.name = "w_indic"
n_indic.material = NAV_FONT
n_indic.stringdefs = strdefcenter
n_indic.init_pos = {0, boxh, 0}
n_indic.alignment = "CenterCenter"
n_indic.value = "W"
n_indic.init_rot = {-90,0,0}
n_indic.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD", Nav_Radar_Display}
n_indic.controllers = {
	{"opacity_using_parameter", 0},
	{"rotate_using_parameter", 1, -1.0},
	{"parameter_in_range",2,0.95,1.05}
}
n_indic.parent_element = "ew_sacff"
AddElement(n_indic)

local n_indic = CreateElement "ceStringPoly"
n_indic.name = "e_indic"
n_indic.material = NAV_FONT
n_indic.stringdefs = strdefcenter
n_indic.init_pos = {0, -boxh, 0}
n_indic.alignment = "CenterCenter"
n_indic.value = "E"
n_indic.init_rot = {270,0,0}
n_indic.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD", Nav_Radar_Display}
n_indic.controllers = {
	{"opacity_using_parameter", 0},
	{"rotate_using_parameter", 1, -1.0},
	{"parameter_in_range",2,0.95,1.05}
}
n_indic.parent_element = "ew_sacff"
AddElement(n_indic)



local num_inidic = {}
num_inidic["03"] = 30
num_inidic["06"] = 60
num_inidic["12"] = 120
num_inidic["15"] = 150
num_inidic["21"] = 210
num_inidic["24"] = 240
num_inidic["30"] = 300
num_inidic["33"] = 330

txtsize_center = 0.0085
strdefcenter = {txtsize_center, txtsize_center / 4, -txtsize_center / 15, 0}
boxh = pct_display_fill*0.90
for e, r in pairs(num_inidic) do

	local box_elem          	= CreateElement "ceTexPoly"
	box_elem.name           	= "num_mark_scaff_"..e
	box_elem.vertices       	= {{0-boxw, boxh}, {0+boxw, boxh},  {0+boxw, -boxh}, {0-boxw,-boxh}}
	box_elem.indices        	= default_box_indices
	box_elem.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD"}
	box_elem.init_rot     = {(360-r),0,0}
	box_elem.controllers =  {{"opacity_using_parameter", 0},
							 {"rotate_using_parameter", 1, 1.0},
							}
	AddElement(box_elem)

	local n_indic = CreateElement "ceStringPoly"
	n_indic.name = "indic_"..e
	n_indic.material = NAV_FONT
	n_indic.stringdefs = strdefcenter
	n_indic.init_pos = {0, boxh, 0}
	n_indic.alignment = "CenterCenter"
	n_indic.value = e
	n_indic.init_rot = {-(360-r),0,0}
	n_indic.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD", Nav_Radar_Display}
	n_indic.controllers = {
		{"opacity_using_parameter", 0},
		{"rotate_using_parameter", 1, -1.0},
		{"parameter_in_range",2,0.95,1.05}
	}
	n_indic.parent_element = box_elem.name
	AddElement(n_indic)
end


-- Outer Ring
local ring_thick = 0.005
local function make_outer_ring(material, opaque)
	local nav_radar_outer_ring = CreateElement "ceMeshPoly"
	nav_radar_outer_ring.name = "Nav_Radar_grid_o"
	nav_radar_outer_ring.primitivetype = "triangles"
	set_circle(nav_radar_outer_ring, pct_display_fill + ring_thick, pct_display_fill - ring_thick, 360, 128)
	nav_radar_outer_ring.material = material
	-- nav_radar_outer_ring.parent_element = Nav_Radar_origin
	nav_radar_outer_ring.element_params = {Nav_Radar_Display, Nav_Radar_brightness_parameter}
	nav_radar_outer_ring.controllers = {{"parameter_in_range",0,0.95,1.05}, not opaque and {"opacity_using_parameter", 1} or nil}
	AddElement(nav_radar_outer_ring)
end

make_outer_ring("black", true)
make_outer_ring(MFCD_GREEN, false)


-- Inner Ring
local function make_inner_ring(material, opaque)
	for n=1,4 do
		local rad_ring = (1/(5))*n
		local segments = 32*n
		local init_min = 0
		local segment_size = 360/segments/2
		local controllers = {{"parameter_in_range",0,0.95,1.05}, not opaque and {"opacity_using_parameter", 1} or nil}
		local params = {Nav_Radar_Display, Nav_Radar_brightness_parameter}
		if n == 3 and material == MFCD_GREEN then
			params =  {Nav_Radar_Display, "RWR_Overlay", Nav_Radar_brightness_parameter}
			controllers = {{"parameter_in_range",0,0.95,1.05},
						   {"change_color_when_parameter_equal_to_number", 1, 0.0, 0.0, 1.0, 0.02, 1.0},
						   {"change_color_when_parameter_equal_to_number", 1, 1.0, 1.0, 0.1, 1.0, 1.0},
						   not opaque and {"opacity_using_parameter", 2} or nil,
						  }
		end

		for i=1, segments do
			local nav_radar_inner_ring = CreateElement "ceMeshPoly"
			nav_radar_inner_ring.name = "Nav_Radar_grid_i_"..i
			nav_radar_inner_ring.primitivetype = "triangles"
			set_circle(nav_radar_inner_ring, (pct_display_fill*rad_ring) + 0.005, (pct_display_fill*rad_ring) - 0.005, segment_size, 64)
			nav_radar_inner_ring.init_rot = {init_min*-1, 0.0, 0.0}
			nav_radar_inner_ring.material = material
			nav_radar_inner_ring.element_params = params
			nav_radar_inner_ring.controllers = controllers
				-- body
			-- nav_radar_inner_ring.parent_element = Nav_Radar_origin
			AddElement(nav_radar_inner_ring)
			init_min = init_min + segment_size * 2
		end
	end
end

make_inner_ring("black", true)
make_inner_ring(MFCD_GREEN, false)


local line_thick = ring_thick *0.75
local pct_line_len = 0.10

local radius = pct_display_fill
local inner_rad = (1-0.05)*radius
local boxw = ring_thick*0.75
local line_len_big = 0.96
local line_len_small = 0.975

local function make_ticks(material, opaque)
	local line_len = line_len_big

	local parameters = {"HEADING_RAD", Nav_Radar_Display, Nav_Radar_brightness_parameter}
	local controllers =  {{"rotate_using_parameter", 0, 1.0}, {"parameter_in_range",1,0.95,1.05}, not opaque and {"opacity_using_parameter", 2} or nil}
	for i=0,36 do
		local ticks_elem          	= CreateElement "ceTexPoly"
		ticks_elem.name           	= "ticks_top_"..i
		ticks_elem.material         = material
		ticks_elem.vertices       	= {{0-boxw, radius}, {0+boxw, radius},  {0+boxw, line_len*radius}, {0-boxw, line_len*radius}}
		ticks_elem.indices        	= default_box_indices
		ticks_elem.init_rot         = {i*5, 0, 0}

		ticks_elem.indices        	= default_box_indices
		ticks_elem.element_params = parameters
		ticks_elem.controllers =  controllers
		AddElement(ticks_elem)

		local ticks_elem          	= CreateElement "ceTexPoly"
		ticks_elem.name           	= "ticks_btm_"..i
		ticks_elem.material         = material
		ticks_elem.vertices       	= {{0-boxw, -radius}, {0+boxw, -radius},  {0+boxw, -line_len*radius}, {0-boxw, -line_len*radius}}
		ticks_elem.indices        	= default_box_indices
		ticks_elem.init_rot         = {i*5, 0, 0}

		ticks_elem.indices        	= default_box_indices
		ticks_elem.element_params = parameters
		ticks_elem.controllers =  controllers

		AddElement(ticks_elem)

		if line_len ==line_len_big then
			line_len = line_len_small
		else
			line_len = line_len_big
		end
	end
end

make_ticks("black", true)
make_ticks(MFCD_GREEN, false)


local box_bug          	= CreateElement "ceTexPoly"
box_bug.name           	= "box_bug"
box_bug.vertices       	= {{0-boxw, boxh}, {0+boxw, boxh},  {0+boxw, -boxh}, {0-boxw,-boxh}}
box_bug.indices        	= default_box_indices
box_bug.element_params = {Nav_Radar_brightness_parameter, "PILOT_Hdg_Set"}
box_bug.init_rot     = {0,0,0}
box_bug.controllers =  {{"opacity_using_parameter", 0},  {"rotate_using_parameter", 1, -0.0174533}}
box_bug.parent_element = "ew_sacff"
AddElement(box_bug)


local hdg_bug = CreateElement "ceTexPoly"
hdg_bug.name = "hdg_bug"
hdg_bug.material = "Nav_Radar_HDG_Bug"
hdg_bug.vertices = make_rectangle_vertices(0.045,0.025)
hdg_bug.indices = default_box_indices
hdg_bug.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
hdg_bug.init_pos = {0.92,0}
hdg_bug.init_rot = {-90,0}
hdg_bug.element_params = {Nav_Radar_brightness_parameter, "PILOT_Hdg_Set", Nav_Radar_Display}
hdg_bug.controllers =  {{"opacity_using_parameter", 0}, {"rotate_using_parameter", 1, 0}, {"parameter_in_range",2,0.95,1.05}}
hdg_bug.parent_element = "box_bug"
AddElement(hdg_bug)


local box_drift          	= CreateElement "ceTexPoly"
box_drift.name           	= "box_drift"
box_drift.vertices       	= {{0-boxw, boxh}, {0+boxw, boxh},  {0+boxw, -boxh}, {0-boxw,-boxh}}
box_drift.indices        	= default_box_indices
box_drift.element_params = {Nav_Radar_brightness_parameter, "HEADING_RAD", "DRIFT_MARKER"}
box_drift.init_rot     = {0,0,0}
box_drift.controllers =  {{"opacity_using_parameter", 0},  {"rotate_using_parameter", 1, -1},  {"rotate_using_parameter", 2, -1}}
box_drift.parent_element = "ew_sacff"
AddElement(box_drift)


local drift_marker = CreateElement "ceTexPoly"
drift_marker.name = "drift_marker"
drift_marker.material = "Nav_Radar_Drift_Cross"
drift_marker.vertices = make_rectangle_vertices(0.026,0.026)
drift_marker.indices = default_box_indices
drift_marker.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
drift_marker.init_pos = {0.932,0}
drift_marker.init_rot = {-90,0}
drift_marker.element_params = {Nav_Radar_brightness_parameter, "PILOT_Hdg_Set", Nav_Radar_Display}
drift_marker.controllers =  {{"opacity_using_parameter", 0}, {"rotate_using_parameter", 1, 0}, {"parameter_in_range",2,0.95,1.05}}
drift_marker.parent_element = "box_drift"
AddElement(drift_marker)


local txtsize_center = 0.0065
local strdefcenter = {txtsize_center, txtsize_center / 4, -txtsize_center / 15, 1}
local gs_indic = CreateElement "ceStringPoly"
gs_indic.name = "gs_indic"
gs_indic.material = NAV_FONT_WHITE
gs_indic.stringdefs = strdefcenter
gs_indic.alignment = "LeftCenter"
gs_indic.init_pos = {-0.75, 0.97, 0}
gs_indic.formats = {"%03.0f"}
gs_indic.element_params = {Nav_Radar_brightness_parameter, "GS"}
gs_indic.controllers = {
	{"opacity_using_parameter", 0},
	{"text_using_parameter", 1}
}
gs_indic.parent_element = Nav_Radar_origin
AddElement(gs_indic)

local gs_indic_lab = CreateElement "ceStringPoly"
gs_indic_lab.name = "gs_indic_lab"
gs_indic_lab.material = NAV_FONT
gs_indic_lab.value = "GS"
gs_indic_lab.stringdefs = strdefcenter
gs_indic_lab.alignment = "LeftCenter"
gs_indic_lab.init_pos = {-0.95, 0.97, 0}
gs_indic_lab.element_params = {Nav_Radar_brightness_parameter}
gs_indic_lab.controllers = {
	{"opacity_using_parameter", 0}
}
gs_indic_lab.parent_element = Nav_Radar_origin
AddElement(gs_indic_lab)


local tgs_wpt = CreateElement "ceStringPoly"
tgs_wpt.name = "tgs_wpt"
tgs_wpt.material = NAV_FONT_CYAN
tgs_wpt.init_pos = {-0.6, 1.04, 0}
tgs_wpt.alignment = "LeftCenter"
tgs_wpt.stringdefs = strdefcenter
tgs_wpt.formats = {"%s"}
tgs_wpt.element_params = {Nav_Radar_brightness_parameter, "TGS_WPT"}
tgs_wpt.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
tgs_wpt.parent_element = Nav_Radar_origin
AddElement(tgs_wpt)


local tgs_indic = CreateElement "ceStringPoly"
tgs_indic.name = "tgs_indic"
tgs_indic.material = NAV_FONT_WHITE
tgs_indic.stringdefs = strdefcenter
tgs_indic.alignment = "LeftCenter"
tgs_indic.init_pos = {-0.75, 1.04, 0}
tgs_indic.formats = {"%s"}
tgs_indic.element_params = {Nav_Radar_brightness_parameter, "TGS_INDC"}
tgs_indic.controllers = {
	{"opacity_using_parameter", 0}, {"text_using_parameter", 1}
}
tgs_indic.parent_element = Nav_Radar_origin
AddElement(tgs_indic)

local tgs_indic_lab = CreateElement "ceStringPoly"
tgs_indic_lab.name = "tgs_indic_lab"
tgs_indic_lab.material = NAV_FONT
tgs_indic_lab.value = "TGS"
tgs_indic_lab.stringdefs = strdefcenter
tgs_indic_lab.alignment = "LeftCenter"
tgs_indic_lab.init_pos = {-0.95, 1.04, 0}
tgs_indic_lab.element_params = {Nav_Radar_brightness_parameter}
tgs_indic_lab.controllers = {
	{"opacity_using_parameter", 0}
}
tgs_indic_lab.parent_element = Nav_Radar_origin
AddElement(tgs_indic_lab)


local ttg_indic = CreateElement "ceStringPoly"
ttg_indic.name = "ttg_indic"
ttg_indic.material = NAV_FONT_WHITE
ttg_indic.init_pos = {-0.715, 1.11, 0}
ttg_indic.alignment = "LeftCenter"
ttg_indic.stringdefs = strdefcenter
ttg_indic.formats = {"%s"}
ttg_indic.element_params = {Nav_Radar_brightness_parameter, "TTG"}
ttg_indic.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
ttg_indic.parent_element = Nav_Radar_origin
AddElement(ttg_indic)



local ttg_indic_lab = CreateElement "ceStringPoly"
ttg_indic_lab.name = "ttg_indic_lab"
ttg_indic_lab.material = NAV_FONT
ttg_indic_lab.value = "TTG"
ttg_indic_lab.stringdefs = strdefcenter
ttg_indic_lab.alignment = "LeftCenter"
ttg_indic_lab.init_pos = {-0.95, 1.11, 0}
ttg_indic_lab.element_params = {Nav_Radar_brightness_parameter}
ttg_indic_lab.controllers = {
	{"opacity_using_parameter", 0}
}
ttg_indic_lab.parent_element = Nav_Radar_origin
AddElement(ttg_indic_lab)


local eta_indic = CreateElement "ceStringPoly"
eta_indic.name = "eta_indic"
eta_indic.material = NAV_FONT_WHITE
eta_indic.init_pos = {-0.75, 1.18, 0}
eta_indic.alignment = "LeftCenter"
eta_indic.stringdefs = strdefcenter
eta_indic.formats = {"%s"}
eta_indic.element_params = {Nav_Radar_brightness_parameter, "ETA"}
eta_indic.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
eta_indic.parent_element = Nav_Radar_origin
AddElement(eta_indic)


local eta_indic_lab = CreateElement "ceStringPoly"
eta_indic_lab.name = "eta_indic_lab"
eta_indic_lab.material = NAV_FONT
eta_indic_lab.value = "ETA"
eta_indic_lab.stringdefs = strdefcenter
eta_indic_lab.alignment = "LeftCenter"
eta_indic_lab.init_pos = {-0.95, 1.18, 0}
eta_indic_lab.element_params = {Nav_Radar_brightness_parameter}
eta_indic_lab.controllers = {
	{"opacity_using_parameter", 0}
}
eta_indic_lab.parent_element = Nav_Radar_origin
AddElement(eta_indic_lab)


local waypoint_rel = CreateElement "ceStringPoly"
waypoint_rel.name = "waypoint_rel"
waypoint_rel.material = NAV_FONT_WHITE
waypoint_rel.init_pos = {-0.672, 1.25, 0}
waypoint_rel.alignment = "LeftCenter"
waypoint_rel.stringdefs = strdefcenter
waypoint_rel.formats = {"%s"}
waypoint_rel.element_params = {Nav_Radar_brightness_parameter, "WPT_REL"}
waypoint_rel.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
waypoint_rel.parent_element = Nav_Radar_origin
AddElement(waypoint_rel)


local waypoint_lab = CreateElement "ceStringPoly"
waypoint_lab.name = "waypoint_lab"
waypoint_lab.material = NAV_FONT
waypoint_lab.init_pos = {-0.95, 1.25, 0}
waypoint_lab.alignment = "LeftCenter"
waypoint_lab.stringdefs = strdefcenter
waypoint_lab.formats = {"%s"}
waypoint_lab.element_params = {Nav_Radar_brightness_parameter, "CURRENT_WP_NAME"}
waypoint_lab.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
waypoint_lab.parent_element = Nav_Radar_origin
AddElement(waypoint_lab)


local xtk_lab = CreateElement "ceStringPoly"
xtk_lab.name = "xtk"
xtk_lab.material = NAV_FONT
xtk_lab.stringdefs = strdefcenter
xtk_lab.alignment = "CenterCenter"
xtk_lab.init_pos = {-0.158, 1.21, 0}
xtk_lab.value = "XTK"
xtk_lab.element_params = {Nav_Radar_brightness_parameter}
xtk_lab.controllers = {
	{"opacity_using_parameter", 0},
}
xtk_lab.parent_element = Nav_Radar_origin
AddElement(xtk_lab)


local xtk_ind = CreateElement "ceStringPoly"
xtk_ind.name = "xtk_ind"
xtk_ind.material = NAV_FONT_WHITE
xtk_ind.stringdefs = strdefcenter
xtk_ind.alignment = "CenterCenter"
xtk_ind.init_pos = {-0.035, 1.21, 0}
xtk_ind.formats = {"%s"}
xtk_ind.element_params = {Nav_Radar_brightness_parameter, "XTK_LR"}
xtk_ind.controllers = {
	{"opacity_using_parameter", 0},
	{"text_using_parameter", 1}
}
xtk_ind.parent_element = Nav_Radar_origin
AddElement(xtk_ind)


local xtk_val = CreateElement "ceStringPoly"
xtk_val.name = "xtk_val"
xtk_val.material = NAV_FONT_WHITE
xtk_val.init_pos = {0.035, 1.21, 0}
xtk_val.alignment = "LeftCenter"
xtk_val.stringdefs = strdefcenter
xtk_val.formats = {"%s"}
xtk_val.element_params = {Nav_Radar_brightness_parameter, "XTK_VAL_DISP"}
xtk_val.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
xtk_val.parent_element = Nav_Radar_origin
AddElement(xtk_val)




local xtk_yards = CreateElement "ceStringPoly"
xtk_yards.name = "xtk_yards"
xtk_yards.material = NAV_FONT
xtk_yards.stringdefs = strdefcenter
xtk_yards.alignment = "LeftCenter"
xtk_yards.init_pos = {0.225, 1.21, 0}
xtk_yards.value = "YDS"
xtk_yards.element_params = {Nav_Radar_brightness_parameter, "XTK_YARDS"}
xtk_yards.controllers = {
	{"opacity_using_parameter", 0},{"parameter_in_range",1,0.95,1.05}
}
xtk_yards.parent_element = Nav_Radar_origin
AddElement(xtk_yards)



local gmt_indic = CreateElement "ceStringPoly"
gmt_indic.name = "gmt_indic"
gmt_indic.material = NAV_FONT_WHITE
gmt_indic.stringdefs = strdefcenter
gmt_indic.alignment = "RightCenter"
gmt_indic.init_pos = {0.93, 1.21, 0}
gmt_indic.formats = {"%s"}
gmt_indic.element_params = {Nav_Radar_brightness_parameter, "GMT_TIME"}
gmt_indic.controllers = {
	{"opacity_using_parameter", 0},
	{"text_using_parameter", 1},
}
gmt_indic.parent_element = Nav_Radar_origin
AddElement(gmt_indic)

if HDD_number == 1 or HDD_number == 2 then
	local pilot_stopwatch_indc = CreateElement "ceStringPoly"
	pilot_stopwatch_indc.name = "pilot_stopwatch_indc"
	pilot_stopwatch_indc.material = NAV_FONT_WHITE
	pilot_stopwatch_indc.stringdefs = strdefcenter
	pilot_stopwatch_indc.alignment = "RightCenter"
	pilot_stopwatch_indc.init_pos = {0.93, 1.14, 0}
	pilot_stopwatch_indc.formats = {"%s"}
	pilot_stopwatch_indc.element_params = {Nav_Radar_brightness_parameter, "PILOT_STOPWATCH_TIME", "PILOT_StopWatchOnOff"}
	pilot_stopwatch_indc.controllers = {
		{"opacity_using_parameter", 0},
		{"text_using_parameter", 1},
		{"parameter_in_range",2,0.5,4},
	}
	pilot_stopwatch_indc.parent_element = Nav_Radar_origin
	AddElement(pilot_stopwatch_indc)

	local pilot_hack_lab = CreateElement "ceStringPoly"
	pilot_hack_lab.name = "pilot_hack_lab"
	pilot_hack_lab.material = NAV_FONT
	pilot_hack_lab.stringdefs = strdefcenter
	pilot_hack_lab.alignment = "LeftCenter"
	pilot_hack_lab.init_pos = {0.492, 1.14, 0}
	pilot_hack_lab.value = "HACK"
	pilot_hack_lab.element_params = {Nav_Radar_brightness_parameter, "PILOT_StopWatchOnOff"}
	pilot_hack_lab.controllers = {
		{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05},

	}
	pilot_hack_lab.parent_element = Nav_Radar_origin
	AddElement(pilot_hack_lab)
end

if HDD_number == 3 or HDD_number == 4 then
	local copilot_stopwatch_indc = CreateElement "ceStringPoly"
	copilot_stopwatch_indc.name = "copilot_stopwatch_indc"
	copilot_stopwatch_indc.material = NAV_FONT_WHITE
	copilot_stopwatch_indc.stringdefs = strdefcenter
	copilot_stopwatch_indc.alignment = "RightCenter"
	copilot_stopwatch_indc.init_pos = {0.93, 1.14, 0}
	copilot_stopwatch_indc.formats = {"%s"}
	copilot_stopwatch_indc.element_params = {Nav_Radar_brightness_parameter, "COPILOT_STOPWATCH_TIME", "COPILOT_StopWatchOnOff"}
	copilot_stopwatch_indc.controllers = {
		{"opacity_using_parameter", 0},
		{"text_using_parameter", 1},
		{"parameter_in_range",2,0.5,4},
	}
	copilot_stopwatch_indc.parent_element = Nav_Radar_origin
	AddElement(copilot_stopwatch_indc)

	local copilot_hack_lab = CreateElement "ceStringPoly"
	copilot_hack_lab.name = "copilot_hack_lab"
	copilot_hack_lab.material = NAV_FONT
	copilot_hack_lab.stringdefs = strdefcenter
	copilot_hack_lab.alignment = "LeftCenter"
	copilot_hack_lab.init_pos = {0.492, 1.14, 0}
	copilot_hack_lab.value = "HACK"
	copilot_hack_lab.element_params = {Nav_Radar_brightness_parameter, "COPILOT_StopWatchOnOff"}
	copilot_hack_lab.controllers = {
		{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05},

	}
	copilot_hack_lab.parent_element = Nav_Radar_origin
	AddElement(copilot_hack_lab)
end





local tot_indic = CreateElement "ceStringPoly"
tot_indic.name = "tot_indic"
tot_indic.material = NAV_FONT_WHITE
tot_indic.stringdefs = strdefcenter
tot_indic.alignment = "RightCenter"
tot_indic.init_pos = {0.93, 1.07, 0}
tot_indic.formats = {"%s"}
tot_indic.element_params = {Nav_Radar_brightness_parameter, "TOT_TIME", "TOT_ACTIVE"}
tot_indic.controllers = {
	{"opacity_using_parameter", 0}, {"text_using_parameter", 1}, {"parameter_in_range", 2, 0.95, 1.05}

}
tot_indic.parent_element = Nav_Radar_origin
AddElement(tot_indic)

local tot_indic_lab = CreateElement "ceStringPoly"
tot_indic_lab.name = "tot_indic_lab"
tot_indic_lab.material = NAV_FONT
tot_indic_lab.value = "TOT"
tot_indic_lab.stringdefs = strdefcenter
tot_indic_lab.alignment = "CenterCenter"
tot_indic_lab.init_pos = {0.55, 1.07, 0}
tot_indic_lab.element_params = {Nav_Radar_brightness_parameter, "TOT_ACTIVE"}
tot_indic_lab.controllers = {
	{"opacity_using_parameter", 0}, {"parameter_in_range", 1, 0.95, 1.05}
}
tot_indic_lab.parent_element = Nav_Radar_origin
AddElement(tot_indic_lab)



local txtsize_center = 0.01
local strdefcenter = {txtsize_center, txtsize_center / 4.5, -txtsize_center / 36, 1}

local heading_txt = CreateElement "ceStringPoly"
heading_txt.name = "nav_rad_heading_txt"
heading_txt.material = NAV_FONT_WHITE
heading_txt.init_pos = {0, 1.01, 0}
heading_txt.init_rot = {0, 0, 0}
heading_txt.stringdefs = strdefcenter
heading_txt.alignment = "CenterCenter"
heading_txt.formats = {"%03.0f"}
heading_txt.element_params = {Nav_Radar_brightness_parameter, "HEADING_DEG"}
heading_txt.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1,0 }}
heading_txt.parent_element = Nav_Radar_origin
AddElement(heading_txt)



local txtsize_center = 0.005
local strdefcenter = {txtsize_center, txtsize_center / 4, -txtsize_center / 35, 1}

----------Range Value Clip Boxes
local boxh = 0.05
for n=1,4 do -- <=3
	local y = 2.5
	local boxw = 0.03*y

	local rng_val_clip = CreateElement "ceMeshPoly"
	rng_val_clip.name = "rng_val_clip"
	rng_val_clip.primitivetype = "triangles"
	rng_val_clip.vertices = {{0,0},{boxw,0},{boxw,boxh},{0,boxh}}
	rng_val_clip.indices = default_box_indices
	rng_val_clip.init_pos = {-0.1272*n-boxw/2, 0.1272*n-boxh/2+0.002, 0}
	rng_val_clip.material = MakeMaterial(nil,{1,1,1,255})
	rng_val_clip.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "NAV_RADAR_RANGE"}
	rng_val_clip.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"parameter_in_range",2,0,3.5}}
	AddElement(rng_val_clip)
end
for n=1,4 do -- <=10
	local y = 1.0
	local boxw = 0.03*y

	local rng_val_clip = CreateElement "ceMeshPoly"
	rng_val_clip.name = "rng_val_clip"
	rng_val_clip.primitivetype = "triangles"
	rng_val_clip.vertices = {{0,0},{boxw,0},{boxw,boxh},{0,boxh}}
	rng_val_clip.indices = default_box_indices
	rng_val_clip.init_pos = {-0.1272*n-boxw/2, 0.1272*n-boxh/2+0.002, 0}
	rng_val_clip.material = MakeMaterial(nil,{1,1,1,255})
	rng_val_clip.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "NAV_RADAR_RANGE"}
	rng_val_clip.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"parameter_in_range",2,3.5,10.5}}
	AddElement(rng_val_clip)
end
for n=1,4 do -- ==20
	local nav_radar_range = 20
	local y = 1.0
	if nav_radar_range <= 3 then y= 2.5
		elseif nav_radar_range*0.2*n >= 10 then y=2.0
		else y=1.0
	end
	local boxw = 0.03*y

	local rng_val_clip = CreateElement "ceMeshPoly"
	rng_val_clip.name = "rng_val_clip"
	rng_val_clip.primitivetype = "triangles"
	rng_val_clip.vertices = {{0,0},{boxw,0},{boxw,boxh},{0,boxh}}
	rng_val_clip.indices = default_box_indices
	rng_val_clip.init_pos = {-0.1272*n-boxw/2, 0.1272*n-boxh/2+0.002, 0}
	rng_val_clip.material = MakeMaterial(nil,{1,1,1,255})
	rng_val_clip.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "NAV_RADAR_RANGE"}
	rng_val_clip.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"parameter_in_range",2,19.5,20.5}}
	AddElement(rng_val_clip)
end
for n=1,4 do -- ==40
	local nav_radar_range = 40
	local y = 1.0
	if nav_radar_range <= 3 then y= 2.5
		elseif nav_radar_range*0.2*n >= 10 then y=2.0
		else y=1.0
	end
	local boxw = 0.03*y

	local rng_val_clip = CreateElement "ceMeshPoly"
	rng_val_clip.name = "rng_val_clip"
	rng_val_clip.primitivetype = "triangles"
	rng_val_clip.vertices = {{0,0},{boxw,0},{boxw,boxh},{0,boxh}}
	rng_val_clip.indices = default_box_indices
	rng_val_clip.init_pos = {-0.1272*n-boxw/2, 0.1272*n-boxh/2+0.002, 0}
	rng_val_clip.material = MakeMaterial(nil,{1,1,1,255})
	rng_val_clip.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "NAV_RADAR_RANGE"}
	rng_val_clip.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"parameter_in_range",2,39.5,40.5}}
	AddElement(rng_val_clip)
end
for n=1,4 do -- ==80
	local nav_radar_range = 80
	local y = 1.0
	if nav_radar_range <= 3 then y= 2.5
		elseif nav_radar_range*0.2*n >= 10 then y=2.0
		else y=1.0
	end
	local boxw = 0.03*y

	local rng_val_clip = CreateElement "ceMeshPoly"
	rng_val_clip.name = "rng_val_clip"
	rng_val_clip.primitivetype = "triangles"
	rng_val_clip.vertices = {{0,0},{boxw,0},{boxw,boxh},{0,boxh}}
	rng_val_clip.indices = default_box_indices
	rng_val_clip.init_pos = {-0.1272*n-boxw/2, 0.1272*n-boxh/2+0.002, 0}
	rng_val_clip.material = MakeMaterial(nil,{1,1,1,255})
	rng_val_clip.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "NAV_RADAR_RANGE"}
	rng_val_clip.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"parameter_in_range",2,79.5,80.5}}
	AddElement(rng_val_clip)
end
for n=1,4 do -- ==160
	local nav_radar_range = 160
	local y = 1.0
	if nav_radar_range <= 3 then y= 2.5
		elseif nav_radar_range*0.2*n >= 100 then y=3.0
		elseif nav_radar_range*0.2*n >= 10 then y=2.0
		else y=1.0
	end
	local boxw = 0.03*y

	local rng_val_clip = CreateElement "ceMeshPoly"
	rng_val_clip.name = "rng_val_clip"
	rng_val_clip.primitivetype = "triangles"
	rng_val_clip.vertices = {{0,0},{boxw,0},{boxw,boxh},{0,boxh}}
	rng_val_clip.indices = default_box_indices
	rng_val_clip.init_pos = {-0.1272*n-boxw/2, 0.1272*n-boxh/2+0.002, 0}
	rng_val_clip.material = MakeMaterial(nil,{1,1,1,255})
	rng_val_clip.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "NAV_RADAR_RANGE"}
	rng_val_clip.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"parameter_in_range",2,159.5,160.5}}
	AddElement(rng_val_clip)
end
for n=1,4 do -- ===320
	local nav_radar_range = 320
	local y = 1.0
	if nav_radar_range <= 3 then y= 2.5
		elseif nav_radar_range*0.2*n >= 100 then y=3.0
		elseif nav_radar_range*0.2*n >= 10 then y=2.0
		else y=1.0
	end
	local boxw = 0.03*y

	local rng_val_clip = CreateElement "ceMeshPoly"
	rng_val_clip.name = "rng_val_clip"
	rng_val_clip.primitivetype = "triangles"
	rng_val_clip.vertices = {{0,0},{boxw,0},{boxw,boxh},{0,boxh}}
	rng_val_clip.indices = default_box_indices
	rng_val_clip.init_pos = {-0.1272*n-boxw/2, 0.1272*n-boxh/2+0.002, 0}
	rng_val_clip.material = MakeMaterial(nil,{1,1,1,255})
	rng_val_clip.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "NAV_RADAR_RANGE"}
	rng_val_clip.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"parameter_in_range",2,319.5,320.5}}
	AddElement(rng_val_clip)
end
----------



-- Range Values
for n=1,4 do

	local rng_val = CreateElement "ceStringPoly"
	rng_val.name = "rng_val_"..n
	rng_val.material = NAV_FONT
	rng_val.init_pos = {-0.1272*n, 0.1272*n, 0}
	rng_val.init_rot = {0, 0, 0}
	rng_val.stringdefs = strdefcenter
	rng_val.alignment = "CenterCenter"
	rng_val.formats = {"%g"}
	rng_val.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display, "RANGE_RING_"..n.."_VAL"}
	rng_val.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}, {"text_using_parameter", 2}}
	-- rng_val.parent_element = Nav_Radar_origin
	AddElement(rng_val)

end


local agl_label = CreateElement "ceStringPoly"
agl_label.name = "agl_label"
agl_label.material = NAV_FONT
agl_label.init_pos = {0.44, -1.1, 0}
agl_label.init_rot = {0, 0, 0}
agl_label.stringdefs = strdefcenter
agl_label.alignment = "CenterCenter"
agl_label.value = "AGL"
agl_label.element_params = {Nav_Radar_brightness_parameter}
agl_label.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05} }
agl_label.parent_element = Nav_Radar_origin
AddElement(agl_label)

local agl_indic = CreateElement "ceStringPoly"
agl_indic.name = "agl_indic"
agl_indic.material = NAV_FONT_WHITE
agl_indic.init_pos = {0.53, -1.18, 0}
agl_indic.init_rot = {0, 0, 0}
agl_indic.stringdefs = strdefcenter
agl_indic.alignment = "RightCenter"
agl_indic.formats = {"%.0f"}
agl_indic.element_params = {Nav_Radar_brightness_parameter, "NAV_RADAR_AGL"}
agl_indic.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
agl_indic.parent_element = Nav_Radar_origin
AddElement(agl_indic)

local rng_label = CreateElement "ceStringPoly"
rng_label.name = "rng_label"
rng_label.material = NAV_FONT
rng_label.init_pos = {-0.54, -1.1, 0}
rng_label.init_rot = {0, 0, 0}
rng_label.stringdefs = strdefcenter
rng_label.alignment = "CenterCenter"
rng_label.value = "RNG"
rng_label.element_params = {Nav_Radar_brightness_parameter}
rng_label.controllers = {{"opacity_using_parameter", 0}}
rng_label.parent_element = Nav_Radar_origin
AddElement(rng_label)

local rng_indic = CreateElement "ceStringPoly"
rng_indic.name = "rng_indic"
rng_indic.material = NAV_FONT_WHITE
rng_indic.init_pos = {-0.49, -1.18, 0}
rng_indic.init_rot = {0, 0, 0}
rng_indic.stringdefs = strdefcenter
rng_indic.alignment = "RightCenter"
rng_indic.formats = {"%g"}
rng_indic.element_params = {Nav_Radar_brightness_parameter, "NAV_RADAR_RANGE"}
rng_indic.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
rng_indic.parent_element = Nav_Radar_origin
AddElement(rng_indic)


local tcas_label = CreateElement "ceStringPoly" --TCAS not functional in-mod, "TCAS STBY" is what it would show if off
tcas_label.name = "tcas_label"
tcas_label.material = NAV_FONT
tcas_label.init_pos = {-0.61, -1.02, 0}
tcas_label.init_rot = {0, 0, 0}
tcas_label.stringdefs = strdefcenter
tcas_label.alignment = "LeftCenter"
tcas_label.value = "TCAS STBY"
tcas_label.element_params = {Nav_Radar_brightness_parameter}
tcas_label.controllers = {{"opacity_using_parameter", 0}}
tcas_label.parent_element = Nav_Radar_origin
AddElement(tcas_label)

------Pointer 1 Frequency------
local pntr1_tune = CreateElement "ceStringPoly"
pntr1_tune.name = "pntr1_tune"
pntr1_tune.material = NAV_FONT_WHITE
pntr1_tune.init_pos = {0.653, -1.1, 0}
pntr1_tune.init_rot = {0, 0, 0}
pntr1_tune.stringdefs = strdefcenter
pntr1_tune.alignment = "CenterCenter"
pntr1_tune.value = "" -- blank for now as there is no Pointer 1 tune
pntr1_tune.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr1_tune.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr1_tune.parent_element = Nav_Radar_origin
AddElement(pntr1_tune)

------Pointer 1 Range------
local pntr1_dist = CreateElement "ceStringPoly"
pntr1_dist.name = "pntr1_dist"
pntr1_dist.material = NAV_FONT_WHITE
pntr1_dist.init_pos = {0.653, -1.18, 0}
pntr1_dist.init_rot = {0, 0, 0}
pntr1_dist.stringdefs = strdefcenter
pntr1_dist.alignment = "CenterCenter"
pntr1_dist.value = "XXXXX"
pntr1_dist.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr1_dist.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr1_dist.parent_element = Nav_Radar_origin
AddElement(pntr1_dist)

------Pointer 1 Bearing------
local pntr1_bng = CreateElement "ceStringPoly"
pntr1_bng.name = "pntr1_bng"
pntr1_bng.material = NAV_FONT_WHITE
pntr1_bng.init_pos = {0.695, -0.75, 0}
pntr1_bng.init_rot = {0, 0, 0}
pntr1_bng.stringdefs = strdefcenter
pntr1_bng.alignment = "CenterCenter"
pntr1_bng.value = "XXX"
pntr1_bng.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr1_bng.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr1_bng.parent_element = Nav_Radar_origin
AddElement(pntr1_bng)

------Pointer 1 Source------
local pntr1_src = CreateElement "ceStringPoly"
pntr1_src.name = "pntr1_src"
pntr1_src.material = NAV_FONT_WHITE
pntr1_src.init_pos = {0.695, -0.95, 0}
pntr1_src.init_rot = {0, 0, 0}
pntr1_src.stringdefs = strdefcenter
pntr1_src.alignment = "CenterCenter"
pntr1_src.value = "T1"
pntr1_src.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr1_src.controllers ={{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr1_src.parent_element = Nav_Radar_origin
AddElement(pntr1_src)

------Pointer 1 Identifier------
local pntr1_ident = CreateElement "ceStringPoly"
pntr1_ident.name = "pntr1_ident"
pntr1_ident.material = NAV_FONT_WHITE
pntr1_ident.init_pos = {0.695, -1.0, 0}
pntr1_ident.init_rot = {0, 0, 0}
pntr1_ident.stringdefs = strdefcenter
pntr1_ident.alignment = "CenterCenter"
pntr1_ident.value = "-----"
pntr1_ident.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr1_ident.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr1_ident.parent_element = Nav_Radar_origin
AddElement(pntr1_ident)

------Pointer 2 Frequency------
local pntr2_tune = CreateElement "ceStringPoly"
pntr2_tune.name = "pntr2_tune"
pntr2_tune.material = NAV_FONT_WHITE
pntr2_tune.init_pos = {0.848, -1.1, 0}
pntr2_tune.init_rot = {0, 0, 0}
pntr2_tune.stringdefs = strdefcenter
pntr2_tune.alignment = "CenterCenter"
pntr2_tune.value = "" -- blank for now as there is no Pointer 2 tune
pntr2_tune.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr2_tune.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr2_tune.parent_element = Nav_Radar_origin
AddElement(pntr2_tune)

------Pointer 2 Range------
local pntr2_dist = CreateElement "ceStringPoly"
pntr2_dist.name = "pntr2_dist"
pntr2_dist.material = NAV_FONT_WHITE
pntr2_dist.init_pos = {0.848, -1.18, 0}
pntr2_dist.init_rot = {0, 0, 0}
pntr2_dist.stringdefs = strdefcenter
pntr2_dist.alignment = "CenterCenter"
pntr2_dist.value = "XXXXX"
pntr2_dist.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr2_dist.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr2_dist.parent_element = Nav_Radar_origin
AddElement(pntr2_dist)

------Pointer 2 Bearing------
local pntr2_bng = CreateElement "ceStringPoly"
pntr2_bng.name = "pntr2_bng"
pntr2_bng.material = NAV_FONT_WHITE
pntr2_bng.init_pos = {0.857, -0.75, 0}
pntr2_bng.init_rot = {0, 0, 0}
pntr2_bng.stringdefs = strdefcenter
pntr2_bng.alignment = "CenterCenter"
pntr2_bng.value = "XXX"
pntr2_bng.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr2_bng.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr2_bng.parent_element = Nav_Radar_origin
AddElement(pntr2_bng)

------Pointer 2 Source------
local pntr2_src = CreateElement "ceStringPoly"
pntr2_src.name = "pntr2_src"
pntr2_src.material = NAV_FONT_WHITE
pntr2_src.init_pos = {0.857, -0.95, 0}
pntr2_src.init_rot = {0, 0, 0}
pntr2_src.stringdefs = strdefcenter
pntr2_src.alignment = "CenterCenter"
pntr2_src.value = "V1"
pntr2_src.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr2_src.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr2_src.parent_element = Nav_Radar_origin
AddElement(pntr2_src)

------Pointer 2 Identifier------
local pntr2_ident = CreateElement "ceStringPoly"
pntr2_ident.name = "pntr2_ident"
pntr2_ident.material = NAV_FONT_WHITE
pntr2_ident.init_pos = {0.857, -1.0, 0}
pntr2_ident.init_rot = {0, 0, 0}
pntr2_ident.stringdefs = strdefcenter
pntr2_ident.alignment = "CenterCenter"
pntr2_ident.value = "-----"
pntr2_ident.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
pntr2_ident.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
-- pntr2_ident.parent_element = Nav_Radar_origin
AddElement(pntr2_ident)

local breaks = {}
breaks[1] = -0.61
breaks[2] = -0.47
breaks[3] = -0.33
breaks[4] =  0.33
breaks[5] =  0.40
breaks[5] =  0.55
breaks[6] =  0.75

local boxw = 0.0025
local line_len = 0.15

for i, p in pairs(breaks) do
	local ticks_elem          	= CreateElement "ceTexPoly"
	ticks_elem.name           	= "break_lines_"..i
	ticks_elem.material         = MFCD_GREEN
	ticks_elem.vertices       	= {{0-boxw, 0}, {0+boxw, 0},  {0+boxw, line_len}, {0-boxw, line_len}}
	ticks_elem.indices        	= default_box_indices
	ticks_elem.init_pos         = {p, -1.22, 0}
	ticks_elem.indices        	= default_box_indices
	ticks_elem.element_params = {Nav_Radar_brightness_parameter, Nav_Radar_Display}
	ticks_elem.controllers =  {{"opacity_using_parameter", 0}, {"parameter_in_range",1,0.95,1.05}}
	-- ticks_elem.parent_element 	= Nav_Radar_origin
	AddElement(ticks_elem)
end

------Wind Arrow------
local wind_arrow_line            = CreateElement "ceSimpleLineObject"
wind_arrow_line.name             = "wind_arrow_line"
wind_arrow_line.primitivetype    = "lines"
wind_arrow_line.width            = 1
wind_arrow_line.material           = CURSOR_TARGET_MAT_SOFT
wind_arrow_line.vertices          = {{0,0}, {0,0.3}, {0,0.6}
}
wind_arrow_line.init_pos = {-0.78,-0.825}
wind_arrow_line.element_params     = {Nav_Radar_brightness_parameter, "WIND_END_X", "WIND_END_Y", "WIND_POINT_X", "WIND_POINT_Y", "WIND_HEIGHT_X", "WIND_HEIGHT_Y", "WIND_KNTS"}
wind_arrow_line.controllers         = {{"opacity_using_parameter", 0},  {"line_object_set_point_using_parameters", 0, 5, 6, 0.006, 0.006},
	{"line_object_set_point_using_parameters", 1, 1, 2, 0.006, 0.006},
	{"line_object_set_point_using_parameters", 2, 3, 4, 0.006, 0.006},
	{"line_object_set_point_using_parameters", 3, 5, 6, 0.006, 0.006},
	{"parameter_in_range", 7, 0, 999}}
wind_arrow_line.h_clip_relation    = h_clip_relations.COMPARE
wind_arrow_line.collimated      = false
wind_arrow_line.isvisible       = true
wind_arrow_line.use_mipfilter   = true
wind_arrow_line.additive_alpha  = true
wind_arrow_line.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
wind_arrow_line.parent_element = Nav_Radar_origin
AddElement(wind_arrow_line)


local wind_arrow = CreateElement "ceTexPoly"
wind_arrow.name = "wind_arrow"
wind_arrow.material = "Nav_Radar_Wind_Arrow"
wind_arrow.vertices = make_rectangle_vertices(0.015,0.08)
wind_arrow.indices = default_box_indices
wind_arrow.tex_coords = {{0,0},{1,0},{1,0.95},{0,0.95}}
wind_arrow.init_rot = {0, 0, 0}
wind_arrow.init_pos = {-0.78,-0.825}
wind_arrow.element_params = {Nav_Radar_brightness_parameter, "WIND_RAD", "WIND_KNTS"}
wind_arrow.controllers = {{"opacity_using_parameter", 0}, {"rotate_using_parameter", 1, -1}, {"parameter_in_range", 2, 0, 999}}
wind_arrow.parent_element = Nav_Radar_origin
AddElement(wind_arrow)


local arrow_number_x = CreateElement "ceStringPoly"
arrow_number_x.name = "arrow_number_x"
arrow_number_x.init_pos = {-0.78,-0.875}
arrow_number_x.material = NAV_FONT_WHITE_SMALL
arrow_number_x.stringdefs = strdefcenter
arrow_number_x.alignment = "CenterCenter"
arrow_number_x.formats = {"%.0f"}
arrow_number_x.element_params = {Nav_Radar_brightness_parameter, "WIND_END_X", "WIND_END_Y", "WIND_X", "WIND_KNTS"}
arrow_number_x.controllers = {{"opacity_using_parameter", 0},{"move_left_right_using_parameter", 1, 0},
							{"move_up_down_using_parameter", 2, 0.006}, {"text_using_parameter", 3, 0}, {"parameter_in_range", 4, 0, 999}}
arrow_number_x.parent_element = Nav_Radar_origin
AddElement(arrow_number_x)


local arrow_number_y = CreateElement "ceStringPoly"
arrow_number_y.name = "arrow_number_y"
arrow_number_y.init_pos = {-0.78,-0.825}
arrow_number_y.material = NAV_FONT_WHITE_SMALL
arrow_number_y.stringdefs = strdefcenter
arrow_number_y.alignment = "CenterCenter"
arrow_number_y.formats = {"%.0f"}
arrow_number_y.element_params = {Nav_Radar_brightness_parameter, "WIND_NUMBER_POSX", "WIND_END_Y", "WIND_Y", "WIND_KNTS"}
arrow_number_y.controllers = {{"opacity_using_parameter", 0},{"move_left_right_using_parameter", 1, 0.006},
							{"move_up_down_using_parameter", 2, 0.001}, {"text_using_parameter", 3, 0}, {"parameter_in_range", 4, 0, 999}}
arrow_number_y.parent_element = Nav_Radar_origin
AddElement(arrow_number_y)


local arrow_number_hyp = CreateElement "ceStringPoly"
arrow_number_hyp.name = "arrow_number_hyp"
arrow_number_hyp.init_pos = {-0.78,-0.775}
arrow_number_hyp.material = NAV_FONT_WHITE
arrow_number_hyp.stringdefs = strdefcenter
arrow_number_hyp.alignment = "CenterCenter"
arrow_number_hyp.formats = {"%.0f"}
arrow_number_hyp.element_params = {Nav_Radar_brightness_parameter, "WIND_NUMBER_POSY", "WIND_END_Y", "WIND_KNTS", "WIND_KNTS"}
arrow_number_hyp.controllers = {{"opacity_using_parameter", 0},{"move_left_right_using_parameter", 1, 0.006},
							{"move_up_down_using_parameter", 2, 0.002}, {"text_using_parameter", 3, 0}, {"parameter_in_range", 4, 0, 999}}
arrow_number_hyp.parent_element = Nav_Radar_origin
AddElement(arrow_number_hyp)





if IS_TAWS == false then

	----Cursor Target----
	local cursw = 0.04
	local cursh = 0.005
	local offset = 0.015


	local cursor_target_center = CreateElement "ceMeshPoly"
	cursor_target_center.name = "cursor_target_center"
	cursor_target_center.primitivetype = "triangles"
	set_circle(cursor_target_center, 0.004, 0, 360, 128)
	cursor_target_center.init_pos = {0, 0, 0}
	cursor_target_center.material = CURSOR_TARGET_MAT
	cursor_target_center.element_params = {Nav_Radar_brightness_parameter, "NAV_Cursor_Xpos_Dsp", "NAV_Cursor_Ypos_Dsp", "CURSOR_CROSS_DISPLAY"}
	cursor_target_center.controllers = {{"opacity_using_parameter", 0},{"move_left_right_using_parameter", 1, 0.0702},
								{"move_up_down_using_parameter", 2, 0.0702},
								{ "parameter_in_range", 3, 0.9, 1.05}}
	cursor_target_center.parent_element = Nav_Radar_origin
	AddElement(cursor_target_center)


	local cursor_target_bar1 = CreateElement "ceMeshPoly"
	cursor_target_bar1.name = "cursor_target_bar1"
	cursor_target_bar1.primitivetype = "triangles"
	cursor_target_bar1.vertices = {{-cursw/2,-cursh/2},{cursw/2,-cursh/2},{cursw/2,cursh/2},{-cursw/2,cursh/2}}
	cursor_target_bar1.indices = default_box_indices
	cursor_target_bar1.init_rot = {0, 0, 0}
	cursor_target_bar1.init_pos = {cursw/2+offset, 0, 0}
	cursor_target_bar1.material = CURSOR_TARGET_MAT
	cursor_target_bar1.element_params = {Nav_Radar_brightness_parameter}
	cursor_target_bar1.controllers = {{"opacity_using_parameter", 0}}
	cursor_target_bar1.parent_element = cursor_target_center.name
	AddElement(cursor_target_bar1)


	local cursor_target_bar2 = CreateElement "ceMeshPoly"
	cursor_target_bar2.name = "cursor_target_bar2"
	cursor_target_bar2.primitivetype = "triangles"
	cursor_target_bar2.vertices = {{-cursw/2,-cursh/2},{cursw/2,-cursh/2},{cursw/2,cursh/2},{-cursw/2,cursh/2}}
	cursor_target_bar2.indices = default_box_indices
	cursor_target_bar2.init_rot = {90, 0, 0}
	cursor_target_bar2.init_pos = {0, cursw/2+offset, 0}
	cursor_target_bar2.material = CURSOR_TARGET_MAT
	cursor_target_bar2.element_params = {Nav_Radar_brightness_parameter}
	cursor_target_bar2.controllers = {{"opacity_using_parameter", 0}}
	cursor_target_bar2.parent_element = cursor_target_center.name
	AddElement(cursor_target_bar2)


	local cursor_target_bar3 = CreateElement "ceMeshPoly"
	cursor_target_bar3.name = "cursor_target_bar3"
	cursor_target_bar3.primitivetype = "triangles"
	cursor_target_bar3.vertices = {{-cursw/2,-cursh/2},{cursw/2,-cursh/2},{cursw/2,cursh/2},{-cursw/2,cursh/2}}
	cursor_target_bar3.indices = default_box_indices
	cursor_target_bar3.init_rot = {180, 0, 0}
	cursor_target_bar3.init_pos = {-(cursw/2+offset), 0, 0}
	cursor_target_bar3.material = CURSOR_TARGET_MAT
	cursor_target_bar3.element_params = {Nav_Radar_brightness_parameter}
	cursor_target_bar3.controllers = {{"opacity_using_parameter", 0}}
	cursor_target_bar3.parent_element = cursor_target_center.name
	AddElement(cursor_target_bar3)


	local cursor_target_bar4 = CreateElement "ceMeshPoly"
	cursor_target_bar4.name = "cursor_target_bar4"
	cursor_target_bar4.primitivetype = "triangles"
	cursor_target_bar4.vertices = {{-cursw/2,-cursh/2},{cursw/2,-cursh/2},{cursw/2,cursh/2},{-cursw/2,cursh/2}}
	cursor_target_bar4.indices = default_box_indices
	cursor_target_bar4.init_rot = {270, 0, 0}
	cursor_target_bar4.init_pos = {0, -(cursw/2+offset), 0}
	cursor_target_bar4.material = CURSOR_TARGET_MAT
	cursor_target_bar4.element_params = {Nav_Radar_brightness_parameter}
	cursor_target_bar4.controllers = {{"opacity_using_parameter", 0}}
	cursor_target_bar4.parent_element = cursor_target_center.name
	AddElement(cursor_target_bar4)


	local cursor_mode = CreateElement "ceStringPoly"
	cursor_mode.name = "cursor_mode"
	cursor_mode.material = NAV_FONT
	cursor_mode.init_pos = {0.04, -1.1, 0}
	cursor_mode.init_rot = {0, 0, 0}
	cursor_mode.stringdefs = strdefcenter
	cursor_mode.alignment = "RightCenter"
	cursor_mode.formats = {"%s"}
	cursor_mode.element_params = {Nav_Radar_brightness_parameter, "CURSOR_MODE_DISP"}
	cursor_mode.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
	cursor_mode.parent_element = Nav_Radar_origin
	AddElement(cursor_mode)

	local cursor_rel = CreateElement "ceStringPoly"
	cursor_rel.name = "cursor_rel"
	cursor_rel.material = NAV_FONT_WHITE
	cursor_rel.init_pos = {0.08, -1.1, 0}
	cursor_rel.init_rot = {0, 0, 0}
	cursor_rel.alignment = "LeftCenter"
	cursor_rel.stringdefs = strdefcenter
	cursor_rel.formats = {"%s"}
	cursor_rel.element_params = {Nav_Radar_brightness_parameter, "CURSOR_REL"}
	cursor_rel.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
	cursor_rel.parent_element = Nav_Radar_origin
	AddElement(cursor_rel)

	local cursor_pos = CreateElement "ceStringPoly"
	cursor_pos.name = "cursor_pos"
	cursor_pos.material = NAV_FONT_WHITE
	cursor_pos.init_pos = {0, -1.18, 0}
	cursor_pos.init_rot = {0, 0, 0}
	cursor_pos.stringdefs = strdefcenter
	cursor_pos.alignment = "CenterCenter"
	cursor_pos.formats = {"%s"}
	cursor_pos.element_params = {Nav_Radar_brightness_parameter, "CURSOR_POS_VAL"}
	cursor_pos.controllers = {{"opacity_using_parameter", 0}, {"text_using_parameter", 1}}
	cursor_pos.parent_element = Nav_Radar_origin
	AddElement(cursor_pos)

    local cursor_line            = CreateElement "ceSimpleLineObject"
    cursor_line.name             = "cursor_line"
    cursor_line.primitivetype    = "lines"
    cursor_line.width            = 1
    cursor_line.material           = CURSOR_TARGET_MAT_SOFT
    cursor_line.vertices          = {{0, 0}, {0, 0.3}
    }
    cursor_line.init_pos         = {0, 0}
    cursor_line.element_params     = {Nav_Radar_brightness_parameter, "NAV_Cursor_Xpos_Dsp", "NAV_Cursor_Ypos_Dsp"}
    cursor_line.controllers         = {{"opacity_using_parameter", 0}, {"line_object_set_point_using_parameters", 1, 1, 2, 0.0702, 0.0702}}
    cursor_line.h_clip_relation    = h_clip_relations.COMPARE
	cursor_line.collimated      = false
	cursor_line.isvisible       = true
	cursor_line.use_mipfilter   = true
	cursor_line.additive_alpha  = true
	cursor_line.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
    cursor_line.parent_element    = Nav_Radar_origin
    AddElement(cursor_line)
end


local Ownship = CreateElement "ceTexPoly"
Ownship.name = "Ownship"
Ownship.material = "Nav_Radar_Ownship"
Ownship.vertices = make_rectangle_vertices(0.075,0.075)
Ownship.indices = default_box_indices
Ownship.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
Ownship.init_pos = {0,0}
Ownship.element_params = {Nav_Radar_brightness_parameter, "RWR_Overlay", Nav_Radar_Display }
Ownship.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range", 1, -0.1, 0.1}, {"parameter_in_range",2,0.95,1.05}}
-- Ownship.parent_element = Nav_Radar_origin
AddElement(Ownship)

