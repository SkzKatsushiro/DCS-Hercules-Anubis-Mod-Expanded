
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."utils.lua")

dofile(LockOn_Options.script_path.."command_defs.lua")

make_default_activity(0.05) --update_time_step will be called 20/second

local uhf_radio_device = nil

local UHF_ARC_164_presets
if get_aircraft_mission_data ~= nil then
    UHF_ARC_164_presets = get_aircraft_mission_data("Radio")[1].channels
end

local UHF1_ARC_164_Radio_Freq = get_param_handle("UHF1_ARC_164_Radio_Freq")
local UHF1_ARC_164_Radio_Chan = get_param_handle("UHF1_ARC_164_Radio_Chan")
local UHF1_ARC_164_Radio_Freq_Change = get_param_handle("UHF1_ARC_164_Radio_Freq_Change")
local UHF1_ARC_164_Radio_Chan_Change = get_param_handle("UHF1_ARC_164_Radio_Chan_Change")
local UHF1_ARC_164_Radio_Chan_Avail = false
-- local update_counter = 0 --for logging
function update()
	-- update_counter = update_counter + 1 --increment counter
    -- if update_counter % 20 == 0 then
		-- tableShow(UHF_ARC_164_presets)
	-- end
	if UHF1_ARC_164_Radio_Freq_Change:get() == 1 then
		uhf_radio_device:set_frequency(UHF1_ARC_164_Radio_Freq:get() * 1E6)
		for i = 1, #UHF_ARC_164_presets do
			if UHF_ARC_164_presets[i] == UHF1_ARC_164_Radio_Freq:get() then
				UHF1_ARC_164_Radio_Chan:set(i)
				UHF1_ARC_164_Radio_Chan_Avail = true
			else
				if UHF1_ARC_164_Radio_Chan_Avail == false then
					UHF1_ARC_164_Radio_Chan:set(0)
				end
			end
		end
		UHF1_ARC_164_Radio_Chan_Avail = false
		UHF1_ARC_164_Radio_Freq_Change:set(0)
	end
	if UHF1_ARC_164_Radio_Chan_Change:get() == 1 then
        uhf_radio_device:set_frequency(UHF_ARC_164_presets[UHF1_ARC_164_Radio_Chan:get()] * 1E6)
		UHF1_ARC_164_Radio_Freq:set(UHF_ARC_164_presets[UHF1_ARC_164_Radio_Chan:get()])
		UHF1_ARC_164_Radio_Chan_Change:set(0)
	end
end

local ptr_radio = get_param_handle("THIS_RADIO_PTR")
function post_initialize()
    uhf_radio_device = GetDevice(devices.UHF_Radio)
	uhf_radio_device:set_frequency(256E6) -- Sochi
	uhf_radio_device:set_modulation(MODULATION_AM) -- gives DCS.log INFO msg:  COCKPITBASE: avBaseRadio::ext_set_modulation not implemented, used direct set
	ptr_radio:set(string.sub(tostring(uhf_radio_device.link),10))
end

-- function basicSerialize(var)
	-- if var == nil then
		-- return "\"\""
	-- else
		-- if ((type(var) == 'number') or
				-- (type(var) == 'boolean') or
				-- (type(var) == 'function') or
				-- (type(var) == 'table') or
				-- (type(var) == 'userdata') ) then
			-- return print_message_to_user(tostring(var))
		-- else
			-- if type(var) == 'string' then
				-- var = print_message_to_user(string.format('%q', var))
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
				-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(ind))
				-- tbl_str[#tbl_str + 1] = '] = '
			-- else
				-- tbl_str[#tbl_str + 1] = indent
				-- tbl_str[#tbl_str + 1] = loc .. '['
				-- tbl_str[#tbl_str + 1] = basicSerialize(ind)
				-- tbl_str[#tbl_str + 1] = '] = '
			-- end
			-- if ((type(val) == 'number') or (type(val) == 'boolean')) then
				-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(val))
				-- tbl_str[#tbl_str + 1] = ',\n'
			-- elseif type(val) == 'string' then
				-- tbl_str[#tbl_str + 1] = basicSerialize(val)
				-- tbl_str[#tbl_str + 1] = ',\n'
			-- elseif type(val) == 'nil' then -- won't ever happen, right?
				-- tbl_str[#tbl_str + 1] = 'nil,\n'
			-- elseif type(val) == 'table' then
				-- if tableshow_tbls[val] then
					-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(val) .. ' already defined: ' .. tableshow_tbls[val] .. ',\n')
				-- else
					-- tableshow_tbls[val] = loc ..	'[' .. basicSerialize(ind) .. ']'
					-- tbl_str[#tbl_str + 1] = print_message_to_user(tostring(val) .. ' ')
					-- tbl_str[#tbl_str + 1] = tableShow(val,	loc .. '[' .. basicSerialize(ind).. ']', indent .. '		', tableshow_tbls)
					-- tbl_str[#tbl_str + 1] = ',\n'
				-- end
			-- elseif type(val) == 'function' then
				-- if debug and debug.getinfo then
					-- local fcnname = print_message_to_user(tostring(val))
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
				-- tbl_str[#tbl_str + 1] = 'unable to serialize value type ' .. basicSerialize(type(val)) .. ' at index ' .. print_message_to_user(tostring(ind))
			-- end
		-- end
		-- tbl_str[#tbl_str + 1] = indent .. '}'
		-- return table.concat(tbl_str)
	-- end
-- end


need_to_be_closed = false -- close lua state after initialization



