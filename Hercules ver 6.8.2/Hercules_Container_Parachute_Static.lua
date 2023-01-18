GT = {};
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC);
GT.chassis.life = 0.1
GT.visual.shape = "Hercules_Container_Parachute_Static"
GT.visual.shape_dstr = "Hercules_Container_Parachute_Static_Destroyed"
--Burning after hit
GT.visual.fire_size = 0 --relative burning size
GT.visual.fire_pos[1] = 0 -- center of burn at x axis shift(meters)
GT.visual.fire_pos[2] = 0.5 -- center of burn at z axis shift(meters)
GT.visual.fire_pos[3] = 0 -- center of burn at y axis shift(meters)
GT.visual.fire_time = 0 --burning time (seconds)
GT.time_agony = -1;

GT.Name = "Hercules_Container_Parachute_Static"
GT.DisplayName = _("Hercules container with parachute")
GT.Rate = 1;
GT.DetectionRange  = 0;
GT.ThreatRange = 0;
GT.mapclasskey = "P0091000076";
GT.attribute = {wsType_Static,
                "Fortifications",
                };
GT.category = "Fortification";
add_surface_unit(GT)


