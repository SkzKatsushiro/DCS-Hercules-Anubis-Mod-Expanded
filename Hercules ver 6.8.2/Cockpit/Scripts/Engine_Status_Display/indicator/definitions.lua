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
	-- object.h_clip_relation  = object.h_clip_relation or h_clip_relations.COMPARE
	object.level			= level or DISPLAY_DEFAULT_LEVEL
	object.h_clip_relation  = h_clip_relations.COMPARE
	-- object.level			= DISPLAY_DEFAULT_LEVEL
	object.blend_mode 	=  blend_mode.IBM_REGULAR
	object.collimated = true
	object.indices = default_box_indices	
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




-- foo.element_params = {"FOO_PARAM", "FOO_PARAM2"}
-- foo.controllers = {
    -- {"move_up_down_using_parameter", 0, 0.1 },
    -- {"change_color_when_parameter_equal_to_number", 1, 1, 0.0,1.0,0.0},
	
	
	    -- {"change_color_when_parameter_equal_to_number", 1, 1, 1.0,0.5,0.0},
    -- {"change_color_when_parameter_equal_to_number", 1, 0.9, 0.9,0.45,0.0},
    -- {"change_color_when_parameter_equal_to_number", 1, 0.8, 0.8,0.40,0.0},
    -- {"change_color_when_parameter_equal_to_number", 1, 0.7, 0.7,0.35,0.0},