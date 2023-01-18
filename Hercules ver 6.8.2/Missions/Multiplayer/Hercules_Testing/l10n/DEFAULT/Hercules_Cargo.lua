
-- Hercules Cargo Drop Events by Anubis Yinepu

-- This script will only work for the Herculus mod by Anubis
-- Payloads carried by pylons 11, 12 and 13 need to be declared in the Herculus_Loadout.lua file
-- Except for Ammo pallets, this script will spawn whatever payload gets launched from pylons 11, 12 and 13
-- Pylons 11, 12 and 13 are moveable within the Herculus cargo bay area
-- Ammo pallets can only be jettisoned from these pylons with no benefit to DCS world
-- To benefit DCS world, Ammo pallets need to be off/on loaded using DCS arming and refueling window
-- Cargo_Container_Enclosed = true: Cargo enclosed in container with parachute, need to be dropped from 100m (300ft) or more, except when parked on ground
-- Cargo_Container_Enclosed = false: Open cargo with no parachute, need to be dropped from 10m (30ft) or less

local Hercules_Cargo_Drop_Events = {}
local GT_DisplayName = ""
local GT_Name = ""
local Cargo_Drop_initiator = ""
local Cargo_Container_Enclosed = false

local j = 0
local Cargo = {}
Cargo.Cargo_Drop_Direction = 0
Cargo.Cargo_Contents = ""
Cargo.Cargo_Type_name = ""
Cargo.Cargo_over_water = false
Cargo.Container_Enclosed = false
Cargo.offload_cargo = false
Cargo.all_cargo_survive_to_the_ground = false
Cargo.all_cargo_gets_destroyed = false
Cargo.destroy_cargo_dropped_without_parachute = false
Cargo.scheduleFunctionID = 0

local CargoHeading = 0
local Cargo_Drop_Position = {}

local CargoUnitID = 0
local CargoGroupID = 0
local CargoStaticGroupID = 0

function Cargo_SpawnGroup(Cargo_Drop_Position, Cargo_Type_name, CargoHeading)
	CargoUnitID = CargoUnitID + 1
	CargoGroupID = CargoGroupID + 1
	local Cargo = 
	{
		["visible"] = false,
		["tasks"] = 
		{
		}, -- end of ["tasks"]
		["uncontrollable"] = false,
		["task"] = "Ground Nothing",
		["groupId"] = CargoGroupID,
		["hidden"] = false,
		["units"] = 
		{
			[1] = 
			{
				["type"] = Cargo_Type_name,
				["transportable"] = 
				{
					["randomTransportable"] = false,
				}, -- end of ["transportable"]
				["unitId"] = CargoUnitID,
				["skill"] = "Excellent",
				["y"] = Cargo_Drop_Position.z,
				["x"] = Cargo_Drop_Position.x,
				["name"] = "Cargo Unit "..CargoUnitID,
				["heading"] = CargoHeading,
				["playerCanDrive"] = true,
			}, -- end of [1]
		}, -- end of ["units"]
		["y"] = Cargo_Drop_Position.z,
		["x"] = Cargo_Drop_Position.x,
		["name"] = "Cargo Group "..CargoUnitID,
		["start_time"] = 0,
	}
	coalition.addGroup(country.id.USA, Group.Category.GROUND, Cargo)
end

function Cargo_SpawnStatic(Cargo_Drop_Position, Cargo_Type_name, CargoHeading, dead)
	CargoStaticGroupID = CargoStaticGroupID + 1
	local CargoObject = 
	{
		["type"] = Cargo_Type_name,
		["y"] = Cargo_Drop_Position.z,
		["x"] = Cargo_Drop_Position.x,
		["name"] = "Cargo Static Group "..CargoStaticGroupID,
		["heading"] = CargoHeading,
		["dead"] = dead,
	}
	coalition.addStaticObject(country.id.USA, CargoObject)
end

function Cargo_SpawnObjects(Cargo_Drop_Direction, Cargo_Content_position, Cargo_Type_name, Cargo_over_water, Container_Enclosed, offload_cargo, all_cargo_survive_to_the_ground, all_cargo_gets_destroyed, destroy_cargo_dropped_without_parachute)
	if offload_cargo == true then
		------------------------------------------------------------------------------
		if CargoHeading >= 3.14 then
			CargoHeading = 0
			Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (30.0 * math.cos(Cargo_Drop_Direction - 1.0)),
								   ["z"] = Cargo_Content_position.z - (30.0 * math.sin(Cargo_Drop_Direction - 1.0))}
		else
			if CargoHeading >= 1.57 then
				CargoHeading = 3.14
				Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (20.0 * math.cos(Cargo_Drop_Direction + 0.5)),
									   ["z"] = Cargo_Content_position.z - (20.0 * math.sin(Cargo_Drop_Direction + 0.5))}
			else
				if CargoHeading >= 0 then
					CargoHeading = 1.57
					Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (10.0 * math.cos(Cargo_Drop_Direction + 1.5)),
										   ["z"] = Cargo_Content_position.z - (10.0 * math.sin(Cargo_Drop_Direction + 1.5))}
				end
			end
		end
		------------------------------------------------------------------------------
		Cargo_SpawnGroup(Cargo_Drop_Position, Cargo_Type_name, CargoHeading)
		-- if Container_Enclosed == true then
			-- Cargo_SpawnStatic({["z"] = Cargo_Drop_Position.z + 10.0,["x"] = Cargo_Drop_Position.x + 10.0}, "Hercules_Container_Parachute_Static", CargoHeading, false)
		-- end
	else
		------------------------------------------------------------------------------
		CargoHeading = 0
		Cargo_Drop_Position = {["x"] = Cargo_Content_position.x - (20.0 * math.cos(Cargo_Drop_Direction)),
							   ["z"] = Cargo_Content_position.z - (20.0 * math.cos(Cargo_Drop_Direction))}
		------------------------------------------------------------------------------
		if all_cargo_gets_destroyed == true or Cargo_over_water == true then
			if Container_Enclosed == true then
				Cargo_SpawnStatic(Cargo_Drop_Position, Cargo_Type_name, CargoHeading, true)
				Cargo_SpawnStatic(Cargo_Drop_Position, "Hercules_Container_Parachute_Static", CargoHeading, true)
			else
				Cargo_SpawnStatic(Cargo_Drop_Position, Cargo_Type_name, CargoHeading, true)
			end
		else
			------------------------------------------------------------------------------
			if all_cargo_survive_to_the_ground == true then
				Cargo_SpawnGroup(Cargo_Drop_Position, Cargo_Type_name, CargoHeading)
				if Container_Enclosed == true then
					Cargo_SpawnStatic({["z"] = Cargo_Drop_Position.z + 10.0,["x"] = Cargo_Drop_Position.x + 10.0}, "Hercules_Container_Parachute_Static", CargoHeading, false)
				end
			end
			------------------------------------------------------------------------------
			if destroy_cargo_dropped_without_parachute == true then
				if Container_Enclosed == true then
					Cargo_SpawnGroup(Cargo_Drop_Position, Cargo_Type_name, CargoHeading)
					Cargo_SpawnStatic({["z"] = Cargo_Drop_Position.z + 10.0,["x"] = Cargo_Drop_Position.x + 10.0}, "Hercules_Container_Parachute_Static", CargoHeading, false)
				else
					Cargo_SpawnStatic(Cargo_Drop_Position, Cargo_Type_name, CargoHeading, true)
				end
			end
			------------------------------------------------------------------------------
		end
	end
end

function Calculate_Object_Height_AGL(object)
	return object:getPosition().p.y - land.getHeight({x = object:getPosition().p.x, y = object:getPosition().p.z})
end

function Check_SurfaceType(object)
   -- LAND,--1 SHALLOW_WATER,--2 WATER,--3 ROAD,--4 RUNWAY--5
	return land.getSurfaceType({x = object:getPosition().p.x, y = object:getPosition().p.z})
end

function Cargo_Track(Arg, time)
	local status, result = pcall(
		function()
		local next = next
		if next(Arg[1].Cargo_Contents) ~= nil then
			if Calculate_Object_Height_AGL(Arg[1].Cargo_Contents) < 5.0 then--pallet less than 5m above ground before spawning
				if Check_SurfaceType(Arg[1].Cargo_Contents) == 2 or Check_SurfaceType(Arg[1].Cargo_Contents) == 3 then
					Arg[1].Cargo_over_water = true--pallets gets destroyed in water
				end
				Arg[1].Cargo_Contents:destroy()--remove pallet+parachute before hitting ground and replace with Cargo_SpawnContents
				Cargo_SpawnObjects(Arg[1].Cargo_Drop_Direction, Object.getPoint(Arg[1].Cargo_Contents), Arg[1].Cargo_Type_name, Arg[1].Cargo_over_water, Arg[1].Container_Enclosed, Arg[1].offload_cargo, Arg[1].all_cargo_survive_to_the_ground, Arg[1].all_cargo_gets_destroyed, Arg[1].destroy_cargo_dropped_without_parachute)
				timer.removeFunction(Arg[1].scheduleFunctionID)
				Arg[1] = {}
			end
			return time + 0.1
		end
	end) -- pcall
	if not status then
		env.error(string.format("Cargo_Spawn: %s", result))
	else
		return result
	end
end

function Calculate_Cargo_Drop_initiator_NorthCorrection(point)	--correction needed for true north
	if not point.z then --Vec2; convert to Vec3
		point.z = point.y
		point.y = 0
	end
	local lat, lon = coord.LOtoLL(point)
	local north_posit = coord.LLtoLO(lat + 1, lon)
	return math.atan2(north_posit.z - point.z, north_posit.x - point.x)
end

function Calculate_Cargo_Drop_initiator_Heading(Cargo_Drop_initiator)
	local Heading = math.atan2(Cargo_Drop_initiator:getPosition().x.z, Cargo_Drop_initiator:getPosition().x.x)
	Heading = Heading + Calculate_Cargo_Drop_initiator_NorthCorrection(Cargo_Drop_initiator:getPosition().p)
	if Heading < 0 then
		Heading = Heading + (2 * math.pi)-- put heading in range of 0 to 2*pi
	end
	return Heading + 0.06 -- rad
end

function Cargo_Initialize(initiator, Cargo_Contents, Cargo_Type_name, Container_Enclosed)
	local status, result = pcall(
		function()
		Cargo_Drop_initiator = Unit.getByName(initiator:getName())
		local next = next
		if next(Cargo_Drop_initiator) ~= nil then
			j = j + 1
			Cargo[j] = {}
			Cargo[j].Cargo_Drop_Direction = Calculate_Cargo_Drop_initiator_Heading(Cargo_Drop_initiator)
			Cargo[j].Cargo_Contents = Cargo_Contents
			Cargo[j].Cargo_Type_name = Cargo_Type_name
			Cargo[j].Container_Enclosed = Container_Enclosed
		------------------------------------------------------------------------------
			if Calculate_Object_Height_AGL(Cargo_Drop_initiator) < 5.0 then--aircraft on ground
				Cargo[j].offload_cargo = true
			else
		------------------------------------------------------------------------------
				if Calculate_Object_Height_AGL(Cargo_Drop_initiator) < 10.0 then--aircraft less than 10m above ground
					Cargo[j].all_cargo_survive_to_the_ground = true
				else
		------------------------------------------------------------------------------
					if Calculate_Object_Height_AGL(Cargo_Drop_initiator) < 100.0 then--aircraft more than 10m but less than 100m above ground
						Cargo[j].all_cargo_gets_destroyed = true
					else
		------------------------------------------------------------------------------
						Cargo[j].destroy_cargo_dropped_without_parachute = true--aircraft more than 100m above ground
					end
				end
			end
		------------------------------------------------------------------------------
			Cargo[j].scheduleFunctionID = timer.scheduleFunction(Cargo_Track, {Cargo[j]}, timer.getTime() + 0.1)
		end
	end) -- pcall
	if not status then
		env.error(string.format("Cargo_Initialize: %s", result))
	else
		return result
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- EventHandlers
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Hercules_Cargo_Drop_Events:onEvent(Cargo_Drop_Event)
	if Cargo_Drop_Event.id == world.event.S_EVENT_SHOT then
		GT_DisplayName = Weapon.getDesc(Cargo_Drop_Event.weapon).typeName:sub(15, -1)--Remove "weapons.bombs." from string
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "ATGM M1045 HMMWV TOW") then
			GT_Name = "M1045 HMMWV TOW"
			Cargo_Container_Enclosed = false
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "APC M1043 HMMWV Armament") then
			GT_Name = "M1043 HMMWV Armament"
			Cargo_Container_Enclosed = false
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "SAM HAWK PCP") then
			GT_Name = "Hawk pcp"
			Cargo_Container_Enclosed = true
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "SAM HAWK LN M192") then
			GT_Name = "Hawk ln"
			Cargo_Container_Enclosed = true
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "SAM HAWK CWAR AN/MPQ-55") then
			GT_Name = "Hawk cwar"
			Cargo_Container_Enclosed = true
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "SAM HAWK SR AN/MPQ-50") then
			GT_Name = "Hawk sr"
			Cargo_Container_Enclosed = true
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "SAM HAWK TR AN/MPQ-46") then
			GT_Name = "Hawk tr"
			Cargo_Container_Enclosed = true
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "SPG M1128 Stryker MGS") then
			GT_Name = "M1128 Stryker MGS"
			Cargo_Container_Enclosed = false
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "AAA Vulcan M163") then
			GT_Name = "Vulcan"
			Cargo_Container_Enclosed = false
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "APC M1126 Stryker ICV") then
			GT_Name = "M1126 Stryker ICV"
			Cargo_Container_Enclosed = false
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "ATGM M1134 Stryker") then
			GT_Name = "M1134 Stryker ATGM"
			Cargo_Container_Enclosed = false
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
		if (GT_DisplayName == "IFV LAV-25") then
			GT_Name = "LAV-25"
			Cargo_Container_Enclosed = false
			Cargo_Initialize(Cargo_Drop_Event.initiator, Cargo_Drop_Event.weapon, GT_Name, Cargo_Container_Enclosed)
		end
		---------------------------------------------------------------------------------------------------------------------------------
	end
end
world.addEventHandler(Hercules_Cargo_Drop_Events)

-- trigger.action.outTextForCoalition(coalition.side.BLUE, string.format("Cargo_Drop_Event.weapon: %s", Weapon.getDesc(Cargo_Drop_Event.weapon).typeName), 10)
-- trigger.action.outTextForCoalition(coalition.side.BLUE, tostring('Calculate_Object_Height_AGL: ' .. aaaaa), 10)
-- trigger.action.outTextForCoalition(coalition.side.BLUE, string.format("Speed: %.2f", Calculate_Object_Speed(Cargo_Drop_initiator)), 10)
-- trigger.action.outTextForCoalition(coalition.side.BLUE, string.format("Russian Interceptor Patrol scrambled from Nalchik"), 10)

-- function basicSerialize(var)
	-- if var == nil then
		-- return "\"\""
	-- else
		-- if ((type(var) == 'number') or
				-- (type(var) == 'boolean') or
				-- (type(var) == 'function') or
				-- (type(var) == 'table') or
				-- (type(var) == 'userdata') ) then
			-- return tostring(var)
		-- else
			-- if type(var) == 'string' then
				-- var = string.format('%q', var)
				-- return var
			-- end
		-- end
	-- end
-- end
	
-- function tableShow(tbl, loc, indent, tableshow_tbls) --based on serialize_slmod, this is a _G serialization
	-- tableshow_tbls = tableshow_tbls or {} --create table of tables
	-- loc = loc or ""
	-- indent = indent or ""
	-- if type(tbl) == 'table' then --function only works for tables!
		-- tableshow_tbls[tbl] = loc
		-- local tbl_str = {}
		-- tbl_str[#tbl_str + 1] = indent .. '{\n'
		-- for ind,val in pairs(tbl) do -- serialize its fields
			-- if type(ind) == "number" then
				-- tbl_str[#tbl_str + 1] = indent
				-- tbl_str[#tbl_str + 1] = loc .. '['
				-- tbl_str[#tbl_str + 1] = tostring(ind)
				-- tbl_str[#tbl_str + 1] = '] = '
			-- else
				-- tbl_str[#tbl_str + 1] = indent
				-- tbl_str[#tbl_str + 1] = loc .. '['
				-- tbl_str[#tbl_str + 1] = basicSerialize(ind)
				-- tbl_str[#tbl_str + 1] = '] = '
			-- end
			-- if ((type(val) == 'number') or (type(val) == 'boolean')) then
				-- tbl_str[#tbl_str + 1] = tostring(val)
				-- tbl_str[#tbl_str + 1] = ',\n'
			-- elseif type(val) == 'string' then
				-- tbl_str[#tbl_str + 1] = basicSerialize(val)
				-- tbl_str[#tbl_str + 1] = ',\n'
			-- elseif type(val) == 'nil' then -- won't ever happen, right?
				-- tbl_str[#tbl_str + 1] = 'nil,\n'
			-- elseif type(val) == 'table' then
				-- if tableshow_tbls[val] then
					-- tbl_str[#tbl_str + 1] = tostring(val) .. ' already defined: ' .. tableshow_tbls[val] .. ',\n'
				-- else
					-- tableshow_tbls[val] = loc ..	'[' .. basicSerialize(ind) .. ']'
					-- tbl_str[#tbl_str + 1] = tostring(val) .. ' '
					-- tbl_str[#tbl_str + 1] = tableShow(val,	loc .. '[' .. basicSerialize(ind).. ']', indent .. '		', tableshow_tbls)
					-- tbl_str[#tbl_str + 1] = ',\n'
				-- end
			-- elseif type(val) == 'function' then
				-- if debug and debug.getinfo then
					-- local fcnname = tostring(val)
					-- local info = debug.getinfo(val, "S")
					-- if info.what == "C" then
						-- tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', C function') .. ',\n'
					-- else
						-- if (string.sub(info.source, 1, 2) == [[./]]) then
							-- tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')' .. info.source) ..',\n'
						-- else
							-- tbl_str[#tbl_str + 1] = string.format('%q', fcnname .. ', defined in (' .. info.linedefined .. '-' .. info.lastlinedefined .. ')') ..',\n'
						-- end
					-- end
				-- else
					-- tbl_str[#tbl_str + 1] = 'a function,\n'
				-- end
			-- else
				-- tbl_str[#tbl_str + 1] = 'unable to serialize value type ' .. basicSerialize(type(val)) .. ' at index ' .. tostring(ind)
			-- end
		-- end
		-- tbl_str[#tbl_str + 1] = indent .. '}'
		-- return table.concat(tbl_str)
	-- end
-- end




-- function F10CargoDrop(GroupId, Unitname)
	-- local rootPath = missionCommands.addSubMenuForGroup(GroupId, "Cargo Drop")
	-- missionCommands.addCommandForGroup(GroupId, "Drop direction", rootPath, CruiseMissilesMessage, {GroupId, Unitname})
	-- missionCommands.addCommandForGroup(GroupId, "Drop distance", rootPath, ForwardConvoy, nil)
	-- local measurementsSetPath = missionCommands.addSubMenuForGroup(GroupId,"Set measurement units",rootPath)
	-- missionCommands.addCommandForGroup(GroupId, "Set to Imperial (feet, knts)",measurementsSetPath,setMeasurements,{GroupId, "imperial"})
	-- missionCommands.addCommandForGroup(GroupId, "Set to Metric (meters, km/h)",measurementsSetPath,setMeasurements,{GroupId, "metric"})
-- end

-- function Calculate_Object_Speed(object)
	-- return math.sqrt(object:getVelocity().x^2 + object:getVelocity().y^2 + object:getVelocity().z^2) * 3600 / 1852 -- knts
-- end

-- function vecDotProduct(vec1, vec2)
	-- return vec1.x*vec2.x + vec1.y*vec2.y + vec1.z*vec2.z
-- end

-- function Calculate_Aircraft_ForwardVelocity(Drop_initiator)
	-- return vecDotProduct(Drop_initiator:getPosition().x, Drop_initiator:getVelocity())
-- end



