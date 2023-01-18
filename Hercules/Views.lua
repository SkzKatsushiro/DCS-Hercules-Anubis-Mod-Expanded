
ViewSettings = {
	Cockpit = {
	[1] = {-- Pilot
		CockpitLocalPoint      = {13.0605, -0.7125, 0.0},--Cockpit nach = vorne,hoch
		CameraViewAngleLimits  = {20.000000,180.000000},
		CameraAngleRestriction = {true,220.000000,0.400000},
		CameraAngleLimits      = {220,-90.000000,90.000000},--Kopf drehen = links rechts,runter,hoch
		EyePoint               = {0.01000,0.000000,0.000000},--front/back,up/down,left/right}<-'neck dimension'in meters 
		limits_6DOF            = {x = {-22.500000,0.300000},--Bewegen = hinten vorne
								  y = {-1.500000,0.100000},--Bewegen = oben unten
								  z = {-1.5,1.5},--Bewegen = links rechts
								  roll = 90.000000},
		-- limits_6DOF            = {x = {-10.000000,10.000000},y ={-3.0000,3.000000},z = {-3.000000,3.000000},roll = 90},--Bewegen = hinten vorne,oben unten,links rechts
		ShoulderSize		   = 0.25,-- bewegt Körper, wenn Azimuth Wert mehr als 90 Grad
		Allow360rotation	   = false,
	},	
	[2] = {-- Copilot
		CockpitLocalPoint      = {13.0605, -0.7125, 0.0},--Cockpit nach = vorne,hoch
		CameraViewAngleLimits  = {20.000000,180.000000},
		CameraAngleRestriction = {true,220.000000,0.400000},
		CameraAngleLimits      = {220,-90.000000,90.000000},--Kopf drehen = links rechts,runter,hoch
		EyePoint               = {0.01000,0.000000,0.000000},--front/back,up/down,left/right}<-'neck dimension'in meters 
		limits_6DOF            = {x = {-22.500000,0.300000},--Bewegen = hinten vorne
								  y = {-1.500000,0.100000},--Bewegen = oben unten
								  z = {-1.5,1.5},--Bewegen = links rechts
								  roll = 90.000000},
		-- limits_6DOF            = {x = {-10.000000,10.000000},y ={-3.0000,3.000000},z = {-3.000000,3.000000},roll = 90},--Bewegen = hinten vorne,oben unten,links rechts
		ShoulderSize		   = 0.25,-- bewegt Körper, wenn Azimuth Wert mehr als 90 Grad
		Allow360rotation	   = false,
	},	
	}, -- Cockpit 
	Chase = {
		LocalPoint      = {-41.00,10.0,0.0},
		AnglesDefault   = {180.0,-8.0},
	}, -- Chase 
	Arcade = {
		LocalPoint      = {41.0,10.0,0.0},
		AnglesDefault   = {0.0,-8.0},
	}, -- Arcade 
}

local cockpit_shape_version = 1;
SnapViews = {
[1] = {-- player slot 1
	[1] = {--LWin + Num0 : Snap View 0
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[2] = {--LWin + Num1 : Snap View 1
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[3] = {--LWin + Num2 : Snap View 2
		viewAngle		= 75.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[4] = {--LWin + Num3 : Snap View 3
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[5] = {--LWin + Num4 : Snap View 4
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[6] = {--LWin + Num5 : Snap View 5
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[7] = {--LWin + Num6 : Snap View 6
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[8] = {--LWin + Num7 : Snap View 7
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[9] = {--LWin + Num8 : Snap View 8
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[10] = {--look at Cannon Target Station
		viewAngle		= 42.661049,--FOV
		hAngle			= 90.236580,
		vAngle			= -9.834731,
		x_trans			= -17.079090,
		y_trans			= -1.089753,
		z_trans			= -1.499472,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[11] = {--look at Battle Station
		viewAngle		= 75.000000,--FOV
		hAngle			= 39.678204,
		vAngle			= -19.342207,
		x_trans			= -3.938016,
		y_trans			= -1.410066,
		z_trans			= -0.478767,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[12] = {--look at Ramp Control Panel
		viewAngle		= 75.000000,--FOV
		hAngle			= 192.500000,
		vAngle			= -12.571758,
		x_trans			= -18.639912,
		y_trans			= -1.128595,
		z_trans			= -1.500000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[13] = {--default view
		viewAngle		= 75.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.187765,
		y_trans			= -0.054597,
		z_trans			= -0.529470,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[14] = {--default view - VR
		viewAngle		= 75.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.187765,
		y_trans			= -0.054597,
		z_trans			= -0.529470,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
},
[2] = {-- player slot 2
	[1] = {--LWin + Num0 : Snap View 0
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[2] = {--LWin + Num1 : Snap View 1
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[3] = {--LWin + Num2 : Snap View 2
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[4] = {--LWin + Num3 : Snap View 3
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[5] = {--LWin + Num4 : Snap View 4
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[6] = {--LWin + Num5 : Snap View 5
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[7] = {--LWin + Num6 : Snap View 6
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[8] = {--LWin + Num7 : Snap View 7
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[9] = {--LWin + Num8 : Snap View 8
		viewAngle		= 60.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.000000,
		y_trans			= 0.000000,
		z_trans			= 0.000000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[10] = {--look at Cannon Target Station
		viewAngle		= 42.661049,--FOV
		hAngle			= 90.236580,
		vAngle			= -9.834731,
		x_trans			= -17.079090,
		y_trans			= -1.089753,
		z_trans			= -1.499472,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[11] = {--look at Battle Station
		viewAngle		= 75.000000,--FOV
		hAngle			= 39.678204,
		vAngle			= -19.342207,
		x_trans			= -3.938016,
		y_trans			= -1.410066,
		z_trans			= -0.478767,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[12] = {--look at Ramp Control Panel
		viewAngle		= 75.000000,--FOV
		hAngle			= 192.500000,
		vAngle			= -12.571758,
		x_trans			= -18.639912,
		y_trans			= -1.128595,
		z_trans			= -1.500000,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[13] = {--default view
		viewAngle		= 75.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.187765,
		y_trans			= -0.054597,
		z_trans			= 0.529470,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
	[14] = {--default view - VR
		viewAngle		= 75.000000,--FOV
		hAngle			= 0.000000,
		vAngle			= 0.000000,
		x_trans			= 0.187765,
		y_trans			= -0.054597,
		z_trans			= 0.529470,
		rollAngle		= 0.000000,
		cockpit_version	= cockpit_shape_version,
	},
},
}


-- local function player(x,y)
-- return {	CockpitLocalPoint      = {x, y, 0},
			-- CameraViewAngleLimits  = {20.0, 140.0},
			-- CameraAngleRestriction = {false, 90.0, 0.5},
			-- CameraAngleLimits      = {200, -90.0, 90.0},
			-- EyePoint               = {0.05, 0.1, 0.0},
			-- ShoulderSize		   = 0.25,
			-- Allow360rotation	   = false,
			-- limits_6DOF            = {x = {-0.2, 0.3},y ={-0.2, 0.3},z = {-0.778865, 0.778865},roll = 90.0},--{x = {-0.15,0.25},y ={-0.15,0.075},z = {-0.170,0.170},roll = 90.000000},
		-- }
-- end

-- ViewSettings = {
	-- Cockpit = {
	-- player(4.0458, 0.9555),--Pilot
	-- player(4.0458, 0.9555),--Copilot
	-- player(4.0458, 0.9555),--Fire Control Officer
	-- player(4.0458, 0.9555),--Loadmaster
	-- }, -- Cockpit 
	-- Chase = {
		-- LocalPoint      = {-41.00,10.0,0.0},
		-- AnglesDefault   = {180.0,-8.0},
	-- }, -- Chase 
	-- Arcade = {
		-- LocalPoint      = {41.0,10.0,0.0},
		-- AnglesDefault   = {0.0,-8.0},
	-- }, -- Arcade 
-- }

-- local function head_pos_default(tab)
    -- if not tab then
	   -- tab = {}
	-- end
	-- tab.viewAngle = tab.viewAngle  or 75.0
	-- tab.hAngle    = tab.hAngle     or 0.0
	-- tab.vAngle    = tab.vAngle     or 0.0
	-- tab.x_trans   = tab.x_trans    or 0.0
	-- tab.y_trans   = tab.y_trans    or 0.0
	-- tab.z_trans   = tab.z_trans    or 0.0
	-- tab.rollAngle = tab.rollAngle  or 0.0
	
	-- return tab
-- end

-- local playerSnapViews = {
		-- [1]  = head_pos_default({}),--Num 0
		-- [2]  = head_pos_default({
					-- viewAngle = 75.0,--FOV
					-- hAngle	 = 0.0,
					-- vAngle	 = 0.0,
					-- x_trans	 = 0.0,
					-- y_trans	 = 0.0,
					-- z_trans	 = 0.0,
					-- rollAngle = 0.0,
					-- }),--LWin + Num1 : Snap View 1
		-- [3]  = head_pos_default({
					-- viewAngle = 75.0,--FOV
					-- hAngle	 = 0.0,
					-- vAngle	 = 0.0,
					-- x_trans	 = 0.0,
					-- y_trans	 = 0.0,
					-- z_trans	 = 0.0,
					-- rollAngle = 0.0,
					-- }),--LWin + Num2 : Snap View 2
		-- [4]  = head_pos_default({
					-- viewAngle = 75.0,--FOV
					-- hAngle	 = 0.0,
					-- vAngle	 = 0.0,
					-- x_trans	 = 0.0,
					-- y_trans	 = 0.0,
					-- z_trans	 = 0.0,
					-- rollAngle = 0.0,
					-- }),--LWin + Num3 : Snap View 3
		-- [5]  = head_pos_default({
					-- viewAngle = 75.0,--FOV
					-- hAngle	 = 0.0,
					-- vAngle	 = 0.0,
					-- x_trans	 = 0.0,
					-- y_trans	 = 0.0,
					-- z_trans	 = 0.0,
					-- rollAngle = 0.0,
					-- }),--LWin + Num4 : Snap View 4
		-- [6]  = head_pos_default({}),--LWin + Num5 : Snap View 5 - Default view
		-- [7]  = head_pos_default({
					-- viewAngle = 75.0,--FOV
					-- hAngle	 = 0.0,
					-- vAngle	 = 0.0,
					-- x_trans	 = 0.0,
					-- y_trans	 = 0.0,
					-- z_trans	 = 0.0,
					-- rollAngle = 0.0,
					-- }),--LWin + Num6 : Snap View 6
		-- [8]  = head_pos_default({
					-- viewAngle = 75.0,--FOV
					-- hAngle	 = 0.0,
					-- vAngle	 = 0.0,
					-- x_trans	 = 0.0,
					-- y_trans	 = 0.0,
					-- z_trans	 = 0.0,
					-- rollAngle = 0.0,
					-- }),--LWin + Num7 : Snap View 7 - Left Wing
		-- [9]  = head_pos_default({
					-- viewAngle = 75.0,--FOV
					-- hAngle	 = 0.0,
					-- vAngle	 = 0.0,
					-- x_trans	 = 0.0,
					-- y_trans	 = 0.0,
					-- z_trans	 = 0.0,
					-- rollAngle = 0.0,
					-- }),--LWin + Num8 : Snap View 8 - ARK
		-- [10] = head_pos_default({}),--Num 9
		-- [11] = head_pos_default({viewAngle = 75.0, vAngle = 0.0}),--look at left  mirror
		-- [12] = head_pos_default({viewAngle = 75.0, vAngle = 0.0}),--look at right mirror
		-- [13] = head_pos_default({}),--default view
		-- [14] = head_pos_default({y_trans = 0.0,}),--HMD view
-- }

-- SnapViews = 
-- {
-- [1] = playerSnapViews,
-- [2] = playerSnapViews,
-- [3] = playerSnapViews,
-- [4] = playerSnapViews,
-- }
