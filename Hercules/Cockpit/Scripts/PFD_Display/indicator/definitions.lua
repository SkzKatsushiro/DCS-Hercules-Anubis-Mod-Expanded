dofile(LockOn_Options.common_script_path.."elements_defs.lua")
dofile(LockOn_Options.script_path .. "utils.lua")
-- dofile(LockOn_Options.script_path.."symbols.lua")

if SetScale then
	SetScale(FOV)
end

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
    object.use_mipfilter   = true
	object.additive_alpha  = true
	object.level		   = level or DISPLAY_DEFAULT_LEVEL
	object.h_clip_relation = h_clip_relations.COMPARE
	object.blend_mode 	   = blend_mode.IBM_REGULAR
	object.collimated      = true
	object.indices         = default_box_indices
    Add(object)
end
						
function AddElementWithBlendMode(object, level)
    object.use_mipfilter   = true
	object.additive_alpha  = true
	object.level		   = level or DISPLAY_DEFAULT_LEVEL
	object.h_clip_relation = h_clip_relations.COMPARE
	object.blend_mode 	   = blend_mode.IBM_REGULAR
	object.collimated      = true
	object.indices         = default_box_indices
    Add(object)
end


function Add_Object_Image(object, objectname, objectparent, objectmaterial, imagepixelsizex, imagepixelsizey, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	local object	    = CreateElement "ceTexPoly"
	object.name 		= objectname
	object.material   = objectmaterial	   
	object.vertices  = {{-(0.000244 * imagepixelsizex), (0.0001827 * imagepixelsizey) * GetAspect()},
						{ (0.000244 * imagepixelsizex), (0.0001827 * imagepixelsizey) * GetAspect()},
						{ (0.000244 * imagepixelsizex),-(0.0001827 * imagepixelsizey) * GetAspect()},
						{-(0.000244 * imagepixelsizex),-(0.0001827 * imagepixelsizey) * GetAspect()}}
	object.indices			= default_box_indices	
	object.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
	object.init_pos = {(0.0004883 * initpixelposx) - 1, ((-0.0003654 * initpixelposy) + 1) * GetAspect()}
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.collimated = true
	object.parent_element = objectparent
	object.blend_mode 	=  blend_mode.IBM_REGULAR
	AddElement(object)
end

function Add_Object_Box(object, objectname, objectparent, objectmaterial, imagepixelsizex, imagepixelsizey, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	local object	    = CreateElement "ceBoundingMeshBox"
	object.name 		= objectname
	object.primitivetype = "lines"
	object.width			= 0.5
	object.material   = objectmaterial	   
	object.vertices  = {{-(0.000244 * imagepixelsizex), (0.0001827 * imagepixelsizey) * GetAspect()},
						{ (0.000244 * imagepixelsizex), (0.0001827 * imagepixelsizey) * GetAspect()},
						{ (0.000244 * imagepixelsizex),-(0.0001827 * imagepixelsizey) * GetAspect()},
						{-(0.000244 * imagepixelsizex),-(0.0001827 * imagepixelsizey) * GetAspect()}}
	object.init_pos = {(0.0004883 * initpixelposx) - 1, ((-0.0003654 * initpixelposy) + 1) * GetAspect()}
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.h_clip_relation= h_clip_relations.COMPARE
	object.level 		    = DISPLAY_DEFAULT_LEVEL	
	-- object.geometry_hosts		= {PFD_Engine_Status_origin.name}
	object.parent_element = objectparent
	AddElement(object)
end

function Add_Object_Line(object, objectname, objectparent, objectmaterial, imagepixelsizex, imagepixelsizey, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	local object	    = CreateElement "ceSimpleLineObject"
	object.name 		= objectname
	object.primitivetype = "lines"
	object.width			= 0.5
	object.material   = objectmaterial	   
	object.vertices  = {{-(0.000244 * imagepixelsizex), (0.0001827 * imagepixelsizey) * GetAspect()},
						{ (0.000244 * imagepixelsizex), (0.0001827 * imagepixelsizey) * GetAspect()}
						-- { (0.000244 * imagepixelsizex),-(0.0001827 * imagepixelsizey) * GetAspect()},
						-- {-(0.000244 * imagepixelsizex),-(0.0001827 * imagepixelsizey) * GetAspect()}
						}
	object.init_pos = {(0.0004883 * initpixelposx) - 1, ((-0.0003654 * initpixelposy) + 1) * GetAspect()}
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.h_clip_relation= h_clip_relations.COMPARE
	object.level 		    = DISPLAY_DEFAULT_LEVEL	
	-- object.geometry_hosts		= {PFD_Engine_Status_origin.name}
	object.parent_element = objectparent
	AddElement(object)
end

function Add_Object_Text(object, objectname, objectparent, objectmaterial, objectalignment, format_value, stringdefs_value, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	local object           = CreateElement "ceStringPoly"
	object.name            = objectname
	object.material        = objectmaterial
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.init_pos = {(0.0004883 * initpixelposx) - 1, ((-0.0003654 * initpixelposy) + 1) * GetAspect()}
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

function Add_System_Status_Text(object, messagename, material, alignment, parent, element_param, range_lower, range_upper, format_value, initpixelposx, initpixelposy)
	local object           = CreateElement "ceStringPoly"
	object.name            = messagename
	object.material        = material
	object.element_params   = {
								"hdd_003_brightness",
								element_param,
							} 
	object.controllers 	   = {
									{"opacity_using_parameter",0},
									{"parameter_in_range",1,range_lower,range_upper},
									{"text_using_parameter",1,0},--first index is for element_params (starting with 0) , second for formats ( starting with 0)
								}
	object.init_pos			= {(0.001953 * initpixelposx) - 1, ((-0.001466 * initpixelposy) + 1) * GetAspect()}
	object.alignment		= alignment
	if format_value ~= nil then
		if type(format_value) == "table" then
			object.formats = format_value
		else
			object.value = format_value
		end
	end
	object.stringdefs		= {0.008,0.008,  -0.0048, 0}--VerticalSize, HorizontalSize, HorizontalSpacing, VerticalSpacing
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.collimated		= false
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= DEFAULT_LEVEL
	object.parent_element = parent
    Add(object)
end

function Add_Text(objectname, objectmaterial, objectalignment, objectparent, objectelementparams, objectcontrollers, format_value, stringdefs_value, initpixelposx, initpixelposy, level)
	local object			= CreateElement "ceStringPoly"
	object.name				= objectname
	object.material			= objectmaterial
	object.element_params	= objectelementparams
	object.controllers		= objectcontrollers
	object.init_pos			= {initpixelposx, -initpixelposy}

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
	object.collimated		= true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= level or DISPLAY_DEFAULT_LEVEL
	-- object.parent_element	= objectparent
	object.blend_mode		= blend_mode.IBM_REGULAR
    Add(object)
end

function Add_Text_With_Level(objectname, objectmaterial, objectalignment, objectparent, objectelementparams, objectcontrollers, format_value, stringdefs_value, initpixelposx, initpixelposy, level)
	local object			= CreateElement "ceStringPoly"
	object.name				= objectname
	object.material			= objectmaterial
	object.element_params	= objectelementparams
	object.controllers		= objectcontrollers
	object.init_pos			= {((initpixelposx - 0) * 1), (-(initpixelposy - 0) * 1)}

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
	object.collimated		= true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= level
	-- object.parent_element	= objectparent
	object.blend_mode		= blend_mode.IBM_REGULAR
    Add(object)
end

function Add_Thick_Line(objectbaseName, objectmaterial, objectIterations, lineLen, initpixelposx, initpixelposy, objectparent, objectelementparams, objectcontrollers, level)
	local y = objectIterations * 0.00075
	local x = 0.000244 * lineLen
		
	local element           = CreateElement "ceTexPoly"
	element.name            = objectbaseName
	element.primitivetype   = "triangles"
	element.vertices        = {
		{ 0, y },
		{ x, y },
		{ x, 0 },
		{ 0, 0 }
	}
	element.material        = objectmaterial
	element.indices         = default_box_indices
	element.init_pos        = { initpixelposx, initpixelposy }
	element.h_clip_relation = h_clip_relations.COMPARE
	element.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
	element.level           = level
	element.collimated      = false
	element.isvisible       = true
	element.use_mipfilter   = true
	element.additive_alpha  = true
	element.parent          = objectparent
	element.element_params  = objectelementparams
	element.controllers     = objectcontrollers
	Add(element)
end

function write_log(...)
	log.write('Herc PFD' .. (HDD_number and " " .. HDD_number or ""), log.INFO, ...)
end

function with_on_switch(...)
	local element, parameters, controllers
	if select("#", ...) == 2 then
		parameters, controllers = ...
	else
		element, parameters, controllers = ...
	end
	parameters, controllers = parameters or {}, controllers or {}

	add_controller(parameters, controllers, unpack(PFD_on_controller))
	add_controller(parameters, controllers, unpack(HDD_on_controller))

	if element then
		element.element_params = parameters
		element.controllers = controllers
	else
		return parameters, controllers
	end
end

function with_brightness(element, parameters, controllers)
	assert_type(element, {"userdata", "nil"}, "element", 1)
	parameters, controllers = parameters or {}, controllers or {}

	add_controller(parameters, controllers, "opacity_using_parameter", PFD_brightness_parameter)
	return with_on_switch(element, parameters, controllers)
end

local function change_brightness_with_parameter(parameters, controllers, parameter, r, g, b, a)
	parameters = parameters or {}
	controllers = controllers or {}

	local h, s, v, a = rgb_to_hsv(r, g, b, a) -- original color: #1b4dff
	for i, controller in ipairs(BCont) do
		local brightness_value = controller[3]
		local r_, g_, b_ = hsv_to_rgb(h, s, v * brightness_value, a)
		add_controller(parameters, controllers,
			"change_color_when_parameter_equal_to_number", parameter,
			brightness_value, rgb_byte_to_ratio(r_, g_, b_)
		)

	end
end

function make_rectangle_vertices(half_width, half_height)
	return {
		{-half_width,  half_height},
		{ half_width,  half_height},
		{ half_width, -half_height},
		{-half_width, -half_height}
	}
end

-- based on set_circle in elements_defs.lua
local function add_circle(verts, inds, radius_outer, radius_inner, arc, arc_center, x, y)
	local start_ind, start_vert = #inds, #verts
	local function set_ind(i, val)
		inds[i + start_ind] = val + start_vert
	end
	local function set_vert(i, val)
		val[1] = val[1] + x
		val[2] = val[2] + y
		verts[i + start_vert] = val
	end

	local solid    = radius_inner == nil or radius_inner == 0
	local arc      = arc or 360
	if    arc > 360 then arc = 360 end
	local count    = 32
	local delta    = math.rad(arc/count)

	set_vert(1, {0, 0}) -- center of circle

	local min_slice_index = -(count / 2) + arc_center / arc * count
	local min_i    = 1
	local max_i    = count + min_i
	for i = min_i, max_i do
		local start_angle = delta * (i - 1 + min_slice_index)
		if solid then
			-- add one isosceles triangle with equal sides joining at center of circle
			local start_ind = 3 * (i - 1)

			set_vert(i + 1, { radius_outer * math.sin(start_angle), radius_outer * math.cos(start_angle) })
			set_ind(start_ind + 1, 0)
			set_ind(start_ind + 2, i - 1) -- vertex added in previous execution of loop
			set_ind(start_ind + 3, i) -- vertex added in this execution of loop
		else
			-- add two triangles describing a quadrilateral with one side on the outer circle and another on the inner circle
			local start_ind = 6 * (i - 1)

			set_vert(2*(i - 1) + 1, { radius_outer * math.sin(start_angle), radius_outer * math.cos(start_angle) })
			set_vert(2*(i - 1) + 2, { radius_inner * math.sin(start_angle), radius_inner * math.cos(start_angle) })

			if i == max_i  then
			  if arc == 360 then
				set_ind(start_ind + 1, 2*(i     - 1))
				set_ind(start_ind + 2, 2*(min_i - 1))
				set_ind(start_ind + 3, 2*(i     - 1) + 1)
				set_ind(start_ind + 4, 2*(i     - 1) + 1)
				set_ind(start_ind + 5, 2*(min_i - 1))
				set_ind(start_ind + 6, 2*(min_i - 1) + 1)
			  end
			else
				set_ind(start_ind + 1, 2*(i - 1))
				set_ind(start_ind + 2, 2*(i))
				set_ind(start_ind + 3, 2*(i - 1) + 1)
				set_ind(start_ind + 4, 2*(i - 1) + 1)
				set_ind(start_ind + 5, 2*(i))
				set_ind(start_ind + 6, 2*(i)     + 1)
			end
		end
	end
end

-- x, y: center of bottom (when upward_direction is true) or top (when upward_direction is false) side
-- upward_direction: true if box extends up from (x, y), false if it extends down
function make_box_with_edge(name, rgb, x, y, half_width, half_height, upward_direction, level, parent, parameters, controllers)
	local r, g, b = rgb_hex_to_numbers(rgb)
	local a = 0xFF
	local material = MakeMaterial(nil, {r, g, b, a})

	local parameters = parameters or {}
	local controllers = controllers or {}

	change_brightness_with_parameter(parameters, controllers, PFD_brightness_parameter, r, g, b, a)
	with_on_switch(parameters, controllers)

	local height = 2 * half_height

	local vertices = upward_direction and {
		{-half_width,  height},
		{ half_width,  height},
		{ half_width,       0},
		{-half_width,       0},
	} or {
		{-half_width,       0},
		{ half_width,       0},
		{ half_width, -height},
		{-half_width, -height},
	}

	local element           = CreateElement "ceTexPoly"
	element.name            = name
	element.primitivetype   = "triangles"
	element.vertices        = vertices
	element.material        = material
	element.indices         = default_box_indices
	element.init_pos        = {x, y}
	-- element.init_rot        = {0, 0, 0} -- NOTE: degree NOT rad
	element.h_clip_relation = h_clip_relations.COMPARE
	element.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
	element.level           = level
	element.collimated      = false
	element.isvisible       = true
	element.use_mipfilter   = true
	element.additive_alpha  = true
	element.parent          = parent
	element.element_params  = parameters
	element.controllers     = controllers
	Add(element)
end

-- THANKS TO GRINNELLI
function rectangular_mask(name, width, height, x, y, level)
	local vertices = make_rectangle_vertices(width, height)
	local indices = default_box_indices

	local position = {x, y, 0}
	local rotation = {0, 0, 0}
	local blend = blend_mode.IBM_REGULAR_RGB_ONLY

	local function add_elem(name, material, h_clip_relation)
		local elem           = CreateElement "ceMeshPoly"
		elem.name            = name
		elem.primitivetype   = "triangles"
		elem.material        = material
		elem.vertices        = vertices
		elem.indices         = indices
		-- set_circle(elem, radius, 0, 120)
		elem.init_pos        = position
		elem.init_rot        = rotation
		elem.h_clip_relation = h_clip_relations[h_clip_relation]
		elem.blend_mode      = blend
		elem.level           = level
		elem.collimated      = false
		elem.isvisible       = false
		with_on_switch(elem)
		-- elem.parent_element			= PFD_parent
		Add(elem)
	end
	
	add_elem(name .. "_MASK_AREA", "green", "REWRITE_LEVEL")
	add_elem(name .. "_CLIP_MASK", "cyan", "INCREASE_IF_LEVEL")
end

function ADI_mask(width, height, x, y, level)
	local vertices = make_rectangle_vertices(width, height)
	local indices = shallow_clone(default_box_indices)
	local radius = 0.57
	add_circle(
		vertices, indices,
		radius, 0,
		115,
		0,
		0, 0.01
	)
	add_circle(
		vertices, indices,
		radius, 0,
		115,
		180,
		0, -0.01
	)

	local position = {x, y, 0}
	local rotation = {0, 0, 0}
	local blend = blend_mode.IBM_REGULAR_RGB_ONLY

	local function add_elem(name, material, h_clip_relation)
		local elem           = CreateElement "ceMeshPoly"
		elem.name            = name
		elem.primitivetype   = "triangles"
		elem.material        = material
		elem.vertices        = vertices
		elem.indices         = indices
		-- set_circle(elem, radius, 0, 120)
		elem.init_pos        = position
		elem.init_rot        = rotation
		elem.h_clip_relation = h_clip_relations[h_clip_relation]
		elem.blend_mode      = blend
		elem.level           = level
		elem.collimated      = false
		elem.isvisible       = false
		with_on_switch(elem)
		-- elem.parent_element			= PFD_parent
		Add(elem)
	end

	add_elem("ADI_MASK_AREA", "green", "REWRITE_LEVEL")
	add_elem("ADI_CLIP_MASK", "cyan", "INCREASE_IF_LEVEL")
end

function shallow_clone(t)
	local ret = {}
	for k, v in pairs(t) do
		ret[k] = v
	end
	return ret
end

-- Make a rectangle with an isosceles triangle cut out of one side of it.
function make_autopilot_reference_airspeed_indicator(name, material, opaque, x, y, rotation, long_side_len, short_side_len, triangle_base_len, triangle_height, level, parent, parameters, controllers)
	parameters = parameters or {}
	controllers = controllers or {}

	if opaque then
		with_on_switch(nil, parameters, controllers)
	else
		with_brightness(nil, parameters, controllers)
	end

	local half_long_side = long_side_len / 2
	local half_triangle_base = triangle_base_len / 2
	local vertices = {
		{half_long_side, 0}, {-half_long_side, 0}, -- corners touching long side of rectangle
		{half_long_side, short_side_len}, {-half_long_side, short_side_len}, -- corners touching sliced side of rectangle
		{half_triangle_base, short_side_len}, {-half_triangle_base, short_side_len}, -- corners touching base and legs of triangle
		{0, short_side_len - triangle_height},
	}
	local indices = {
		0, 1, 6,
		0, 2, 6,
		1, 3, 6,
		2, 4, 6,
		3, 5, 6,
	}

	local element           = CreateElement "ceTexPoly"
	element.name            = name
	element.primitivetype   = "triangles"
	element.material        = material
	element.vertices        = vertices
	element.indices         = indices
	element.init_pos        = {x, y}
	element.init_rot        = {rotation, 0}
	element.h_clip_relation = h_clip_relations.COMPARE
	element.blend_mode      = blend_mode.IBM_REGULAR_RGB_ONLY
	element.level           = level
	element.collimated      = false
	element.isvisible       = true
	element.use_mipfilter   = true
	element.additive_alpha  = true
	element.parent          = parent
	element.element_params  = parameters
	element.controllers     = controllers
	Add(element)
end
