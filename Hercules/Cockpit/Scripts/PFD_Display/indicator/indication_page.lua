dofile(LockOn_Options.script_path.."PFD_Display/indicator/definitions.lua")


------------------------------------------------------------------------------------------------------------------------------------------Original PFD_Display
-- PFD_on_parameter = ""           ---- Declared in the HDD indicator files
-- PFD_brightness_parameter = ""   ---- Declared in the HDD indicator files
-- PFD_origin = ""                 ---- Declared in the HDD indicator files

-- local width  	   					= 1.0
-- local height 	   					= width * GetAspect()

-- local PFD_Display = CreateElement "ceTexPoly"
-- PFD_Display.name = "PFD_Display"
-- PFD_Display.material = "PFD_Background"
-- PFD_Display.vertices = {
						-- {-width, height},
						-- { width, height},
						-- { width,-height},
						-- {-width,-height}
					-- }
-- PFD_Display.indices = default_box_indices
-- PFD_Display.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
-- PFD_Display.init_pos = {0,0}
-- PFD_Display.element_params = {
						-- PFD_brightness_parameter,
					-- }
-- PFD_Display.controllers = {
							-- BCont[1],BCont[2],BCont[3],BCont[4],BCont[5],BCont[6],BCont[7],BCont[8],BCont[9],BCont[10],BCont[11],BCont[12],BCont[13],BCont[14],BCont[15],
						-- }
-- PFD_Display.parent_element = PFD_origin
-- AddElement(PFD_Display)
------------------------------------------------------------------------------------------------------------------------------------------End Original PFD_Display




local full_turn 			= math.pi * 2

local infinity = 2^53

local windowCenterY = 0.5806

--------------------------------------------------------------------------------------------------------------------------------------------PFD

local PFD_origin_elem	       = CreateElement "ceSimple"
local PFD_origin_name          = "PFD_origin"
local PFD_parent               = PFD_origin_name
PFD_origin_elem.name 		   = PFD_origin_name
PFD_origin_elem.init_pos       = {0,0}
with_brightness(PFD_origin_elem)
PFD_origin_elem.parent_element = PFD_origin
AddElement(PFD_origin_elem)

local PFD					= CreateElement "ceTexPoly"
PFD.name 					= "PFD"
PFD.material   				= "black"
PFD.vertices 				= make_rectangle_vertices(1, 1 * GetAspect())
PFD.indices					= default_box_indices
PFD.tex_coords 				= {{0,0},{1,0},{1,1},{0,1}}
PFD.init_pos   				= {0,0}
with_brightness(PFD)
PFD.blend_mode				= blend_mode.IBM_REGULAR_RGB_ONLY_ADDITIVE_ALPHA
PFD.parent_element			= PFD_parent
PFD.isvisible       = false
AddElement(PFD)

--------------------------------------------------------------------------------------------------------------------------------------------HDDColors
local horizon_center_x = -0.065
local horizon_center_y = windowCenterY - 0.009
local horizon_half_width = 1
local sky_ground_half_height = 1
local white_line_width = 0.004
local horizon_mask_level = 5
local horizon_level = horizon_mask_level + 1

ADI_mask(
	0.481, 0.315,
	horizon_center_x, windowCenterY + 0.017,
	horizon_mask_level
)

local function make_horizon_controllers_and_parameters(is_ladder)
	local gain = full_turn / 4 * 0.07945
	return {
		"ROLL_RAD",
		is_ladder and "PITCH_RAD" or "PFD_horizon_pitch",
	}, {
		{"rotate_using_parameter",       0, 1.0},
		{"move_up_down_using_parameter", 1, -gain, gain},
	}
end

-- blue sky box in ADI; original color in image: #1b4dff
make_box_with_edge(
	"ADI_SKY",
	"1b4dff",
	horizon_center_x, horizon_center_y + white_line_width,
	horizon_half_width, sky_ground_half_height,
	true,
	horizon_level,
	PFD_parent,
	make_horizon_controllers_and_parameters()
)

-- white line between sky and ground
make_box_with_edge(
	"ADI_SKY_GROUND_SEPARATOR",
	"ffffff",
	horizon_center_x, horizon_center_y + white_line_width,
	horizon_half_width, white_line_width,
	false,
	horizon_level,
	PFD_parent,
	make_horizon_controllers_and_parameters()
)

-- brown ground box in ADI; original color in image: #5d2818
make_box_with_edge(
	"ADI_GROUND",
	"5d2818",
	horizon_center_x, horizon_center_y - white_line_width,
	horizon_half_width, sky_ground_half_height,
	false,
	horizon_level,
	PFD_parent,
	make_horizon_controllers_and_parameters()
)

--------------------------------------------------------------------------------------------------------------------------------------------HDDLadder
local dimension    = 0.6275
local elem          = CreateElement "ceTexPoly"
elem.name           = "PFD_Ladder"
elem.material       = "PFD_Ladder_Lines"
elem.vertices       = make_rectangle_vertices(dimension, 4 * dimension)
elem.indices        = default_box_indices
elem.tex_coords     = {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {horizon_center_x, horizon_center_y}
with_brightness(elem, make_horizon_controllers_and_parameters(true))
elem.blend_mode     = blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element = PFD_parent
AddElementWithBlendMode(elem)

--------------------------------------------------------------------------------------------------------------------------------------------HDDFPM
local dimension    = 0.1725
local elem          = CreateElement "ceTexPoly"
elem.name           = "PFD_FPM"
elem.material       = "PFD_FPM"
elem.vertices       = make_rectangle_vertices(dimension, dimension)
elem.indices        = default_box_indices
elem.tex_coords     = {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = { horizon_center_x, windowCenterY}
with_brightness(elem, {
	"PFD_FPM_horz",
	-- "PFD_FPM_VERT",
}, {
	{"move_up_down_using_parameter",       0, 1.0 },
	-- {"move_left_right_using_parameter", 1, 1.0 }
})
elem.blend_mode     = blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element = PFD_parent
-- AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------HDDBankIndicator
local dim 		   = 0.71
local elem          = CreateElement "ceTexPoly"
elem.name           = "BankInd"
elem.material       = "PFD_BankIndicator"
elem.vertices       = make_rectangle_vertices(dim, dim)
elem.indices        = default_box_indices
elem.tex_coords     = {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = { -0.06, windowCenterY}
with_brightness(elem, {"PFD_bank"}, {{"rotate_using_parameter", 0, 0.95}})
elem.blend_mode     = blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element = PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------HDDBankIndicatorFill
local dim 		   = 0.71
local elem          = CreateElement "ceTexPoly"
elem.name           = "PFD_BankFill"
elem.material       = "PFD_BankIndicator_Fill"
elem.vertices       = make_rectangle_vertices(dim, dim)
elem.indices        = default_box_indices
elem.tex_coords     = {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = { -0.06, windowCenterY}
with_brightness(elem, {
	"PFD_bank",
	"PFD_bank_fill",
}, {
	{"rotate_using_parameter",  0, 1.0},
	{"parameter_in_range", 1, 0.9, 1.1},
})
elem.blend_mode     = blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element = PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------ADI MASK
local ADI_mask_dim			= 0.7125
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_ADI_Mask"
elem.material       	= "PFD_ADI_Mask"
elem.vertices       	= make_rectangle_vertices(2 * ADI_mask_dim, 4 * ADI_mask_dim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos         = {horizon_center_x, -1.52}
with_on_switch(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------ADI MASK OUTLINE
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_ADI_Mask_Outline"
elem.material       	= "PFD_ADI_Mask_Outline"
elem.vertices       	= make_rectangle_vertices(ADI_mask_dim, ADI_mask_dim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos         = {-0.066, 0.6115}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElementWithBlendMode(elem)

--------------------------------------------------------------------------------------------------------------------------------------------COMPASS ROSE
local maskDim				= 0.605
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_CompassRose"
elem.material       	= "PFD_CompassRose"
elem.vertices       	= make_rectangle_vertices(maskDim, maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {horizon_center_x, -0.785}
with_brightness(elem, {"HEADING_RAD"}, {{"rotate_using_parameter", 0, 1.0}})
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------HEADING BUG
local maskDim				= 0.40
local width, height       	= maskDim, maskDim
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_CompassHeading"
elem.material       	= "PFD_CompassHeading"
elem.vertices       	= make_rectangle_vertices(width, height)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {horizon_center_x, -0.6225}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED TAPE MASK
-- LEVEL 5
rectangular_mask(
	"SPEED",
	0.12, 0.495,
	-0.88, 0.6,
	5
)

--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED TAPE
--numbers running alongside airspeed tape
local tapeCenter_y = -0.64
local tapeNumberOffset = -0.825 - tapeCenter_y
local tapeNumber_x = -0.84
local tick_y_shift = -0.002
local tick_x = -0.813
local IAS_tape_number_size = 0.005

local IAS_tape_level = 6
local IAS_numbers_below_base = 3

--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED TAPE NUMBERS
--base number for tape
for i = 1, 7 do
	local current_tape_number_y = tapeCenter_y + (i - 1 - IAS_numbers_below_base) * tapeNumberOffset
	local IAS_number_parameter = "PFD_IAS_tape" .. i

	local parameters, controllers = with_brightness(nil, {
			IAS_number_parameter,
			"PFD_IAS_tape_shift",
		},
		{
			{"parameter_in_range", 0, -0.1, infinity},
			{"text_using_parameter", 0, 0},
			{"move_up_down_using_parameter", 1, -0.0145 },
		})

	Add_Text_With_Level("PFD_IAS_tape" .. i,
		"font_PFD_green",
		"RightCenter",
		PFD_parent,
		parameters, controllers,
		{"%.0f"}, {IAS_tape_number_size, IAS_tape_number_size, 0, 0},
		tapeNumber_x,--initpixelposx
		current_tape_number_y, --initpixelposy
		IAS_tape_level
	)

	--add the tick markers to IAS tape
	for j = 1, 2 do
		local parameters, controllers = with_on_switch(nil,
			{IAS_number_parameter, "PFD_IAS_tape_shift"},
			{
				{"parameter_in_range", 0, -0.1, infinity},
				{"move_up_down_using_parameter", 1, -0.0145 },
			})

		-- block out underlying elements
		Add_Thick_Line("PFD_IAS_TICK_" .. i .. "_" .. j, "black", 8, 200,
			tick_x, -(current_tape_number_y + (j - 1) * tapeNumberOffset / 2) + tick_y_shift, PFD_parent,
			parameters, controllers,
			IAS_tape_level
		)

		local parameters, controllers = with_brightness(nil,
			{IAS_number_parameter, "PFD_IAS_tape_shift"},
			{
				{"parameter_in_range", 0, -0.1, infinity},
				{"move_up_down_using_parameter", 1, -0.0145 },
			})

		Add_Thick_Line("PFD_IAS_TICK_" .. i .. "_" .. j, "green", 8, 200,
			tick_x, -(current_tape_number_y + (j - 1) * tapeNumberOffset / 2) + tick_y_shift, PFD_parent,
			parameters, controllers,
			IAS_tape_level
		)
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------AUTOPILOT REFERENCE AIRSPEED INDICATOR
local long_side_size = 0.1 -- long side of rectangle
local short_side_size = long_side_size / 39 * 24 -- short side of rectangle
local triangle_base = long_side_size / 39 * 17
local triangle_height = long_side_size / 39 * 13

local parameters, controllers = {}, {}
add_controller(parameters, controllers, "move_left_right_using_parameter", "PFD_reference_airspeed_up_down", 0.000722)

local function auto_ref_air(color, opaque)
	make_autopilot_reference_airspeed_indicator(
		"PFD_reference_airspeed", color, opaque, -- name, material, opacity
		-0.7641, -tapeCenter_y + 0.001, 90, -- x, y, rotation
		long_side_size, short_side_size, triangle_base, triangle_height,
		IAS_tape_level, nil,
		parameters, controllers
	)
end

-- shape to block out other stuff from bleeding through
auto_ref_air("black", true)

-- actual shape
auto_ref_air("cyan", false)

--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED TAPE MASK
local maskDim				= 0.3425
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_Airspeed"
elem.material       	= "PFD_Airspeed"
elem.vertices       	= make_rectangle_vertices(maskDim, 2 * maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {-0.8125, 0.64}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--fixed position top number in block
local parameters, controllers = with_brightness(nil, {"PFD_IAS_tape_max"}, {{"text_using_parameter", 0, 0}})
Add_Text("PFD_IAS_tape_max",
	"font_PFD_green",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.0f"}, {IAS_tape_number_size, IAS_tape_number_size, 0, 0},
	tapeNumber_x,--initpixelposx
	tapeCenter_y + (2.725 * tapeNumberOffset) --initpixelposy
)

-- autopilot reference airspeed
local parameters, controllers = with_brightness(nil, {"PILOT_RefAirspeedVal"}, {{"text_using_parameter", 0, 0}})
Add_Text("PFD_IAS_tape_max",
	"font_PFD_cyan",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.0f"}, {IAS_tape_number_size, IAS_tape_number_size, 0, 0},
	tapeNumber_x, tapeCenter_y + (3.25 * tapeNumberOffset) -- initpixelposx, initpixelposy
)
--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED ARROW
-- black mask for airspeed arrow
local airspeedArrowOutlineSize = 0.3425 * 0.4
local airspeedArrowBlackSize = airspeedArrowOutlineSize
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_Airspeed"
elem.material       	= "PFD_Airspeed_Arrow_Black"
elem.vertices       	= make_rectangle_vertices(airspeedArrowBlackSize, airspeedArrowBlackSize)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {-0.895, 0.64}
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
-- elem.level			= 6
--elem.parent_element 	= PFD_parent
AddElement(elem, 6)

-- white outline for airspeed arrow
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_Airspeed"
elem.material       	= "PFD_Airspeed_Arrow"
elem.vertices       	= make_rectangle_vertices(airspeedArrowOutlineSize, airspeedArrowOutlineSize)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {-0.895, 0.64}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
-- elem.level			= 6
--elem.parent_element 	= PFD_parent
AddElement(elem, 6)

--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED INDICATOR MASK
-- LEVEL 7
rectangular_mask(
	"AIRSPEED_ARROW",
	0.1, 0.08,
	-0.9, 0.64,
	7
)

--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED INDICATOR
local offset = 0.013
local IAS_ones_level = 8

local parameters, controllers = with_brightness(nil, {"PFD_IAS_hundys"}, {{"text_using_parameter", 0, 0}})
Add_Text_With_Level("PFD_IAS_HUNDREDS",
		 "font_PFD_white",
		 "RightCenter",
		 PFD_parent,
		parameters, controllers,
		{"%.0f"}, {0.00625,0.00625, 0, 0},
		-0.90 + offset,--initpixelposx
		-0.64, --initpixelposy
		IAS_ones_level
)

-- Rolling airspeed ones place
local center_number_pos_x = -0.865 + offset
local center_number_pos_y = -0.64
local number_offset = -0.73 - center_number_pos_y
local ias_ones_below_base = 1
for i = 1, 4 do
	local parameters, controllers = with_brightness(nil,
		{
			"PFD_IAS_ones" .. i,
			"PFD_IAS_ones_y",
		},
		{
			{"text_using_parameter", 0, 0},
			{"move_up_down_using_parameter", 1, 1.0 },
		})
	Add_Text_With_Level("PFD_IAS_ones" .. i,
		"font_PFD_white",
		"CenterCenter",
		PFD_parent,
		parameters, controllers,
		{"%.0f"}, {0.00625,0.00625, 0, 0},
		center_number_pos_x,--initpixelposx
		center_number_pos_y + number_offset * (i - 1 - ias_ones_below_base),--initpixelposy
		IAS_ones_level
	)
end

--------------------------------------------------------------------------------------------------------------------------------------------AIRSPEED NUMBER MASK
local maskDim				= 0.3425
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_AirspeedMask"
elem.material       	= "PFD_AirspeedNumberMask"
elem.vertices       	= make_rectangle_vertices(maskDim, 2 * maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {-0.8125, 0.64}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
--AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------ALTITUDE TAPE MASK
-- LEVEL 5
rectangular_mask(
	"ALT",
	0.15, 0.5445,
	0.85, 0.6395,
	5
)

--------------------------------------------------------------------------------------------------------------------------------------------ALTITUDE TAPE NUMBERS
--position for tape numbers and autopilot reference altitude indicator
local alt_thous_size = 0.00625
local small_alt_size = alt_thous_size * 25 / 34
local alt_tape_x_thousands = 0.875
local alt_tape_x_hundreds = 0.925
local small_tape_size = small_alt_size * 20/24
local alt_tape_increment = 0.2958
local alt_tape_base_y = -0.6375
local alt_tape_tick_base_y = -alt_tape_base_y
local alt_tape_level = 6
local alt_tape_numbers_below_base = 1
local altitude_tick_x = 0.704

--numbers in 500 ft increments
for i = 1, 4 do
	local current_offset = (i - 1 - alt_tape_numbers_below_base) * alt_tape_increment
	local parameters, controllers = with_brightness(nil,
		{
			"PFD_alt_tape_hundys"..i,
			"PFD_alt_tape_y",
			"PFD_alt_tape"..i,
		},
		{
			{"text_using_parameter", 0, 0},
			{"move_up_down_using_parameter", 1, 0.0235},
			{"parameter_in_range", 2, 99, infinity},
		})
	Add_Text_With_Level("PFD_alt_tape_hundys"..i,
			"font_PFD_green",
			"CenterCenter",
			PFD_parent,
			parameters, controllers,
			{"%03.0f"}, {small_tape_size, small_tape_size, 0, 0},
			alt_tape_x_hundreds, --initpixelposx
			alt_tape_base_y - current_offset, --initpixelposy
			alt_tape_level
	)
	--thousands
	local parameters, controllers = with_brightness(nil,
		{
			"PFD_alt_tape_grands"..i,
			"PFD_alt_tape_y",
			"PFD_alt_tape"..i,
		},
		{
			{"text_using_parameter", 0, 0},
			{"move_up_down_using_parameter", 1, 0.0235 },
			{"parameter_in_range", 2, 999, infinity},
		})
	Add_Text_With_Level("PFD_alt_tape_grands"..i,
		"font_PFD_green",
		"RightCenter",
		PFD_parent,
		parameters, controllers,
		{"%.0f"}, {small_alt_size, small_alt_size, 0, 0},
		alt_tape_x_thousands, --initpixelposx
		alt_tape_base_y - 0.0042 - current_offset,--initpixelposy
		alt_tape_level
	)
	--add the tick markers to the 500's
	local parameters, controllers = with_brightness(nil,
		{"PFD_alt_tape_y"}, {{"move_up_down_using_parameter", 0, 0.0235 }}
	)
	Add_Thick_Line(
		"Alt_500_Tick_"..i, "green", 8, 320,
		altitude_tick_x, alt_tape_tick_base_y + current_offset,
		PFD_parent,
		parameters, controllers,
		alt_tape_level
	)

	--loop to add the hundred ticks
	for j = 1, 4 do
		Add_Thick_Line(
			"Alt_100_Tick_"..i.."_"..j, "green", 8, 160,
			altitude_tick_x, alt_tape_tick_base_y + current_offset + (alt_tape_increment * j / 5),
			PFD_parent,
			parameters, controllers,
			alt_tape_level
		)
	end

	--adds the ticks below the bottom 500 displayed
	if i == 1 then
		for j = 1, 4 do
			Add_Thick_Line(
				"Alt_100_Tick_0_"..j, "green", 8, 160,
				altitude_tick_x, alt_tape_tick_base_y + current_offset + (alt_tape_increment * j / 5) - alt_tape_increment,
				PFD_parent,
				parameters, controllers,
				alt_tape_level
			)
		end
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------AUTOPILOT REFERENCE ALTITUDE INDICATOR
local long_side_size = 0.1 -- long side of rectangle
local short_side_size = long_side_size / 39 * 24 -- short side of rectangle
local triangle_base = long_side_size / 39 * 17
local triangle_height = long_side_size / 39 * 13

local parameters, controllers = {}, {}
add_controller(parameters, controllers, "move_left_right_using_parameter", "PFD_reference_altitude_up_down", -0.0000462)

local function auto_ref_alt(color, opaque)
	make_autopilot_reference_airspeed_indicator(
		"PFD_reference_altitude", color, opaque, -- name, material, opacity
		0.704, alt_tape_tick_base_y + 0.0025, -90, -- x, y, rotation
		long_side_size, short_side_size, triangle_base, triangle_height,
		alt_tape_level, nil,
		parameters, controllers
	)
end

-- shape to block out other stuff from bleeding through
auto_ref_alt("black", true)

-- actual shape
auto_ref_alt("cyan", false)

-- autopilot reference altitude
local parameters, controllers = with_brightness(nil,
	{"PILOT_HudRefAltitudeCaretVal"},
	{{"text_using_parameter", 0, 0}})
Add_Text_With_Level("PFD_reference_altitude",
	"font_PFD_cyan",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.0f"}, {small_alt_size, small_alt_size, 0, 0},
	0.985, -1.230516,--initpixelposx, initpixelposy
	DISPLAY_DEFAULT_LEVEL
)

--------------------------------------------------------------------------------------------------------------------------------------------ALTITUDE ARROW
-- black mask for altitude arrow
local altitudeArrowSize		= 0.3425 * 0.5
local altitudeArrowMaskSize = altitudeArrowSize
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_Altitude_Arrow"
elem.material       	= "PFD_Altitude_Arrow_Black"
elem.vertices       	= make_rectangle_vertices(altitudeArrowMaskSize, altitudeArrowMaskSize)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {0.85, 0.64}
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
-- elem.parent_element 	= PFD_parent
AddElement(elem, alt_tape_level)

-- white outline for altitude arrow
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_Altitude_Arrow"
elem.material       	= "PFD_Altitude_Arrow"
elem.vertices       	= make_rectangle_vertices(altitudeArrowSize, altitudeArrowSize)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       = {0.85, 0.64}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
-- elem.parent_element 	= PFD_parent
AddElement(elem, alt_tape_level)

--------------------------------------------------------------------------------------------------------------------------------------------ALTITUDE INDICATOR MASK
-- LEVEL 7
rectangular_mask(
	"ALT_IND",
	0.15, 0.06,
	0.85, 0.6395,
	7
)

--------------------------------------------------------------------------------------------------------------------------------------------ALTITUDE INDICATOR
--local offset = 0.0125
--THOUSANDS - TWO DIGITS AS CEILING < 100,000FT
local alt_arrow_level = 8
local parameters, controllers = with_brightness(nil, {
	"PFD_alt_grands",
	"PFD_alt",
}, {
	{"text_using_parameter", 0, 0},
	{"parameter_in_range",   1, 999.9, infinity},
})

Add_Text("PFD_ALT_THOUSANDS",
	"font_PFD_white",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.0f"}, {alt_thous_size, alt_thous_size, 0, 0},
	0.854, --initpixelposx
	-0.64,--initpixelposy
	alt_arrow_level
)

local small_alt_y = -0.635
--HUNDREDS - ONE DIGIT 0-9
local parameters, controllers = with_brightness(nil, {
	"PFD_alt_hundys",
	"PFD_alt",
}, {
	{"text_using_parameter",0,0},
	{"parameter_in_range", 1, 99.9, infinity},
})
Add_Text("PFD_ALT_HUNDREDS",
	"font_PFD_white",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.0f"}, {small_alt_size, small_alt_size, 0, 0},
	0.902, --initpixelposx
	small_alt_y,--initpixelposy
	alt_arrow_level
)

local alt_twenties_up1_pos = -0.70
local alt_offset = alt_twenties_up1_pos - small_alt_y
local alt_twenties_below_base = 1
for i = 1, 4 do
	local parameters, controllers = with_brightness(nil, {
		"PFD_alt_twenties" .. i,
		"PFD_alt_twenties_y",
	}, {
		{"text_using_parameter",         0, 0},
		{"move_up_down_using_parameter", 1, 0.0054 },
	})
	Add_Text("PFD_alt_twenties" .. i,
		"font_PFD_white",
		"CenterCenter",
		PFD_parent,
		parameters, controllers,
		{"%02.0f"}, {small_alt_size, small_alt_size, 0, 0},
		0.95, --initpixelposx
		small_alt_y + alt_offset * (i - alt_twenties_below_base - 1),--initpixelposy
		alt_arrow_level
	)
end

--------------------------------------------------------------------------------------------------------------------------------------------ALTITUDE TAPE INDICATOR MASK
--surrounding rectangle
local maskDim				= 0.3425
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_Altitude"
elem.material       	= "PFD_Altitude"
elem.vertices       	= make_rectangle_vertices(maskDim, 2 * maskDim )
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {0.815, 0.64}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------VVI Tape
-- VVI stuff
local VVI_x, VVI_y = 0.60, 0.64
local VVI_rectangle_height = 0.52
local VVI_line_width = 0.007
local VVI_rectangle_width = VVI_line_width * 9
local VVI_triangle_height = VVI_rectangle_width / 3

local maskDim				= 0.3425
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PFD_VVI"
elem.material       	= "PFD_VVI_Tape"
elem.vertices       	= make_rectangle_vertices(maskDim, 2 * maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {VVI_x, VVI_y}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------VVI Tower
function rectangular_mask_horizontally_centered(name, width, height, x, y, go_down, level)
	local vertices = {
		{-width / 2, 0},
		{-width / 2, height},
		{ width / 2, height},
		{ width / 2, 0},
	}
	if go_down then
		mult_y_in_vertices(vertices, -1)
	end

	local function add_elem(name, material, h_clip_relation)
		local elem           = CreateElement "ceMeshPoly"
		elem.name            = name
		elem.primitivetype   = "triangles"
		elem.material        = material
		elem.vertices        = vertices
		elem.indices         = default_box_indices
		elem.init_pos        = {x, y, 0}
		elem.init_rot        = {0, 0, 0}
		elem.h_clip_relation = h_clip_relations[h_clip_relation]
		elem.level           = level
		elem.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
		elem.collimated      = false
		elem.isvisible       = false
		with_on_switch(elem)
		-- elem.parent_element			= PFD_parent
		Add(elem)
	end

	add_elem(name .. "_MASK_AREA", "green", "REWRITE_LEVEL")
	add_elem(name .. "_CLIP_MASK", "cyan", "INCREASE_IF_LEVEL")
end

local function VVI_tower_shape(name_prefix, material, x_origin, y_origin, line_width, rectangle_width, rectangle_height, triangle_base, triangle_height, parameters, controllers, go_down, level)
	local function add_vertical_line(vertices, indices, height, width, right_shift, up_shift)
		local offset = #vertices

		table.insert(vertices, {-width / 2, -height})
		table.insert(vertices, { width / 2, -height})
		table.insert(vertices, { width / 2, 0})
		table.insert(vertices, {-width / 2, 0})

		add_to_y_in_vertices(vertices, up_shift)
		if go_down then
			mult_y_in_vertices(vertices, -1)
		end
		add_to_x_in_vertices(vertices, right_shift)

		for _, index in ipairs(default_box_indices) do
			table.insert(indices, index + offset)
		end
	end

	-- create a parallelogram forming one of the two equal sides of an isosceles triangle
	local function add_triangle_side(vertices, indices, triangle_base, triangle_height, line_width, go_left)
		-- equivalent to cosecant(angle) * opposite_side
		local function hypotenuse_from_angle_and_opposite_side(angle, opposite_side)
			return opposite_side / math.sin(angle)
		end

		local angle_opposite_height = math.atan2(triangle_height, triangle_base / 2)

		-- the lengths of the slanted sides of the parallelogram
		local horizontal_side = hypotenuse_from_angle_and_opposite_side(angle_opposite_height, line_width)
		local vertical_side = hypotenuse_from_angle_and_opposite_side(math.rad(90) - angle_opposite_height, line_width)

		local vertices_offset = #vertices

		table.insert(vertices, {triangle_base / 2 - horizontal_side / 2, -triangle_height})
		table.insert(vertices, {0,                                       -vertical_side / 2})
		table.insert(vertices, {0,                                        vertical_side / 2})
		table.insert(vertices, {triangle_base / 2 + horizontal_side / 2, -triangle_height})

		add_to_y_in_vertices(vertices, -vertical_side / 2)
		if go_down then
			mult_y_in_vertices(vertices, -1)
		end
		if go_left then
			mult_x_in_vertices(vertices, -1)
		end

		for _, index in ipairs(default_box_indices) do
			table.insert(indices, index + vertices_offset)
		end
	end

	local next_name_index = make_counter(1)
	local function add_element(vertices, indices)
		local name = name_prefix .. next_name_index()
		local elem           = CreateElement "ceMeshPoly"
		elem.name            = name
		elem.primitivetype   = "triangles"
		elem.material        = material
		elem.vertices        = vertices
		elem.indices         = indices
		elem.init_pos        = {x_origin, y_origin}
		elem.element_params  = parameters
		elem.controllers     = controllers
		elem.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
		elem.h_clip_relation = h_clip_relations.COMPARE
		elem.level           = level
		-- elem.parent_element 	= PFD_parent
		Add(elem)
	end

	local vertices, indices = {}, {}
	add_vertical_line(vertices, indices, rectangle_height, line_width, -(rectangle_width / 2), -(triangle_height + line_width / 2))
	add_element(vertices, indices)

	local vertices, indices = {}, {}
	add_vertical_line(vertices, indices, rectangle_height, line_width, rectangle_width / 2, -(triangle_height + line_width / 2))
	add_element(vertices, indices)

	local vertices, indices = {}, {}
	add_triangle_side(vertices, indices, rectangle_width, triangle_height, line_width, true)
	add_element(vertices, indices)

	local vertices, indices = {}, {}
	add_triangle_side(vertices, indices, rectangle_width, triangle_height, line_width, false)
	add_element(vertices, indices)
end

local get_new_level = make_counter(10)

-- local function get_new_level() return DISPLAY_DEFAULT_LEVEL - 1 end

local VVI_opaque_tower_parameters, VVI_opaque_tower_controllers = {}, {}
add_controller(VVI_opaque_tower_parameters, VVI_opaque_tower_controllers, "move_up_down_using_parameter", "VVI_up_down", 0.01061)
with_on_switch(VVI_opaque_tower_parameters, VVI_opaque_tower_controllers)

local VVI_tower_parameters, VVI_tower_controllers = {}, {}
add_controller(VVI_tower_parameters, VVI_tower_controllers, "move_up_down_using_parameter", "VVI_up_down", 0.01061)
with_brightness(nil, VVI_tower_parameters, VVI_tower_controllers)

local function mask_and_tower(name, go_down)
	rectangular_mask_horizontally_centered(
		name,
		VVI_rectangle_width + VVI_line_width, VVI_rectangle_height + VVI_triangle_height + VVI_line_width / 2,
		VVI_x, VVI_y,
		go_down, get_new_level()
	)
	local tower_level = get_new_level()
	-- blocker element
	VVI_tower_shape(
		name .. "_blocker", "black",
		VVI_x, VVI_y,
		VVI_line_width,
		VVI_rectangle_width, VVI_rectangle_height,
		VVI_rectangle_width, VVI_triangle_height,
		VVI_opaque_tower_parameters, VVI_opaque_tower_controllers,
		go_down, tower_level
	)
	-- visible element
	VVI_tower_shape(
		name, "white",
		VVI_x, VVI_y,
		VVI_line_width,
		VVI_rectangle_width, VVI_rectangle_height,
		VVI_rectangle_width, VVI_triangle_height,
		VVI_tower_parameters, VVI_tower_controllers,
		go_down, tower_level
	)
end

mask_and_tower("PFD" .. HDD_number .. "_VVI_tower_up", false)
mask_and_tower("PFD" .. HDD_number .. "_VVI_tower_down", true)

--------------------------------------------------------------------------------------------------------------------------------------------VVI zero line
function make_VVI_zero_line(name, material, x, y, width, height, is_opaque, level)
	local vertices = make_rectangle_vertices(width / 2, height / 2)

	local element           = CreateElement "ceTexPoly"
	element.name            = name
	element.primitivetype   = "triangles"
	element.vertices        = vertices
	element.material        = material
	element.indices         = default_box_indices
	element.init_pos        = {VVI_x, VVI_y}
	-- element.init_rot        = {0, 0, 0} -- NOTE: degree NOT rad
	element.h_clip_relation = h_clip_relations.COMPARE
	element.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
	element.level           = level
	element.collimated      = false
	element.isvisible       = true
	element.use_mipfilter   = true
	element.additive_alpha  = true
	element.parent          = PFD_parent

	if is_opaque then
		with_on_switch(element)
	else
		with_brightness(element)
	end

	Add(element)
end

-- Make zero line with same width as rectangle part of VVI tower, blocking stuff behind it with a black element.
local zero_line_length = VVI_rectangle_width + VVI_line_width
local zero_line_y = VVI_y - VVI_line_width / 2
rectangular_mask_horizontally_centered("PFD_VVI_zero_line", zero_line_length, VVI_line_width, VVI_x, zero_line_y, false, get_new_level())
local VVI_zero_line_level = get_new_level()
make_VVI_zero_line("PFD_VVI_zero_line_blocker", "black", zero_line_length, VVI_line_width, VVI_x, zero_line_y, true, VVI_zero_line_level)
make_VVI_zero_line("PFD_VVI_zero_line", "white", zero_line_length, VVI_line_width, VVI_x, zero_line_y, false, VVI_zero_line_level)

--------------------------------------------------------------------------------------------------------------------------------------------GROUND SPEED BOX
local maskDim				= 0.17125
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "GS_Box"
elem.material       	= "PFD_GS_Box"
elem.vertices       	= make_rectangle_vertices(maskDim, maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {-0.75, -0.13}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------GROUND SPEED DISPLAY
local parameters, controllers = with_brightness(nil, {"GS"}, {{"text_using_parameter", 0, 0}})
Add_Text("PFD_GS_VALUE",
	"font_PFD_white_mono",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.0f"}, {0.008,0.008, 0, 0},
	-0.63, --initpixelposx
	0.13 --initpixelposy
)

--------------------------------------------------------------------------------------------------------------------------------------------HEADING BOX
local maskDim				= 0.17125
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "HDG_Box"
elem.material       	= "PFD_HDG_Box"
elem.vertices       	= make_rectangle_vertices(maskDim, maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {-0.064, -0.18}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)
--------------------------------------------------------------------------------------------------------------------------------------------HEADING DISPLAY
local parameters, controllers = with_brightness(nil, {"HEADING_DEG"}, {{"text_using_parameter", 0, 0}})
Add_Text("PFD_HDG_VALUE",
	"font_PFD_white_mono",
	"CenterCenter",
	PFD_parent,
	parameters, controllers,
	{"%03.0f"}, {0.008,0.008, 0, 0},
	-0.0625, --initpixelposx
	0.18 --initpixelposy
)
--------------------------------------------------------------------------------------------------------------------------------------------G METER
local parameters, controllers = with_brightness(nil, {"GFORCE"}, {{"text_using_parameter", 0, 0}})
Add_Text("PFD_G_VALUE",
	"font_PFD_white",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%01.1fG"}, {0.006,0.006, 0, 0},
	-0.65, --initpixelposx
	0.25 --initpixelposy
)
--------------------------------------------------------------------------------------------------------------------------------------------RADALT BOX
local AGL_y                 = -0.325
local AGL_shift 			= 0.1

--AGL label
local maskDim				= 0.17125
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "AGL_Label"
elem.material       	= "PFD_AGL_Label"
elem.vertices       	= make_rectangle_vertices(maskDim, maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {0.385 + AGL_shift, AGL_y + 0.015}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--small box for 4 digits
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "AGL_Box"
elem.material       	= "PFD_AGL_Box"
elem.vertices       	= make_rectangle_vertices(maskDim, maskDim)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {0.385 + AGL_shift, AGL_y}
with_brightness(elem, {"RADAR_ALTITUDE"}, {{"parameter_in_range", 0, -1, 10000}})
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--big box for 5 digits
local maskDim				= 0.17125
local width, height       	= maskDim, maskDim
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "AGL_Box"
elem.material       	= "PFD_AGL_Box_Big"
elem.vertices       	= make_rectangle_vertices(width, height)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {0.385 + AGL_shift - 0.03, AGL_y}
with_brightness(elem, {"RADAR_ALTITUDE"}, {{"parameter_in_range", 0, 10000, 50000}})
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--------------------------------------------------------------------------------------------------------------------------------------------RADALT DISPLAY
local parameters, controllers = with_brightness(nil, {"RADAR_ALTITUDE"}, {{"text_using_parameter", 0, 0}})
Add_Text("PFD_RADALT_VALUE",
	"font_PFD_white_mono",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.0f"}, {0.008,0.008, 0, 0},
	0.525 + AGL_shift, --initpixelposx
	-AGL_y --initpixelposy
)

--------------------------------------------------------------------------------------------------------------------------------------------Pressure
local pressure_font_size = 0.005
local pressure_x = 0.9
local pressure_value_y = -0.36

--IN HG label
local maskDim				= 0.07611 --0.17125
local width, height       	= maskDim, (maskDim * (200/240))
local elem          	= CreateElement "ceTexPoly"
elem.name           	= "PRESSURE_LABEL"
elem.material       	= "PFD_ALTPRESS_LBL"
elem.vertices       	= make_rectangle_vertices(width, height)
elem.indices        	= default_box_indices
elem.tex_coords     	= {{0,0},{1,0},{1,1},{0,1}}
elem.init_pos       	= {pressure_x - 0.1, pressure_value_y + 0.075}
with_brightness(elem)
elem.blend_mode     	= blend_mode.IBM_REGULAR_RGB_ONLY
elem.parent_element 	= PFD_parent
AddElement(elem)

--pressure value
local parameters, controllers = with_brightness(nil, {"QNH_inHg"}, {{"text_using_parameter", 0, 0}})
Add_Text("PFD_PRESSURE",
	"font_PFD_cyan",
	"RightCenter",
	PFD_parent,
	parameters, controllers,
	{"%.2f"}, {pressure_font_size, pressure_font_size, 0, 0},
	pressure_x, --initpixelposx
	-pressure_value_y --initpixelposy
)
