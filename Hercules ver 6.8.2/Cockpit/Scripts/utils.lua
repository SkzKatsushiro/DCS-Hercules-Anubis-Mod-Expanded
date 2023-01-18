function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

function basic_dump(o)
    if type(o) == "number" then
        return tostring(o)
    elseif type(o) == "string" then
        return string.format("%q", o)
    else -- nil, boolean, function, userdata, thread; assume it can be converted to a string
        return tostring(o)
    end
end

function dump(name, value, saved, result)
    seen = seen or {} -- initial value
    result = result or ""
    result = result .. name .. " = "
    if type(value) ~= "table" then
        result = result .. basic_dump(value) .. "\n"
    elseif type(value) == "table" then
        if seen[value] then -- value already saved?
            result = result .. "->" .. seen[value] .. "\n" -- use its previous name
        else
            seen[value] = name -- save name for next time
            result = result .. "{}\n" -- create a new table
            for k, v in pairs(value) do -- save its fields
                local fieldname = string.format("%s[%s]", name, basic_dump(k))
                if fieldname ~= '_G["seen"]' then
                    result = dump(fieldname, v, seen, result)
                end
            end
        end
    end
    return result
end

function strsplit(delimiter, text)
    local list = {}
    local pos = 1
    if string.find("", delimiter, 1) then
        return {}
    end
    while 1 do
        local first, last = string.find(text, delimiter, pos)
        if first then -- found?
            table.insert(list, string.sub(text, pos, first - 1))
            pos = last + 1
        else
            table.insert(list, string.sub(text, pos))
            break
        end
    end
    return list
end

function rwr_vtx(x, y, z, sc)
    return {x * sc, y * sc, z * sc}
end

function table_size(t)
	local c = 0
	for _ in pairs(t) do
		c = c + 1
	end
	return c
end

function rgb_hex_to_numbers(hex)
	local r, g, b = hex:match "^(%x%x)(%x%x)(%x%x)$"
	r, g, b = tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)
	if r and g and b then
		return r, g, b
	else
		error("Invalid RGB color: " .. hex)
	end
end

function rgb_byte_to_ratio(r, g, b)
	return r / 255, g / 255, b / 255
end

-- Copied from https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
--[[
 * Converts an RGB color value to HSV. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and v in the set [0, 1].
 *
 * @param   Number  r       The red color value
 * @param   Number  g       The green color value
 * @param   Number  b       The blue color value
 * @return  Array           The HSV representation
]]
function rgb_to_hsv(r, g, b, a)
	r, g, b, a = r / 255, g / 255, b / 255, a / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max

	local d = max - min
	if max == 0 then s = 0 else s = d / max end

	if max == min then
		h = 0 -- achromatic
	else
		if max == r then
		h = (g - b) / d
		if g < b then h = h + 6 end
		elseif max == g then h = (b - r) / d + 2
		elseif max == b then h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v, a
end

-- Copied from https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
--[[
 * Converts an HSV color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes h, s, and v are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  v       The value
 * @return  Array           The RGB representation
]]
function hsv_to_rgb(h, s, v, a)
	local r, g, b

	local i = math.floor(h * 6);
	local f = h * 6 - i;
	local p = v * (1 - s);
	local q = v * (1 - f * s);
	local t = v * (1 - (1 - f) * s);

	i = i % 6

	if i == 0 then r, g, b = v, t, p
	elseif i == 1 then r, g, b = q, v, p
	elseif i == 2 then r, g, b = p, v, t
	elseif i == 3 then r, g, b = p, q, v
	elseif i == 4 then r, g, b = t, p, v
	elseif i == 5 then r, g, b = v, p, q
	end

	return r * 255, g * 255, b * 255, a * 255
end

function assert_type(value, types, name, arg_index)
	local found = false
	local actual_type = type(value)
	if type(types) == "table" then
		for _, type in pairs(types) do
			if actual_type == type then
				found = true
				break
			end
		end
	else
		found = actual_type == types
		types = {types}
	end
	if not found then
		error(("bad argument #%i (%s): expected %s, got %s\n%s"):format(arg_index, name, table.concat(types, " or "), actual_type, debug.traceback()), 2)
	end
end

function add_controller(parameters, controllers, controller, parameter, ...)
	assert_type(parameters, "table", "parameters", 1)
	assert_type(controllers, "table", "controllers", 2)
	assert_type(controller, "string", "controller", 3)
	assert_type(parameter, {"string", "nil"}, "parameter", 4)
	-- Look to see if parameter is in list of parameters, else add it and get the zero-based index for it.
	local index
	for i, p in ipairs(parameters) do
		if p == parameter then
			index = i - 1
		end
	end
	if not index then
		table.insert(parameters, parameter)
		index = #parameters - 1
	end
	table.insert(controllers, {controller, index, ...})
end

local JSON
function write_log_json(label, ...)
    if not JSON then
        JSON = loadfile "Scripts\\JSON.lua"()
    end
	write_log(label .. " = " .. JSON:encode_pretty(...))
end

function nm_to_meter(nm)
    return 1852.001 * nm
end

function msec_to_fpm(msec)
	return msec * 196.85
end

local params = setmetatable({}, {
	__index = function(self, parameter_name)
		local handle = get_param_handle(parameter_name)
		self[parameter_name] = handle
		return handle
	end,
})

local pages = [[Dig_Map
Engine_Status
Nav_Radar_Display
PFD
System_Status
TAWS]]

function make_hdd_page_setter(HDD_number, page_name)
	if not pages:find(page_name, 1, true) then
		error(tostring(page_name) .. " is not a page name")
	end

	if not (HDD_number and 1 <= HDD_number and HDD_number <= 4) then
		error("HDD_number must be between 1 and 4 inclusive")
	end

	return function()
		for page in pages:gmatch "[^\n]+" do
			params["HDD00" .. HDD_number .. "_" .. page]:set(page == page_name and 1 or 0)
		end
	end
end


function log_change(name)
	assert(type(name) == "string")
	local prev_value = value
	return function(value)
		if prev_value ~= value then
			write_log_json(name, value)
			prev_value = value
		end
	end
end

function clamp(x, min, max)
	return math.min(math.max(x, min), max)
end

function add_to_y_in_vertices(vertices, y_offset)
	for i, vertex in ipairs(vertices) do
		local x, y = unpack(vertex)
		vertices[i] = {x, y + y_offset}
	end
end

function add_to_x_in_vertices(vertices, x_offset)
	for i, vertex in ipairs(vertices) do
		local x, y = unpack(vertex)
		vertices[i] = {x + x_offset, y}
	end
end

function mult_y_in_vertices(vertices, y_multiplier)
	for i, vertex in ipairs(vertices) do
		local x, y = unpack(vertex)
		vertices[i] = {x, y * y_multiplier}
	end
end

function mult_x_in_vertices(vertices, x_multiplier)
	for i, vertex in ipairs(vertices) do
		local x, y = unpack(vertex)
		vertices[i] = {x * x_multiplier, y}
	end
end

function make_counter(value)
	assert(type(value) == "number")
	return function()
		local tmp = value
		value = value + 1
		return tmp
	end
end