

dofile(LockOn_Options.script_path.."DEBUG/definitions.lua")

local total_field_of_view 				= CreateElement "ceMeshPoly"
total_field_of_view.name 			= "total_field_of_view"
total_field_of_view.primitivetype 	= "triangles"
total_field_of_view.vertices 		=  {{-1,1},{1,1},{1,-1},{-1,-1}}
total_field_of_view.indices			=  {0,1,2,0,2,3}
total_field_of_view.init_pos		= {0, 0, 0}
total_field_of_view.material		= MakeMaterial(nil,{45,45,45,255})
total_field_of_view.element_params   = {"SHOW_DEBUG"} 
total_field_of_view.controllers 	   = {{"parameter_in_range",0,0.95,1.05}}
total_field_of_view.h_clip_relation = h_clip_relations.REWRITE_LEVEL
total_field_of_view.level			= DEBUG_DEFAULT_LEVEL
total_field_of_view.change_opacity	= false
total_field_of_view.collimated 		= false
total_field_of_view.isvisible		= true
Add(total_field_of_view)