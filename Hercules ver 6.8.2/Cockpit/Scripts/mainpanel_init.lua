
shape_name   = "Hercules_Cockpit"
is_EDM			   = true
new_model_format   = true


ambient_light    = {255,255,255}
ambient_color_day_texture    = {72, 100, 160}
ambient_color_night_texture  = {40, 60 ,150}
ambient_color_from_devices   = {50, 50, 40}
ambient_color_from_panels	 = {35, 25, 25}

dusk_border					 = 0.4
draw_pilot					 = false

day_texture_set_value   = 0.0
night_texture_set_value = 0.1



-- mirrors_data =
-- {
    -- center_point 	  = {0.710,0.03,0},
    -- width 			  = 1.4, --integrated (keep in mind that mirrors can be none planar )
    -- aspect 			  = 0.8/0.3,
	-- rotation 	 	  = math.rad(1);
	-- animation_speed   = 2.0;
	-- arg_value_when_on = 1.0;
-- }

-- local controllers = LoRegisterPanelControls()

-- mirrors_data =
-- {
    -- center_point 	= {0.6,0.40,0.00},
    -- width 		 	= 0.3,
    -- aspect 		 	= 1.7,
	-- rotation 	 	= math.rad(-20);
	-- animation_speed = 2.0;
	-- near_clip 		= 0.1;
	-- middle_clip		= 10;
	-- far_clip		= 60000;
-- }

-- mirrors_draw                    = CreateGauge()
-- mirrors_draw.arg_number    		= 16
-- mirrors_draw.input   			= {0,1}
-- mirrors_draw.output   			= {1,0}
-- mirrors_draw.controller         = controllers.mirrors_draw

--=================================================

-- local degrees_per_radian = 57.2957795
-- Gauges
-- Attitude Direction Indicator
-- ADI_Pitch					= CreateGauge()
-- ADI_Pitch.arg_number		= 1301
-- ADI_Pitch.input				= {-90 / degrees_per_radian, 90 / degrees_per_radian}
-- ADI_Pitch.output			= {-1.0, 1.0}
-- ADI_Pitch.controller		= controllers.base_gauge_Pitch

-- ADI_Bank					= CreateGauge()
-- ADI_Bank.arg_number			= 1302
-- ADI_Bank.input				= {-180 / degrees_per_radian, 180 / degrees_per_radian}
-- ADI_Bank.output				= {-1.0, 1.0}
-- ADI_Bank.controller			= controllers.base_gauge_Roll

-- ADI_Slipball				= CreateGauge()
-- ADI_Slipball.arg_number		= 1303
-- ADI_Slipball.input			= {-0.20, 0.20}
-- ADI_Slipball.output			= {-1.0, 1.0}
-- ADI_Slipball.controller		= controllers.base_gauge_AngleOfSlide

-- local angle_of_bank = math.atan( ( 2 * math.pi * TrueAirSpeed) / ( 9.81 * 60 ) )
-- TAS/10 + 7
	-- print_message_to_user(string.format("angle_of_bank %d", angle_of_bank))
-- ADI_TurnNeedle				= CreateGauge()
-- ADI_TurnNeedle.arg_number	= 1304
-- ADI_TurnNeedle.input		= {-30 / degrees_per_radian, 30 / degrees_per_radian}
-- ADI_TurnNeedle.output		= {-1.0, 1.0}
-- ADI_TurnNeedle.controller	= controllers.base_gauge_Roll

-- local tacview_path = LockOn_Options.script_path.."Scripts/TACVIEW/indicator/TPOD/TPOD_COMMON_DATA.lua"
-- local mychunk = loadfile(LockOn_Options.script_path.."Scripts/TACVIEW/indicator/TPOD/TPOD_COMMON_DATA.lua")
-- dofile(LockOn_Options.script_path.."devices.lua")
-- local cpt_mech         = GetDevice(devices.TGTPOD)

-- tpod_tgt_hgt_value				= CreateGauge()
-- tpod_tgt_hgt_value.arg_number	= 1327
-- tpod_tgt_hgt_value.input		= {-1.0, 1.0}
-- tpod_tgt_hgt_value.output		= {-1.0, 1.0}
-- tpod_tgt_hgt_value.controller	= tpod_tgt_hgt.controllers

-- PowerOnOffButton_param      			  = CreateGauge("parameter")
-- PowerOnOffButton_param.parameter_name   = "PowerOnOffButton"
-- PowerOnOffButton_param.arg_number    	  = 100
-- PowerOnOffButton_param.input    		  = {0.0, 1.0}
-- PowerOnOffButton_param.output    		  = {0.0, 1.0}

-- Conditionlever12_param      			  = CreateGauge("parameter")
-- Conditionlever12_param.parameter_name   = "Conditionlever12"
-- Conditionlever12_param.arg_number    	  = 103
-- Conditionlever12_param.input    		  = {0.0, 1.0}
-- Conditionlever12_param.output    		  = {0.0, 1.0}

-- Conditionlever34_param      			  = CreateGauge("parameter")
-- Conditionlever34_param.parameter_name   = "Conditionlever34"
-- Conditionlever34_param.arg_number    	  = 105
-- Conditionlever34_param.input    		  = {0.0, 1.0}
-- Conditionlever34_param.output    		  = {0.0, 1.0}

-- FlapIndicator     			  = CreateGauge("parameter")
-- FlapIndicator.parameter_name   = "FLAP_POS"
-- FlapIndicator.arg_number    	  = 1306
-- FlapIndicator.input    		  = {0.0, 100.0}
-- FlapIndicator.output    		  = {0.0, 1.0}

-- AileronTrimIndicator     			  = CreateGauge("parameter")
-- AileronTrimIndicator.parameter_name   = "TRIM_ROLL"
-- AileronTrimIndicator.arg_number    	  = 1307
-- AileronTrimIndicator.input    		  = {-0.33, 0.33}
-- AileronTrimIndicator.output    		  = {-1.0, 1.0}

-- RudderTrimIndicator     			  = CreateGauge("parameter")
-- RudderTrimIndicator.parameter_name   = "TRIM_YAW"
-- RudderTrimIndicator.arg_number    	  = 1308
-- RudderTrimIndicator.input    		  = {-0.33, 0.33}
-- RudderTrimIndicator.output    		  = {1.0, -1.0}

-- ElevatorTrimIndicator     			  = CreateGauge("parameter")
-- ElevatorTrimIndicator.parameter_name   = "TRIM_PITCH"
-- ElevatorTrimIndicator.arg_number    	  = 1309
-- ElevatorTrimIndicator.input    		  = {-0.11, 0.33}
-- ElevatorTrimIndicator.output    		  = {-0.33, 1.0}

-- MagneticCompass_Rot     			  = CreateGauge("parameter")
-- MagneticCompass_Rot.parameter_name   = "CURRENT_HDG"
-- MagneticCompass_Rot.arg_number    	  = 1310
-- MagneticCompass_Rot.input    		  = {0, 90 , 180 , 270, 360}
-- MagneticCompass_Rot.output    		  = {0, 0.25, 0.5, 0.75, 1}

-- MagneticCompass_Pitch					= CreateGauge()
-- MagneticCompass_Pitch.arg_number		= 1311
-- MagneticCompass_Pitch.input				= {-90 / degrees_per_radian, 90 / degrees_per_radian}
-- MagneticCompass_Pitch.output			= {-1.0, 1.0}
-- MagneticCompass_Pitch.controller		= controllers.base_gauge_Pitch

-- MagneticCompass_Bank					= CreateGauge()
-- MagneticCompass_Bank.arg_number			= 1312
-- MagneticCompass_Bank.input				= {-180 / degrees_per_radian, 180 / degrees_per_radian}
-- MagneticCompass_Bank.output				= {-1.0, 1.0}
-- MagneticCompass_Bank.controller			= controllers.base_gauge_Roll


-- TEST_PARAM_GAUGE      			  = CreateGauge("parameter")
-- TEST_PARAM_GAUGE.parameter_name   = "TEST"
-- TEST_PARAM_GAUGE.arg_number    	  = 16
-- TEST_PARAM_GAUGE.input    		  = {0,1}
-- TEST_PARAM_GAUGE.output    		  = {-1.0, 1.0}

-- FrontCanopy  				= CreateGauge("external_arg")
-- FrontCanopy.external_arg	= 38
-- FrontCanopy.arg_number		= 139
-- FrontCanopy.input			= {0,1}
-- FrontCanopy.output			= {0,1}

-- args_initial_state = {
	-- [3]	= 1,
    -- [5] = 1,
	-- [800] = 0,
	-- [797] = -0.5,--lower HUD gun camera position
 -- }

-- seat_points =
-- {
-- [1] = {point = {0.163047,  -0.006719,  -0.501208}},
-- [2] = {point = {0.163047,  -0.006719,  0.501208}},
-- [3] = {point = {-3.562109,  -1.491860,  -0.488353 ,absolute_position = true },vAngle = 0, hAngle = 0, limits  = {x = {-30.0,30.0} ,  y = {-30.0,30.0},   z = {-30.0,30.0}}},
-- [4] = {point = {-15.163047,  -0.006719,  -0.501208 ,absolute_position = true} ,vAngle = 0, hAngle =  -180.0, limits  = {x = {-30.0,30.0} ,  y = {-30.0,30.0},   z = {-30.0,30.0}}},
-- }


-- Z_test =
-- {
	-- near = 0.05,
	-- far  = 4.0,
-- }

-- dofile(LockOn_Options.common_script_path.."tools.lua")
-- livery = find_custom_livery("Hercules","default")

need_to_be_closed = true -- close lua state after initialization

--[[ available functions

 --base_gauge_RadarAltitude
 --base_gauge_BarometricAltitude
 --base_gauge_AngleOfAttack
 --base_gauge_AngleOfSlide
 --base_gauge_VerticalVelocity
 --base_gauge_TrueAirSpeed
 --base_gauge_IndicatedAirSpeed
 --base_gauge_MachNumber
 --base_gauge_VerticalAcceleration --Ny
 --base_gauge_HorizontalAcceleration --Nx
 --base_gauge_LateralAcceleration --Nz
 --base_gauge_RateOfRoll
 --base_gauge_RateOfYaw
 --base_gauge_RateOfPitch
 --base_gauge_Roll
 --base_gauge_MagneticHeading
 --base_gauge_Pitch
 --base_gauge_Heading
 --base_gauge_EngineLeftFuelConsumption
 --base_gauge_EngineRightFuelConsumption
 --base_gauge_EngineLeftTemperatureBeforeTurbine
 --base_gauge_EngineRightTemperatureBeforeTurbine
 --base_gauge_EngineLeftRPM
 --base_gauge_EngineRightRPM
 --base_gauge_WOW_RightMainLandingGear
 --base_gauge_WOW_LeftMainLandingGear
 --base_gauge_WOW_NoseLandingGear
 --base_gauge_RightMainLandingGearDown
 --base_gauge_LeftMainLandingGearDown
 --base_gauge_NoseLandingGearDown
 --base_gauge_RightMainLandingGearUp
 --base_gauge_LeftMainLandingGearUp
 --base_gauge_NoseLandingGearUp
 --base_gauge_LandingGearHandlePos
 --base_gauge_StickRollPosition
 --base_gauge_StickPitchPosition
 --base_gauge_RudderPosition
 --base_gauge_ThrottleLeftPosition
 --base_gauge_ThrottleRightPosition
 --base_gauge_HelicopterCollective
 --base_gauge_HelicopterCorrection
 --base_gauge_CanopyPos
 --base_gauge_CanopyState
 --base_gauge_FlapsRetracted
 --base_gauge_SpeedBrakePos
 --base_gauge_FlapsPos
 --base_gauge_TotalFuelWeight

--]]
