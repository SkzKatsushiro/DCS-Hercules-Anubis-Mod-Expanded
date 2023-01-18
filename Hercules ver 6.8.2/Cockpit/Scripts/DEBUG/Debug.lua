
local update_time_step = 0.006 --EFM rate (0.006 s) or multible of 0.006 s (fastest), 0.012 s, 0.024 s, etc
make_default_activity(update_time_step)

		-- print_message_to_user(string.format("ELECTRICAL_PANEL.battery_switch"))
		-- print_message_to_user(string.format("NetworkSyncValue_param:get()  %d", NetworkSyncValue_param:get()))

------------------------------------------------------------------------ DEBUG
local Click_Value1 = get_param_handle("Click_Value1")
local Click_Value1_Increment = get_param_handle("Click_Value1_Increment")
local Click_Value2 = get_param_handle("Click_Value2")
local Click_Value2_Increment = get_param_handle("Click_Value2_Increment")
local Click_Value3 = get_param_handle("Click_Value3")
local Click_Value3_Increment = get_param_handle("Click_Value3_Increment")
local Click_Value4 = get_param_handle("Click_Value4")
local Click_Value4_Increment = get_param_handle("Click_Value4_Increment")
local Click_Value5 = get_param_handle("Click_Value5")
local Click_Value5_Increment = get_param_handle("Click_Value5_Increment")
local Click_Value6 = get_param_handle("Click_Value6")
local Click_Value6_Increment = get_param_handle("Click_Value6_Increment")
local Click_Value7 = get_param_handle("Click_Value7")
local Click_Value7_Increment = get_param_handle("Click_Value7_Increment")
local Click_Value8 = get_param_handle("Click_Value8")
local Click_Value8_Increment = get_param_handle("Click_Value8_Increment")
local Click_Value9 = get_param_handle("Click_Value9")
local Click_Value9_Increment = get_param_handle("Click_Value9_Increment")
local Click_Value10 = get_param_handle("Click_Value10")
local Click_Value10_Increment = get_param_handle("Click_Value10_Increment")

Click_Value1:set(0.2)--  3.287
Click_Value1_Increment:set(0.01)

Click_Value2:set(1.1)--1.0
Click_Value2_Increment:set(0.1)--

Click_Value3:set(0.05)--0.1
Click_Value3_Increment:set(0.01)

Click_Value4:set(0.0)--0.0
Click_Value4_Increment:set(0.01)

Click_Value5:set(0.02)--
Click_Value5_Increment:set(0.01)

Click_Value6:set(0.0)--
Click_Value6_Increment:set(0.1)

Click_Value7:set(0.0)--
Click_Value7_Increment:set(0.1)

Click_Value8:set(0.0)--
Click_Value8_Increment:set(0.1)

Click_Value9:set(0.0)--
Click_Value9_Increment:set(0.1)

Click_Value10:set(0.0)--
Click_Value10_Increment:set(0.1)


-- local General_system = GetSelf()



-- local SHOW_DEBUG = get_param_handle("SHOW_DEBUG")
-- local NetworkSyncCommand = get_param_handle("NetworkSyncCommand")
-- local NetworkSyncValue = get_param_handle("NetworkSyncValue")
-- local MPCD_Command = get_param_handle("MPCD_Command")
-- local MPCD_Value = get_param_handle("MPCD_Value")
-- local Command_Down = false
-- function update()
	-- if (SHOW_DEBUG:get() > 0) then
		-- if (Command_Down == false) then
				-- if (NetworkSyncCommand:get() > 0) then
					-- if not (NetworkSyncCommand:get() >= 2001 and NetworkSyncCommand:get() <= 2006) then
						-- print_message_to_user(string.format("NetworkSyncCommand:  %.0f", NetworkSyncCommand:get()))
						-- if (NetworkSyncValue:get() >= -1 and NetworkSyncValue:get() <= 1) then
							-- print_message_to_user(string.format("NetworkSyncValue:  %.3f", NetworkSyncValue:get()))
						-- end
					-- end
				-- end
				-- if (MPCD_Command:get() > 0) then
					-- print_message_to_user(string.format("MPCD_Command:  %.0f", MPCD_Command:get()))
					-- print_message_to_user(string.format("MPCD_Value:  %.3f", MPCD_Value:get()))
				-- end
			-- Command_Down = true
		-- else
			-- Command_Down = false
		-- end
	-- end
-- end

	
	
	
	
	
	
	
	
	