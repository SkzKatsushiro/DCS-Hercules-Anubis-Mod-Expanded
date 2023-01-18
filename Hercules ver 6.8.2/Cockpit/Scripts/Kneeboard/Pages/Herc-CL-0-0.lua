dofile(LockOn_Options.common_script_path.."KNEEBOARD/indicator/definitions.lua")
dofile(LockOn_Options.script_path.."Systems/Nav/NAV_util.lua")

local missionroute = get_mission_route()
local WaypointName = ""

SetScale(FOV)

-- add background image for kneeboard
add_picture(LockOn_Options.script_path.."Kneeboard/Pages/PageImages/NavLog_bg.png")

local gettext = require("i_18n")
_ = gettext.translate

function AddElement(object)
    object.use_mipfilter = true
    Add(object)
end
	

-- fonts
FontSizeX1	= 0.0075
FontSizeY1	= FontSizeX1

predefined_font_title	= {FontSizeY1,			FontSizeX1,			0.0,		0.0}
-- predefined_font_header	= {FontSizeY1 * 0.9,	FontSizeX1 * 0.9,	0.0,	    0.0}
predefined_font_item	= {FontSizeY1 * 0.5,	FontSizeX1 * 0.5,	0.0,	0.0}

local function parse_waypoint_data(waypoint)

    local coord = lo_to_geo_coords(waypoint.x, waypoint.y)
    local parsed_waypoint_data = {}
    
    local lat = get_digits_LL122(coord.lat)
    local lon = get_digits_LL123(coord.lon)

    -- format lat to string
    if lat[0] == true then
        parsed_waypoint_data.lat = "S"
    else
        parsed_waypoint_data.lat = "N"
    end

    for i = #lat, 2, -1 do
        parsed_waypoint_data.lat = parsed_waypoint_data.lat..math.floor(lat[i])
    end

    -- format lat to string
    if lon[0] == true then
        parsed_waypoint_data.lon = "W"
    else
        parsed_waypoint_data.lon = "E"
    end

    for i = #lon, 2, -1 do
        parsed_waypoint_data.lon = parsed_waypoint_data.lon..math.floor(lon[i])
    end

    -- format alt to string
	if get_option_value("difficulty.units","local") == "metric" then
		parsed_waypoint_data.alt = ""..math.floor(waypoint.alt)
	else
		parsed_waypoint_data.alt = ""..math.floor(waypoint.alt * 3.28084)--Meter to foot conversion factor
	end
	
    return parsed_waypoint_data
end

local kneeboard_data = {}
local FIRST_LINE_Y = 1.0
local LINEHEIGHT = 0.15
local POS_LAT_X = -0.05
local POS_LON_X = 0.35
local POS_ALT = 0.75
local POS_HEADERS_Y = FIRST_LINE_Y + 0.1
local POS_WAYPOINT_X = -0.9
local POS_TITLE_Y = 1.284
local waypointdata = {}

local function getLineY(line)
    return FIRST_LINE_Y - ((line - 1) * LINEHEIGHT)
end

local function addSimpleTextStringCommon(element, name, x, y, value, alignment, stringdefs, material)
    element = CreateElement "ceStringPoly"
    element.name = name
    element.isdraw = true
    element.alignment = alignment or "CenterBottom"
    element.value = value
    element.material = material or "font_Arial_black"
    element.init_pos = {x, y, 0}
    element.stringdefs = stringdefs or predefined_font_item
    return element
end

local function waypoint_name(waypoint_index)
    if waypoint_index == 1 then
		return "INIT POS"
    else
		return "WAYPOINT "..(waypoint_index - 1)
	end
end

-- BOARD TITLE
local txt_BoardTitle = {}
txt_BoardTitle = addSimpleTextStringCommon(txt_BoardTitle, "txt_BoardTitle", 0.0, POS_TITLE_Y, "NAVIGATION LOG", nil, predefined_font_title, "font_Arial_white")
AddElement(txt_BoardTitle)

-- HEADERS
local lat_label = {}
lat_label = addSimpleTextStringCommon(lat_label, "Lat Label", POS_LAT_X, POS_HEADERS_Y, "LAT(dm)", "CenterBottom", {FontSizeY1 * 0.5,	FontSizeX1 * 0.5,	-0.001,	0.0})
AddElement(lat_label)

local lon_label = {}
lon_label = addSimpleTextStringCommon(lon_label, "Lon Label", POS_LON_X, POS_HEADERS_Y, "LON(dm)", "CenterBottom", {FontSizeY1 * 0.5,	FontSizeX1 * 0.5,	-0.001,	0.0})
AddElement(lon_label)

local alt_label = {}
if get_option_value("difficulty.units","local") == "metric" then
	alt_label = addSimpleTextStringCommon(alt_label, "alt Label", POS_ALT, POS_HEADERS_Y, "ALT(m)", "CenterBottom", {FontSizeY1 * 0.5,	FontSizeX1 * 0.5,	-0.001,	0.0})
else
	alt_label = addSimpleTextStringCommon(alt_label, "alt Label", POS_ALT, POS_HEADERS_Y, "ALT(ft)", "CenterBottom", {FontSizeY1 * 0.5,	FontSizeX1 * 0.5,	-0.001,	0.0})
end
AddElement(alt_label)

-- NAVIGATION POINTS
local function add_waypoint(waypoint_index, waypoint_data)

    kneeboard_data[waypoint_index] = {}

    -- create label
    kneeboard_data[waypoint_index].key  = addSimpleTextStringCommon(kneeboard_data[waypoint_index].key,
                                            "key_waypoint_"..waypoint_index,
                                            POS_WAYPOINT_X,
                                            getLineY(waypoint_index),
                                            waypoint_name(waypoint_index),
                                            "LeftBottom"
                                        )
    AddElement(kneeboard_data[waypoint_index].key)

    -- create waypoint info
    kneeboard_data[waypoint_index].lat  = addSimpleTextStringCommon(kneeboard_data[waypoint_index].lat,
                                            "lat_waypoint_"..waypoint_index,
                                            POS_LAT_X,
                                            getLineY(waypoint_index),
                                            waypoint_data.lat
                                        )
    AddElement(kneeboard_data[waypoint_index].lat)

    kneeboard_data[waypoint_index].lon  = addSimpleTextStringCommon(kneeboard_data[waypoint_index].lon,
                                            "lon_waypoint_"..waypoint_index,
                                            POS_LON_X,
                                            getLineY(waypoint_index),
                                            waypoint_data.lon
                                        )
    AddElement(kneeboard_data[waypoint_index].lon)
	
    kneeboard_data[waypoint_index].alt  = addSimpleTextStringCommon(kneeboard_data[waypoint_index].alt,
                                            "alt_waypoint_"..waypoint_index,
                                            POS_ALT,
                                            getLineY(waypoint_index),
                                            waypoint_data.alt
                                        )
    AddElement(kneeboard_data[waypoint_index].alt)
end

-- parse route coordinates into geo coords
for i = 1, #missionroute, 1 do
    waypointdata[i] = parse_waypoint_data(missionroute[i])
    add_waypoint(i, waypointdata[i])
end

