
local mainGear = {
	--amortizer_min_length					= 0.0,
	amortizer_max_length					= 0.342,
	amortizer_basic_length					= 0.342,
	amortizer_spring_force_factor			= 100000000.0 * 0.75,
	amortizer_spring_force_factor_rate		= 20.0 * 0.75,
	amortizer_static_force					= 79379 * 9.81 * 0.75,
	amortizer_reduce_length					= 0.342,
	allowable_hard_contact_length			= 0.342,
	amortizer_direct_damper_force_factor	= 1000000.0 * 0.75,
	amortizer_back_damper_force_factor		= 1000000.0 * 0.75,
			
	anti_skid_installed = true,

	crossover_locked_wheel_protection = true,
	crossover_locked_wheel_protection_speed_min = 18.0,
	anti_skid_improved = true,
	anti_skid_gain = 200.0,

	wheel_radius					= 1.344,
	wheel_static_friction_factor	= 1.0,
	wheel_glide_friction_factor		= 0.5,
	wheel_side_friction_factor		= 0.5,
	wheel_roll_friction_factor		= 0.1,
	wheel_brake_moment_max			= 800000.0,
	wheel_kz_factor					= 0.25,
	noise_k							= 0.2,
	wheel_damage_force_factor     = 250.0,
	wheel_damage_speed			   = 150.0,
}

HerculesFM = {
	center_of_mass		= {0.75, -1.5, 0.0},		-- C.G. 25% MAC, {x,y,z}, center of mass position relative to object 3d model center for empty weight aircraft
	moment_of_inertia 	= {2467589, 2709686, 4877639},	--Ix,Iy,Iz	kilogram meter^2--from Investigation of stability and control characteristics of AC130E aircraft linear models + 30%
	--(Ix, Iy, Iz, Ixy) in Conventional axes = (Ix, Iz, Iy, Ixz) in DCS axes
	
	zeroize_amortizers_before_collision_check = true,
	suspension 			= {
		{ -- NOSE WHEEL
			damage_element					= 83,
			wheel_axle_offset				= 0.2815,
			self_attitude					= false,
			yaw_limit						= math.rad(75.0),
			moment_limit					= 750.0,
			damper_coeff					= 300.0,

			amortizer_min_length					= 0.0,
			amortizer_max_length					= 0.342,
			amortizer_basic_length					= 0.342,
			amortizer_spring_force_factor			= 100000000.0 * 0.25,
			amortizer_spring_force_factor_rate		= 20.0 * 0.25,
			amortizer_static_force					= 79379 * 9.81 * 0.25,
			amortizer_reduce_length					= 0.342,
			allowable_hard_contact_length			= 0.342,
			amortizer_direct_damper_force_factor	= 1000000 * 0.25,
			amortizer_back_damper_force_factor		= 1000000 * 0.25,
			
			wheel_radius					= 0.873,
			wheel_static_friction_factor	= 1.0,
			wheel_glide_friction_factor		= 1.0,
			wheel_side_friction_factor		= 1.0,
			wheel_roll_friction_factor		= 0.1,
			wheel_kz_factor					= 0.3,
			noise_k							= 0.2,
			wheel_damage_force_factor     = 250.0,
			wheel_damage_speed			   = 150.0,

			arg_post			= 0,
			arg_amortizer		= 1,
			arg_wheel_rotation	= 101,
			arg_wheel_yaw		  = 2,
			arg_wheel_damage	= 135
		},
		{ -- LEFT WHEEL
			damage_element							= 84,

			--amortizer_min_length					= mainGear.amortizer_min_length,
			amortizer_max_length					= mainGear.amortizer_max_length,
			amortizer_basic_length					= mainGear.amortizer_basic_length,
			amortizer_spring_force_factor			= mainGear.amortizer_spring_force_factor, -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
			amortizer_spring_force_factor_rate		= mainGear.amortizer_spring_force_factor_rate,
			amortizer_static_force					= mainGear.amortizer_static_force,
			amortizer_reduce_length					= mainGear.amortizer_reduce_length,
			allowable_hard_contact_length			= mainGear.allowable_hard_contact_length,
			amortizer_direct_damper_force_factor	= mainGear.amortizer_direct_damper_force_factor, 
			amortizer_back_damper_force_factor		= mainGear.amortizer_back_damper_force_factor, 

			anti_skid_installed = mainGear.anti_skid_installed,

			crossover_locked_wheel_protection			= mainGear.crossover_locked_wheel_protection,
			crossover_locked_wheel_protection_wheel		= 2,
			crossover_locked_wheel_protection_speed_min	= mainGear.crossover_locked_wheel_protection_speed_min,
			anti_skid_improved							= mainGear.anti_skid_improved;
			anti_skid_gain								= mainGear.anti_skid_gain,

			wheel_radius					= mainGear.wheel_radius,
			wheel_static_friction_factor	= mainGear.wheel_static_friction_factor,
			wheel_side_friction_factor		= mainGear.wheel_side_friction_factor,
			wheel_roll_friction_factor		= mainGear.wheel_roll_friction_factor,
			wheel_glide_friction_factor		= mainGear.wheel_glide_friction_factor,
			wheel_brake_moment_max			= mainGear.wheel_brake_moment_max,
			wheel_kz_factor					= mainGear.wheel_kz_factor,
			noise_k							= mainGear.noise_k,
			wheel_damage_force_factor		= mainGear.wheel_damage_force_factor,
			wheel_damage_speed			    = mainGear.wheel_damage_speed,

			arg_post			= 5,
			arg_amortizer		= 6,
			arg_wheel_rotation	= 103,
			arg_wheel_damage	= 137
		},
		{  -- RIGHT WHEEL
			damage_element							= 85,

			--amortizer_min_length					= mainGear.amortizer_min_length,
			amortizer_max_length					= mainGear.amortizer_max_length,
			amortizer_basic_length					= mainGear.amortizer_basic_length,
			amortizer_spring_force_factor			= mainGear.amortizer_spring_force_factor, -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
			amortizer_spring_force_factor_rate		= mainGear.amortizer_spring_force_factor_rate,
			amortizer_static_force					= mainGear.amortizer_static_force,
			amortizer_reduce_length					= mainGear.amortizer_reduce_length,
			allowable_hard_contact_length			= mainGear.allowable_hard_contact_length,
			amortizer_direct_damper_force_factor	= mainGear.amortizer_direct_damper_force_factor, 
			amortizer_back_damper_force_factor		= mainGear.amortizer_back_damper_force_factor, 

			anti_skid_installed = mainGear.anti_skid_installed,

			crossover_locked_wheel_protection			= mainGear.crossover_locked_wheel_protection,
			crossover_locked_wheel_protection_wheel		= 1,
			crossover_locked_wheel_protection_speed_min	= mainGear.crossover_locked_wheel_protection_speed_min,
			anti_skid_improved							= mainGear.anti_skid_improved;
			anti_skid_gain								= mainGear.anti_skid_gain,

			wheel_radius					= mainGear.wheel_radius,
			wheel_static_friction_factor	= mainGear.wheel_static_friction_factor,
			wheel_side_friction_factor		= mainGear.wheel_side_friction_factor,
			wheel_roll_friction_factor		= mainGear.wheel_roll_friction_factor,
			wheel_glide_friction_factor		= mainGear.wheel_glide_friction_factor,
			wheel_brake_moment_max			= mainGear.wheel_brake_moment_max,
			wheel_kz_factor					= mainGear.wheel_kz_factor,
			noise_k							= mainGear.noise_k,
			wheel_damage_force_factor		= mainGear.wheel_damage_force_factor,
			wheel_damage_speed			    = mainGear.wheel_damage_speed,

			arg_post			= 3,
			arg_amortizer		= 4,
			arg_wheel_rotation	= 102,
			arg_wheel_damage	= 136
		},
	}, 
}

-- wheel_static_friction_factor = 0.65 , -- (unitless) Static friction factor when wheel not moves - means fully braked, wheels cant roll - static - therefore same highest value for side friction
-- wheel_glide_friction_factor = 0.28 , glide/slide friction factor when wheel not rolls/ not rotating but sliding - means fully braked, wheels cant roll - non static/aircraft is moving - therefore 2nd highest value 
-- wheel_roll_friction_factor = 0.025, -- (unitless) Rolling friction factor when wheel moves - rotating/rolling/turning wheels - no brake - lowest value - all ok - plane rolling on taxiway
-- wheel_damage_force_factor = 250.0, when tyre is exploding - extreme hard landing
-- wheel_brake_moment_max = 15000, -- (N-m) Max braking moment torque but it not means tires cannot roll...it means max brake strength,
-- so if the plane is moving and the brake stopped wheel turning/rolling then will produce the glide_friction_factor values

-- damage_omega = 30.0, -- (deg?) speed threshold of jamming during impact of rotation limiter
-- state_angle_0 = 6.131341662, -- (deg?) designed angle of retracted gear with horizontal axis of plane
-- state_angle_1 = -2.995164152, -- (deg?) designed angle of released gear with vertical axis of plane
-- mount_pivot_x = -0.274, -- (m) X-coordinate of attachment to fuselage in body-axis system
-- mount_post_radius = 0.657, -- (m) distance from strut-axis to attachment point of piston to gear stand
-- mount_length = 0.604555117, -- (m) What is the difference between this and the post_radius? length of angle brace in retracted configuration
-- mount_angle_1 = -3.138548523, -- (deg?) length of Position (vector) from attaxhment point
-- post_length = 1.748, -- (m) distance from rotation-axis of strut to wheel-axis
-- wheel_axle_offset = 0.05, -- (m) displacement wheel axis relative to strut
-- self_attitude = false, -- true if gear is self-oriented (Alba or Yak-52 example)
-- amortizer_min_length = 0.0, -- (m) rate of (minimum spring lenght / minimum length of damper)
-- amortizer_max_length = 0.397, -- (m) same as previous but max length

-- amortizer_basic_length = 0.397, -- (m) rate of (spring length in free (without load) condition / damper length in free (without load) condition)
-- amortizer_spring_force_factor = 1.6e+13, -- (??) spring tension factor (see k Wik)
-- amortizer_spring_force_factor_rate = 20.0, -- (??) Степень probably not full comment
-- amortizer_static_force = 80000.0, -- (N?) static reaction force of damper
-- amortizer_reduce_length = 0.377, -- (m) total suspension compression distance in non-load condition 
-- amortizer_direct_damper_force_factor = 45000.0, -- (??) damper of positive movement
-- amortizer_back_damper_force_factor = 15000.0, -- (??) damper of negative (reversed) movement

-- wheel_radius = 0.308, -- (m) Tire radius
-- wheel_static_friction_factor = 0.65 , -- (unitless) Static friction factor when wheel not moves
-- wheel_roll_friction_factor = 0.025, -- (unitless) Rolling friction factor when wheel not moves
-- wheel_damage_force_factor = 250.0, wheel cover (tire) strength force (not sure)
-- wheel_brake_moment_max = 15000, -- (N-m) Max braking moment torque 


-- suspension = 
-- {
	-- {
		-- mass  			  = 200,
		-- pos   			  = {1,0,0},
		-- moment_of_inertia = {1000,1000,1000},
		
		
		-- damage_element	    = 83,
		-- damage_omega	    = 30.0,
		-- state_angle_0	    =  6.131341662,
		-- state_angle_1	    = -2.995164152,
		-- mount_pivot_x	    = -0.274,
		-- mount_pivot_y	    = -0.118,
		-- mount_post_radius   = 0.657,
		-- mount_length	   	= 0.604555117,
		-- mount_angle_1	   	= -3.138548523,
		-- post_length	   		= 1.748,
		-- wheel_axle_offset 	= 0.05,
		-- self_attitude	    = false,
		-- yaw_limit		    = math.rad(89.0),
		-- damper_coeff	    = 30.0,
		

		-- amortizer_min_length					= 0.0,
		-- amortizer_max_length					= 0.397,
		-- amortizer_basic_length					= 0.397,
		-- amortizer_spring_force_factor			= 1.6e+13,
		-- amortizer_spring_force_factor_rate		= 20.0,
		-- amortizer_static_force					= 80000.0,
		-- amortizer_reduce_length					= 0.377,
		-- amortizer_direct_damper_force_factor	= 45000.0,
		-- amortizer_back_damper_force_factor		= 15000.0,


		-- wheel_radius				   = 0.308,
		-- wheel_static_friction_factor  = 0.65 ,
		-- wheel_side_friction_factor    = 0.65 ,
		-- wheel_roll_friction_factor    = 0.025,
		-- wheel_glide_friction_factor   = 0.28 ,
		-- wheel_damage_force_factor     = 250.0,
		-- wheel_damage_speed			   = 150.0,


		 -- wheel_moment_of_inertia   = 3.6, --wheel moi as rotation body

		 -- wheel_brake_moment_max = 15000.0, -- maximum value of braking moment  , N*m 
		
		-- arg_post			  = 0,
		-- arg_amortizer		  = 1,
		-- arg_wheel_rotation    = 76,
		-- arg_wheel_yaw		  = 2,
		-- collision_shell_name  = "WHEEL_F",
	-- },
	-- {
		-- mass  			  = 200,
		-- pos   			  = {0,0,-1},
		-- moment_of_inertia = {1000,1000,1000},
		
		
		-- damage_element	    = 83,
		-- damage_omega	    = 30.0,
		-- state_angle_0	    =  6.131341662,
		-- state_angle_1	    = -2.995164152,
		-- mount_pivot_x	    = -0.274,
		-- mount_pivot_y	    = -0.118,
		-- mount_post_radius   = 0.657,
		-- mount_length	   	= 0.604555117,
		-- mount_angle_1	   	= -3.138548523,
		-- post_length	   		= 1.748,
		-- wheel_axle_offset 	= 0.05,
		-- self_attitude	    = false,
		-- yaw_limit		    = math.rad(89.0),
		-- damper_coeff	    = 30.0,
		

		-- amortizer_min_length					= 0.0,
		-- amortizer_max_length					= 0.397,
		-- amortizer_basic_length					= 0.397,
		-- amortizer_spring_force_factor			= 1.6e+13,
		-- amortizer_spring_force_factor_rate		= 20.0,
		-- amortizer_static_force					= 80000.0,
		-- amortizer_reduce_length					= 0.377,
		-- amortizer_direct_damper_force_factor	= 45000.0,
		-- amortizer_back_damper_force_factor		= 15000.0,


		-- wheel_radius				   = 0.308,
		-- wheel_static_friction_factor  = 0.65 ,
		-- wheel_side_friction_factor    = 0.65 ,
		-- wheel_roll_friction_factor    = 0.025,
		-- wheel_glide_friction_factor   = 0.28 ,
		-- wheel_damage_force_factor     = 250.0,
		-- wheel_damage_speed			   = 150.0,
		 -- wheel_moment_of_inertia   = 3.6, --wheel moi as rotation body

		 -- wheel_brake_moment_max = 15000.0, -- maximum value of braking moment  , N*m 
		
		-- arg_post			  = 3,
		-- arg_amortizer		  = 4,
		-- arg_wheel_rotation    = 77,
		-- arg_wheel_yaw		  = -1,
		-- collision_shell_name  = "WHEEL_L",
	-- },
	-- {
		-- mass  			  = 200,
		-- pos   			  = {0,0,1},
		-- moment_of_inertia = {1000,1000,1000},
		
		
		-- damage_element	    = 83,
		-- damage_omega	    = 30.0,
		-- state_angle_0	    =  6.131341662,
		-- state_angle_1	    = -2.995164152,
		-- mount_pivot_x	    = -0.274,
		-- mount_pivot_y	    = -0.118,
		-- mount_post_radius   = 0.657,
		-- mount_length	   	= 0.604555117,
		-- mount_angle_1	   	= -3.138548523,
		-- post_length	   		= 1.748,
		-- wheel_axle_offset 	= 0.05,
		-- self_attitude	    = false,
		-- yaw_limit		    = math.rad(89.0),
		-- damper_coeff	    = 30.0,
		

		-- amortizer_min_length					= 0.0,
		-- amortizer_max_length					= 0.397,
		-- amortizer_basic_length					= 0.397,
		-- amortizer_spring_force_factor			= 1.6e+13,
		-- amortizer_spring_force_factor_rate		= 20.0,
		-- amortizer_static_force					= 80000.0,
		-- amortizer_reduce_length					= 0.377,
		-- amortizer_direct_damper_force_factor	= 45000.0,
		-- amortizer_back_damper_force_factor		= 15000.0,


		-- wheel_radius				   = 0.308,
		-- wheel_static_friction_factor  = 0.65 ,
		-- wheel_side_friction_factor    = 0.65 ,
		-- wheel_roll_friction_factor    = 0.025,
		-- wheel_glide_friction_factor   = 0.28 ,
		-- wheel_damage_force_factor     = 250.0,
		-- wheel_damage_speed			   = 150.0,
		 -- wheel_moment_of_inertia   = 3.6, --wheel moi as rotation body

		 -- wheel_brake_moment_max = 15000.0, -- maximum value of braking moment  , N*m 
		
		-- arg_post			  = 5,
		-- arg_amortizer		  = 6,
		-- arg_wheel_rotation    = 77,
		-- arg_wheel_yaw		  = -1,
		-- collision_shell_name  = "WHEEL_R",
	-- },
-- }

