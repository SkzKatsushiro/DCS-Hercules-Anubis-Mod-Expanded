local Script_path	= LockOn_Options.script_path..""

dofile(LockOn_Options.common_script_path.."elements_defs.lua")
-- dofile(LockOn_Options.script_path.."symbols.lua")
--[[
  SetScale(MILLYRADIANS)
	next elements will be scaled in millyrads
  SetScale(METERS)
        next elements will be scaled in meters
  SetScale(FOV)
        and again in FOV parts
--]]

SetScale(FOV)
SetScale(MILLYRADIANS)

GLASS_LEVEL  	  	  = 16
HUD_DEFAULT_LEVEL     = GLASS_LEVEL + 1  

CockpitScaleFac = 0.191 --scale 1024X1024 image into cockpit hud frame
CockpitPosFac = 0.382 --pos 1024X1024 image into cockpit hud frame
local object

function Add_Origin(object, objectname, objectparent, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	object	    = CreateElement "ceSimple"
	object.name 		= objectname
	object.init_pos = {((initpixelposx - 512) * CockpitPosFac), (-(initpixelposy - 512) * CockpitPosFac)}
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.collimated = true
	object.parent_element = objectparent
	Add(object)
end

function Add_Image(object, objectname, objectparent, objectmaterial, imagepixelsizex, imagepixelsizey, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	object	    = CreateElement "ceTexPoly"
	object.name 		= objectname
	object.material   = objectmaterial	   
	-- object.tex_params 		= tex_params -- {TextureSize, TextureSize, TextureScale, TextureScale}
	object.vertices 	   = {{-imagepixelsizex * CockpitScaleFac, imagepixelsizey * CockpitScaleFac},
					  {imagepixelsizex * CockpitScaleFac, imagepixelsizey * CockpitScaleFac},
					  {imagepixelsizex * CockpitScaleFac, -imagepixelsizey * CockpitScaleFac},
					  {-imagepixelsizex * CockpitScaleFac, -imagepixelsizey * CockpitScaleFac}}
	object.indices			= default_box_indices	
	object.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
	object.init_pos = {((initpixelposx - 512) * CockpitPosFac), (-(initpixelposy - 512) * CockpitPosFac)}
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.collimated = true
	object.parent_element = objectparent
	object.blend_mode 	=  blend_mode.IBM_REGULAR
    object.use_mipfilter    = true
	object.additive_alpha   = true
	object.h_clip_relation  = h_clip_relations.COMPARE
	object.level			= HUD_DEFAULT_LEVEL
	Add(object)
end

function Add_Text(object, objectname, objectmaterial, objectalignment, objectparent, objectelementparams, objectcontrollers, format_value, stringdefs_value, initpixelposx, initpixelposy)
	object           = CreateElement "ceStringPoly"
	object.name            = objectname
	object.material        = objectmaterial
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.init_pos = {((initpixelposx - 512) * CockpitPosFac), (-(initpixelposy - 512) * CockpitPosFac)}
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
	object.level			= HUD_DEFAULT_LEVEL
	object.parent_element = objectparent
    Add(object)
end

local num_points
local step
local Circle
local verts = {}
local inds = {}
function Add_Clip_Circular(object, objectname, objectparent, objectmaterial, imagepixelradius, initpixelposx, initpixelposy)
	object	    = CreateElement "ceMeshPoly"
	object.name 		= objectname
	object.primitivetype = "triangles"
	num_points = 32
	step = math.rad(360.0/num_points)
	Circle = CockpitScaleFac * imagepixelradius
	for i = 1, num_points do
		verts[i] = {Circle * math.cos(i * step), Circle * math.sin(i * step)}
	end
	object.vertices = verts
	j = 0
	for i = 0, 29 do
		j = j + 1
		inds[j] = 0
		j = j + 1
		inds[j] = i + 1
		j = j + 1
		inds[j] = i + 2
	end
	object.indices			= inds
	object.init_pos = {((initpixelposx - 512) * CockpitPosFac), (-(initpixelposy - 512) * CockpitPosFac)}
	object.material		= objectmaterial
	object.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
	object.level			= HUD_DEFAULT_LEVEL
	object.parent_element  = objectparent
	object.change_opacity	= false
	object.collimated 		= true
	object.isvisible		= false
	Add(object)
end

function Add_Clip_Rectangular(object, objectname, objectparent, objectmaterial, imagepixelsizex, imagepixelsizey, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	object 			 	 = CreateElement "ceMeshPoly"
	object.name 			 = objectname
	object.primitivetype = "triangles"
	object.vertices 	   = {{-imagepixelsizex * CockpitScaleFac, imagepixelsizey * CockpitScaleFac},
						  {imagepixelsizex * CockpitScaleFac, imagepixelsizey * CockpitScaleFac},
						  {imagepixelsizex * CockpitScaleFac, -imagepixelsizey * CockpitScaleFac},
						  {-imagepixelsizex * CockpitScaleFac, -imagepixelsizey * CockpitScaleFac}}
	object.indices 		 = default_box_indices
	object.init_pos = {((initpixelposx - 512) * CockpitPosFac), (-(initpixelposy - 512) * CockpitPosFac)}
	object.material		 = objectmaterial
	object.element_params = objectelementparams
	object.controllers = objectcontrollers
	object.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
	object.level			 = HUD_DEFAULT_LEVEL
	object.parent_element  = objectparent
	object.isdraw		 = true
	object.change_opacity = false
	object.collimated 		= true
	object.isvisible		 = false
	Add(object)
end

function Add_Object_Box(object, objectname, objectparent, objectmaterial, imagepixelsizex, imagepixelsizey, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	object	    = CreateElement "ceBoundingMeshBox"
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
	object.level 		    = HUD_DEFAULT_LEVEL	
	-- object.geometry_hosts		= {PFD_Engine_Status_origin.name}
	object.parent_element = objectparent
	AddElement(object)
end

function Add_Object_Line(object, objectname, objectparent, objectmaterial, imagepixelsizex, imagepixelsizey, initpixelposx, initpixelposy, objectelementparams, objectcontrollers)
	object	    = CreateElement "ceSimpleLineObject"
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
	object.level 		    = HUD_DEFAULT_LEVEL	
	-- object.geometry_hosts		= {PFD_Engine_Status_origin.name}
	object.parent_element = objectparent
	AddElement(object)
end







-- foo.element_params = {"FOO_PARAM", "FOO_PARAM2"}
-- foo.controllers = {
    -- {"move_up_down_using_parameter", 0, 0.1 },
    -- {"change_color_when_parameter_equal_to_number", 1, 1, 0.0,1.0,0.0},
	
	
	    -- {"change_color_when_parameter_equal_to_number", 1, 1, 1.0,0.5,0.0},
    -- {"change_color_when_parameter_equal_to_number", 1, 0.9, 0.9,0.45,0.0},
    -- {"change_color_when_parameter_equal_to_number", 1, 0.8, 0.8,0.40,0.0},
    -- {"change_color_when_parameter_equal_to_number", 1, 0.7, 0.7,0.35,0.0},