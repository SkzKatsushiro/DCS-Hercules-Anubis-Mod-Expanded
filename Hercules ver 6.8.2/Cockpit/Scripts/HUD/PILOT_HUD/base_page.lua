local Script_path	= LockOn_Options.script_path..""

dofile(Script_path.."HUD/PILOT_HUD/definitions.lua")


-- imagepixelsizex  	   = 196.2913907--dimensions of glass in cockpit
-- local halfheight 	   = 152.4503311
-- init_pos = {(0.26490066 * initpixelposx) - 196.29139, (-0.26490066 * initpixelposy) + 152.4503311} --pixelpos on a 1482 by 1152 image
-- vertices 	   = {{-imagepixelsizex * CockpitScaleFac, imagepixelsizey * CockpitScaleFac},
					  -- { width, height},
					  -- { width,-height},
					  -- {-width,-height}}

-- local CockpitScaleFac = 0.191 --scale 1024X1024 image into cockpit hud frame
-- local CockpitPosFac = 0.382 --pos 1024X1024 image into cockpit hud frame

local glass1 			 	 = CreateElement "ceMeshPoly"
glass1.name 			 = "glass1"
glass1.primitivetype = "triangles"
glass1.vertices 	   = {{-1015 * CockpitScaleFac, 418 * CockpitScaleFac},
					  {1015 * CockpitScaleFac, 418 * CockpitScaleFac},
					  {1015 * CockpitScaleFac, -418 * CockpitScaleFac},
					  {-1015 * CockpitScaleFac, -418 * CockpitScaleFac}}
glass1.indices 		 = default_box_indices
glass1.init_pos		 =  {0, 0} 
glass1.init_rot		 = {0, 0} 
glass1.material		 = MakeMaterial(nil,{255,0,0,20})--red
glass1.h_clip_relation = h_clip_relations.REWRITE_LEVEL
glass1.level			 = GLASS_LEVEL
glass1.isdraw		 = true
glass1.change_opacity = false
glass1.isvisible		 = false
Add(glass1)

local glass2 			 	 = CreateElement "ceMeshPoly"
glass2.name 			 = "glass2"
glass2.primitivetype = "triangles"
glass2.vertices 	   = {{-650 * CockpitScaleFac, 785 * CockpitScaleFac},
					  {650 * CockpitScaleFac, 785 * CockpitScaleFac},
					  {650 * CockpitScaleFac, -785 * CockpitScaleFac},
					  {-650 * CockpitScaleFac, -785 * CockpitScaleFac}}
glass2.indices 		 = default_box_indices
glass2.init_pos		 =  {0, 0} 
glass2.init_rot		 = {0, 0} 
glass2.material		 = MakeMaterial(nil,{255,0,0,20})--red
glass2.h_clip_relation = h_clip_relations.REWRITE_LEVEL
glass2.level			 = GLASS_LEVEL
glass2.isdraw		 = true
glass2.change_opacity = false
glass2.isvisible		 = false
Add(glass2)

local glass3 			 	 = CreateElement "ceMeshPoly"
glass3.name 			 = "glass3"
glass3.primitivetype = "triangles"
glass3.vertices 	   = {{-260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, -129.5 * CockpitScaleFac},
					  {-260 * CockpitScaleFac, -129.5 * CockpitScaleFac}}
glass3.indices 		 = default_box_indices
glass3.init_pos = {((141.6 - 512) * CockpitPosFac), (-(256.9 - 512) * CockpitPosFac)}
glass3.init_rot		 = {45, 0} 
glass3.material		 = MakeMaterial(nil,{255,0,0,20})--red
glass3.h_clip_relation = h_clip_relations.REWRITE_LEVEL
glass3.level			 = GLASS_LEVEL
glass3.isdraw		 = true
glass3.change_opacity = false
glass3.isvisible		 = false
Add(glass3)

local glass4 			 	 = CreateElement "ceMeshPoly"
glass4.name 			 = "glass4"
glass4.primitivetype = "triangles"
glass4.vertices 	   = {{-260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, -129.5 * CockpitScaleFac},
					  {-260 * CockpitScaleFac, -129.5 * CockpitScaleFac}}
glass4.indices 		 = default_box_indices
glass4.init_pos = {(-(141.6 - 512) * CockpitPosFac), (-(256.9 - 512) * CockpitPosFac)}
glass4.init_rot		 = {-45, 0} 
glass4.material		 = MakeMaterial(nil,{255,0,0,20})--red
glass4.h_clip_relation = h_clip_relations.REWRITE_LEVEL
glass4.level			 = GLASS_LEVEL
glass4.isdraw		 = true
glass4.change_opacity = false
glass4.isvisible		 = false
Add(glass4)

local glass5 			 	 = CreateElement "ceMeshPoly"
glass5.name 			 = "glass5"
glass5.primitivetype = "triangles"
glass5.vertices 	   = {{-260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, -129.5 * CockpitScaleFac},
					  {-260 * CockpitScaleFac, -129.5 * CockpitScaleFac}}
glass5.indices 		 = default_box_indices
glass5.init_pos = {(-(141.6 - 512) * CockpitPosFac), ((256.9 - 512) * CockpitPosFac)}
glass5.init_rot		 = {45, 0} 
glass5.material		 = MakeMaterial(nil,{255,0,0,20})--red
glass5.h_clip_relation = h_clip_relations.REWRITE_LEVEL
glass5.level			 = GLASS_LEVEL
glass5.isdraw		 = true
glass5.change_opacity = false
glass5.isvisible		 = false
Add(glass5)

local glass6 			 	 = CreateElement "ceMeshPoly"
glass6.name 			 = "glass6"
glass6.primitivetype = "triangles"
glass6.vertices 	   = {{-260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, 129.5 * CockpitScaleFac},
					  {260 * CockpitScaleFac, -129.5 * CockpitScaleFac},
					  {-260 * CockpitScaleFac, -129.5 * CockpitScaleFac}}
glass6.indices 		 = default_box_indices
glass6.init_pos = {((141.6 - 512) * CockpitPosFac), ((256.9 - 512) * CockpitPosFac)}
glass6.init_rot		 = {-45, 0} 
glass6.material		 = MakeMaterial(nil,{255,0,0,20})--red
glass6.h_clip_relation = h_clip_relations.REWRITE_LEVEL
glass6.level			 = GLASS_LEVEL
glass6.isdraw		 = true
glass6.change_opacity = false
glass6.isvisible		 = false
Add(glass6)

local FOV 			 	 = CreateElement "ceMeshPoly"
FOV.name 			 = "FOV"
FOV.primitivetype = "triangles"
FOV.vertices 	   = {{-1015 * CockpitScaleFac, 785 * CockpitScaleFac},
					  {1015 * CockpitScaleFac, 785 * CockpitScaleFac},
					  {1015 * CockpitScaleFac, -785 * CockpitScaleFac},
					  {-1015 * CockpitScaleFac, -785 * CockpitScaleFac}}
FOV.indices 		 = default_box_indices
FOV.init_pos		 =  {0, 0} 
FOV.init_rot		 = {0, 0} 
FOV.material		 = MakeMaterial(nil,{0, 255, 0, 45})--green
FOV.element_params   = {
								"AC",
								"PILOT_HudVisibility",
										   } 
FOV.controllers 	   = {
								{"parameter_in_range",0,111,116},
								{"parameter_in_range",1,0.95,1.05},
								}
FOV.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
FOV.level			 = GLASS_LEVEL
FOV.isdraw		 = true
FOV.change_opacity = false
FOV.isvisible		 = false
Add(FOV)


-- local total_field_of_view = CreateElement "ceMeshPoly"
-- total_field_of_view.name = "total_field_of_view"
-- total_field_of_view.primitivetype = "triangles"

-- num_points = 32
-- step = math.rad(360.0/num_points)
-- TFOV  = 0.13245033*1600.0--circle of 1600 on a 1482 by 1151 image will cover glass exactly = 211.92
-- verts = {}
-- for i = 1, num_points do
	-- verts[i] = {TFOV * math.cos(i * step), TFOV * math.sin(i * step)}
-- end

-- total_field_of_view.vertices = verts

-- inds = {}
-- j = 0
-- for i = 0, 29 do
	-- j = j + 1
	-- inds[j] = 0
	-- j = j + 1
	-- inds[j] = i + 1
	-- j = j + 1
	-- inds[j] = i + 2
-- end

-- total_field_of_view.indices			= inds
-- total_field_of_view.init_pos		= {0, 0, 0}
-- total_field_of_view.material		= MakeMaterial(nil,{0, 255, 0, 15})--green
-- total_field_of_view.element_params   = {
								-- -- "Avionics_power",
								-- -- "HudBrightness",
										   -- } 
-- total_field_of_view.controllers 	   = {
								-- -- {"parameter_in_range",0,0.95,1.05},
								-- -- {"opacity_using_parameter",1},
								-- }
-- total_field_of_view.h_clip_relation = h_clip_relations.INCREASE_IF_LEVEL
-- total_field_of_view.level			= HUD_PILOT_DEFAULT_LEVEL - 1
-- total_field_of_view.change_opacity	= false
-- total_field_of_view.collimated 		= true
-- total_field_of_view.isvisible		= DrawVisible
-- Add(total_field_of_view)

