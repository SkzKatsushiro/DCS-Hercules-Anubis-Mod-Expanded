local EngineThrust_factor = get_param_handle("EngineThrust_factor")
local EngineSpoolup_factor = get_param_handle("EngineSpoolup_factor")
local EngineSpooldown_factor = get_param_handle("EngineSpooldown_factor")
local EnginePropDiskBrake_factor = get_param_handle("EnginePropDiskBrake_factor")
local P_factor = get_param_handle("P_factor")

local C_L_Alpha0_val = get_param_handle("C_L_Alpha0_val")
local C_L_alpha_factor = get_param_handle("C_L_alpha_factor")
local C_L_delta_f_factor = get_param_handle("C_L_delta_f_factor")
local C_L_delta_e_factor = get_param_handle("C_L_delta_e_factor")
local C_L_PropWash_factor = get_param_handle("C_L_PropWash_factor")
local C_L_groundeffect_factor = get_param_handle("C_L_groundeffect_factor")

local C_D_0_factor = get_param_handle("C_D_0_factor")
local C_D_alpha_factor = get_param_handle("C_D_alpha_factor")
local C_D_beta_factor = get_param_handle("C_D_beta_factor")
local C_D_delta_e_factor = get_param_handle("C_D_delta_e_factor")
local C_D_delta_r_factor = get_param_handle("C_D_delta_r_factor")
local C_D_delta_f_Factor = get_param_handle("C_D_delta_f_Factor")
local C_D_delta_g_factor = get_param_handle("C_D_delta_g_factor")
local C_D_delta_Paratroop_Air_Deflector_factor = get_param_handle("C_D_delta_Paratroop_Air_Deflector_factor")
local C_D_WheelGroundInterAction_factor = get_param_handle("C_D_WheelGroundInterAction_factor")

local Y_beta_factor = get_param_handle("Y_beta_factor")
local Y_delta_r_factor = get_param_handle("Y_delta_r_factor")

local M_alpha_factor = get_param_handle("M_alpha_factor")
local M_dot_alpha_factor = get_param_handle("M_dot_alpha_factor")
local M_q_factor = get_param_handle("M_q_factor")
local M_delta_e_factor = get_param_handle("M_delta_e_factor")
local M_trim_rate = get_param_handle("M_trim_rate")

local L_beta_factor = get_param_handle("L_beta_factor")
local L_p_factor = get_param_handle("L_p_factor")
local L_r_factor = get_param_handle("L_r_factor")
local L_delta_a_factor = get_param_handle("L_delta_a_factor")
local L_delta_r_factor = get_param_handle("L_delta_r_factor")
local L_trim_rate = get_param_handle("L_trim_rate")

local N_beta_factor = get_param_handle("N_beta_factor")
local N_dot_beta_factor = get_param_handle("N_dot_beta_factor")
local N_p_factor = get_param_handle("N_p_factor")
local N_r_factor = get_param_handle("N_r_factor")
local N_delta_a_factor = get_param_handle("N_delta_a_factor")
local N_delta_r_factor = get_param_handle("N_delta_r_factor")
local N_trim_rate = get_param_handle("N_trim_rate")

-- BEST FOOTAGE EVER!!! Hercules Landing at Cherbourg France in 1080p HIGH DEF - YouTube https://www.youtube.com/watch?v=tB8lfkCkp_Q
--//////////////////////////////////////////////////////////////////////////////////// Thrust

-- thrust per engine
EngineThrust_factor:set(1.0)--0.95
-- Engine spool time up/down
EngineSpoolup_factor:set(2.0)
EngineSpooldown_factor:set(4.0)
-- prop disk braking due to variation in engine spooling (thrust/drag ratio)
EnginePropDiskBrake_factor:set(0.25)--1.0
-- prop asymmetrical thrust (P-factor)
P_factor:set(0.5)--

--////////////////////////////////////////////////////////////////////////////////////
--position change of centre of pressure (negative values move the CP further back)
-- Posx_CP_value:set(-1.0)

--//////////////////////////////////////////////////////////////////////////////////// Lift Coefficients

-- Lift coefficient at Steady-state (trim) angle of attack relative to the fuselage reference line
C_L_Alpha0_val:set(1.0)--0.019

-- Lift due to variation in angle of attack
C_L_alpha_factor:set(9.0)

-- Lift due to variation in elevator deflection
C_L_delta_e_factor:set(1.2)--1.1

-- Lift due to variation in flaps deflection
C_L_delta_f_factor:set(0.5)

-- Additional lift due to accelerated airflow over wings caused by propwash (drag/thrust ratio)
C_L_PropWash_factor:set(0.6)--0.25

-- Lift coefficient due to groundeffect (b/h, where b is the wingspan and h is the distance from the wing root chord to the ground.)
C_L_groundeffect_factor:set(0.25)--0.96

--//////////////////////////////////////////////////////////////////////////////////// Drag Coefficients

-- Drag coefficient at zero angle of attack
C_D_0_factor:set(0.1)

-- Drag due to variation in angle of attack
C_D_alpha_factor:set(1.0)--0.8

-- Drag due to variation in sideslip angle
C_D_beta_factor:set(0.5)--0.5

-- Drag due to variation in flaps deflection
C_D_delta_f_Factor:set(0.1)--0.1

-- Drag due to variation in gear extention
C_D_delta_g_factor:set(0.05)--0.05

-- Drag due to variation in Paratroop Air Deflector extention
C_D_delta_Paratroop_Air_Deflector_factor:set(0.01)--0.05

-- Increase in drag due to wheel ground interaction (decrease to zero at stall speed and above)
C_D_WheelGroundInterAction_factor:set(0.0)--0.5

--//////////////////////////////////////////////////////////////////////////////////// Side Force Coefficients

-- Side Force due to variation in side slip angle
Y_beta_factor:set(0.7)--1.0

-- Side Force due to variation in rudder deflection
Y_delta_r_factor:set(2.0)--1.0

--//////////////////////////////////////////////////////////////////////////////////// Pitch Moment

-- Pitch Moment due to variation in angle of attack
M_alpha_factor:set(1.0)--1.0

-- Pitch Moment due to variation in pitching velocity (pitch damping derivative)
M_q_factor:set(1000.0)--20.0

-- Pitch Moment due to variation in time rate of change of angle of attack (causing downwash lag)
M_dot_alpha_factor:set(100.0)--1.0

-- Pitch Moment due to variation in elevator deflection
M_delta_e_factor:set(1.0)--1.5

-- elevator trim rate
M_trim_rate:set(0.0006)

--//////////////////////////////////////////////////////////////////////////////////// Roll Moment

-- Roll Moment due to variation in sidelip angle
L_beta_factor:set(10.0)--1.0

-- Roll Moment due to variation in rolling velocity
L_p_factor:set(100.0)--1.0

-- Roll Moment due to variation in yawing velocity
L_r_factor:set(100.0)--1.0

-- Roll Moment due to variation in aileron deflection
L_delta_a_factor:set(300.0)--1.0

-- Roll Moment due to variation in rudder deflection
L_delta_r_factor:set(200.0)--1.0

-- aileron trim rate
L_trim_rate:set(0.0006)
--//////////////////////////////////////////////////////////////////////////////////// Yaw Moment

-- Yaw Moment due to variation in sidelip angle (weathercock the aircraft) --weathercock stability
N_beta_factor:set(-120.0)--0.15

-- Yaw Moment due to a variation in rate of change of sideslip angle rad^-1
N_dot_beta_factor:set(0.0)

-- Yaw Moment due to variation in rolling velocity -- adverse yaw
N_p_factor:set(-150.0)--1.0

-- Yaw Moment due to variation in yawing velocity--damping of yaw rate
N_r_factor:set(300.0)--60.0

-- Yaw Moment due to variation in aileron deflection
N_delta_a_factor:set(-5.0)-- 15.0

-- Yaw Moment due to variation in rudder deflection, flaps more than 15% double this value
N_delta_r_factor:set(30.0)--2.5

-- rudder trim rate
N_trim_rate:set(0.0006)
