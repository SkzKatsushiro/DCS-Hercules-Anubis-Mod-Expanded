local count = 0
local function counter()
	count = count + 1
	return count
end
devices = {}
devices["Electric_System"]						= counter()
devices["Network_Synchronization"]				= counter()
devices["General_Device"]						= counter()
devices["PFD_Device"]							= counter()
devices["RWR"]	    							= counter()
devices["Update_Connectors"]					= counter()
devices["Pylon_Release_System"]					= counter()
devices["Helmet_Device"]						= counter()
devices["Clock"]								= counter()
devices["Autopilot"]							= counter()
devices["Performance_Factors"]					= counter()
devices["HerculesSounds"]						= counter()
devices["General"]								= counter()
devices["Debug"]								= counter()
devices["RWR"]								    = counter()
devices["Nav_Radar"]	     				    = counter()
devices["Intercom"]								= counter()
devices["UHF_Radio"]							= counter()
devices["Radios_control"]						= counter()