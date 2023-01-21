dofile(LockOn_Options.common_script_path .. "elements_defs.lua")
dofile(LockOn_Options.script_path .. "RWR/indicator/definitions.lua")
dofile(LockOn_Options.script_path .. "utils.lua")
dofile(LockOn_Options.script_path .. "materials.lua")
SetScale(FOV)


local sc = 1 / GetScale()
local contact_scale = 0.030
local pct_display_fill = 0.90
local rwr_rad = GetScale()*pct_display_fill
local num_points = 32
local dphi = math.rad(360.0 / (1.0 * num_points))

local txtsize_center = 0.005*0.85
local strdefcenter = {txtsize_center, txtsize_center / 4, -txtsize_center / 8, 0}

local txt_CP = CreateElement "ceStringPoly"
txt_CP.name = "txt_CP"
txt_CP.material = RWR_FONT
txt_CP.init_pos = {-0.02, 0, 0}
txt_CP.init_rot = {0, 0, 0}
txt_CP.alignment = "CenterCenter"
txt_CP.stringdefs = strdefcenter
txt_CP.value = "T"
txt_CP.element_params = {Nav_Radar_brightness_parameter, "RWR_Overlay", Nav_Radar_Display}
txt_CP.controllers = {{"opacity_using_parameter", 0}, {"parameter_in_range", 1, 0.9, 1.1}, {"parameter_in_range", 2, 0.9, 1.1}}
-- txt_CP.parent_element = RWR_Display_origin
AddElement(txt_CP)

local function make_inner_ring(material, opaque)
    local pct_inner_ring = 0.075
    local rwr_inner_ring = CreateElement "ceMeshPoly"
    rwr_inner_ring.name = "RWR_grid_i"
    rwr_inner_ring.primitivetype = "triangles"
    set_circle(rwr_inner_ring, (pct_display_fill*pct_inner_ring) + 0.003, (pct_display_fill*pct_inner_ring) - 0.003, 360, 64)
    rwr_inner_ring.material = material
    -- rwr_inner_ring.parent_element = RWR_Display_origin
    rwr_inner_ring.element_params = {"RWR_Overlay", Nav_Radar_Display, Nav_Radar_brightness_parameter}
    rwr_inner_ring.controllers = {{"parameter_in_range", 0, 0.9, 1.1}, {"parameter_in_range", 1, 0.9, 1.1}, not opaque and {"opacity_using_parameter", 2} or nil}
    AddElement(rwr_inner_ring)
end

make_inner_ring("black", true)
make_inner_ring(RWR_MAGENTA, false)

-- CONTACT SYMBOLOGY
local txtsize = 0.008
local strdefsymbol = {txtsize, txtsize / 4, -txtsize / 20, 0}

for ia = 1, 20 do
    if ia < 10 then
        i = "_0" .. ia .. "_"
    else
        i = "_" .. ia .. "_"
    end

    local RWR_contact = CreateElement "ceTexPoly"
    RWR_contact.name = "RWR_contact" .. i .. "name"
    RWR_contact.primitivetype = "triangles"
    -- RWR_contact.material = MakeMaterial(nil,{0,0,0,255})

    RWR_contact.controllers = {{"rotate_using_parameter", 0, 1},
                               {"parameter_in_range", 1, 0.1, 1.09},
                               {"move_up_down_using_parameter", 2, contact_scale},
                               }
    RWR_contact.element_params = {"RWR_CONTACT" .. i .. "AZIMUTH", "RWR_CONTACT" .. i .. "POWER_SYM",
                                  "RWR_CONTACT" .. i .. "LOCK_SYM"}
    -- RWR_contact.parent_element = RWR_Display_origin
    AddElement(RWR_contact)

    local RWR_type_Str = CreateElement "ceStringPoly"
    RWR_type_Str.name = "RWR_type" .. i .. "name"
    RWR_type_Str.material = RWR_FONT
    RWR_type_Str.stringdefs = strdefsymbol
    RWR_type_Str.alignment = "CenterCenter"
    RWR_type_Str.value = ""
    RWR_type_Str.formats = {"%s"}
    RWR_type_Str.UseBackground = false
    RWR_type_Str.element_params = {"RWR_CONTACT" .. i .. "UNIT_TYPE_SYM",
                                   "RWR_CONTACT" .. i .. "AZIMUTH",
                                   "RWR_CONTACT" .. i .. "UNIT_TYPE_IS_NUMERIC",
                                   Nav_Radar_brightness_parameter, Nav_Radar_Display,  "RWR_Overlay",
                                   "RWR_CONTACT" .. i .. "COLOR",
                                   }
    RWR_type_Str.controllers = {{"text_using_parameter", 0, 0}, {"rotate_using_parameter", 1, -1},
                                {"parameter_in_range", 2, 0.1, 0.8},
                                {"opacity_using_parameter", 3},
                                {"parameter_in_range", 4, 0.9, 1.1},
                                {"parameter_in_range", 5, 0.9, 1.1},
                                yellow_contact, magenta_contact
                                }
    RWR_type_Str.parent_element = "RWR_contact" .. i .. "name"
    AddElement(RWR_type_Str)

    local RWR_type_Num = CreateElement "ceStringPoly"
    RWR_type_Num.name = "RWR_type" .. i .. "name_num"
    RWR_type_Num.material = RWR_FONT
    RWR_type_Num.stringdefs = strdefsymbol
    RWR_type_Num.alignment = "CenterCenter"
    RWR_type_Num.formats = {"%.f"}
    RWR_type_Num.UseBackground = false
    RWR_type_Num.element_params = {"RWR_CONTACT" .. i .. "UNIT_TYPE_SYM_NUMERIC",
                                   "RWR_CONTACT" .. i .. "AZIMUTH",
                                   "RWR_CONTACT" .. i .. "UNIT_TYPE_IS_NUMERIC",
                                    Nav_Radar_brightness_parameter,
                                    Nav_Radar_Display,
                                    "RWR_Overlay",
                                    "RWR_CONTACT" .. i .. "COLOR",
                                   }
    RWR_type_Num.controllers = {{"text_using_parameter", 0, 0},
                                {"rotate_using_parameter", 1, -1},
                                {"parameter_in_range", 2, 0.8, 1.09},
                                {"opacity_using_parameter", 3},
                                {"parameter_in_range", 4, 0.9, 1.1},
                                {"parameter_in_range", 5, 0.9, 1.1},
                                yellow_contact, magenta_contact
                                }
    RWR_type_Num.parent_element = "RWR_contact" .. i .. "name"
    AddElement(RWR_type_Num)

    -- LAUNCH RING
    x_size = 0.065
    local RWR_launch = CreateElement "ceStringPoly"
    RWR_launch.name = "RWR" .. i .. "launch"
    RWR_launch.init_pos = {0.0, 0.0, 0}
    RWR_launch.init_rot = {0.0, 0.0, 0.0}
    RWR_launch.material = RWR_MAGENTA
    set_circle(RWR_launch, x_size + 0.009, x_size, 360, 64)
    RWR_launch.element_params = {"RWR_CONTACT" .. i .. "LAUNCH_SYM",
                                 "RWR_CONTACT" .. i .. "AZIMUTH",
                                Nav_Radar_brightness_parameter,
                                Nav_Radar_Display,
                                "RWR_Overlay",
                                "NULL_PARAM (So that I can assume postion 6 for the color params",
                                "RWR_CONTACT" .. i .. "COLOR",
                            }
    RWR_launch.controllers = {{"parameter_in_range", 0, 0.4, 0.6},
                            {"rotate_using_parameter", 1, -1},
                            {"opacity_using_parameter", 2},
                            {"parameter_in_range", 3, 0.9, 1.1},
                            {"parameter_in_range", 4, 0.9, 1.1},
                            yellow_contact, magenta_contact
                        }
    RWR_launch.parent_element = "RWR_contact" .. i .. "name"
    AddElement(RWR_launch)

    local boxsz = 0.05

    local line_thick= 0.005

    local RWR_lock = CreateElement "ceStringPoly"
    RWR_lock.name = "RWR_" .. i .. "_lock"
    RWR_lock.init_pos = {0.0, 0.0, 0}
    RWR_lock.init_rot = {0.0, 0.0, 0.0}
    RWR_lock.material = RWR_MAGENTA

    RWR_lock.vertices       	= {{0-boxsz, boxsz}, {0+boxsz, boxsz}, {0+boxsz, boxsz-line_thick}, {0-boxsz, boxsz-line_thick},
                                   {0-boxsz, -boxsz}, {0+boxsz, -boxsz}, {0+boxsz, -boxsz-line_thick}, {0-boxsz, -boxsz-line_thick},
                                   {-boxsz, boxsz}, {-boxsz-line_thick, boxsz}, {-boxsz-line_thick, -boxsz-line_thick}, {-boxsz, -boxsz-line_thick},
                                   {boxsz, boxsz}, {boxsz+line_thick, boxsz}, {boxsz+line_thick, -boxsz-line_thick}, {boxsz, -boxsz-line_thick},
                                }

    RWR_lock.indices        	= {0, 1, 2, 0, 2, 3,
                                   0+4, 1+4, 2+4, 0+4, 2+4, 3+4,
                                   0+8, 1+8, 2+8, 0+8, 2+8, 3+8,
                                   0+12, 1+12, 2+12, 0+12, 2+12, 3+12}

    RWR_lock.element_params = {"RWR_CONTACT" .. i .. "LOCK_SYM",
                                "RWR_CONTACT" .. i .. "AZIMUTH",
                                Nav_Radar_brightness_parameter,
                                Nav_Radar_Display,
                                "RWR_Overlay",
                                "NULL_PARAM (So that I can assume postion 6 for the color params",
                                "RWR_CONTACT" .. i .. "COLOR",
                            }
    RWR_lock.controllers = {{"parameter_in_range", 0, 0.4, 0.6},
                             {"rotate_using_parameter", 1, -1},
                             {"opacity_using_parameter", 2},
                             {"parameter_in_range", 3, 0.9, 1.1},
                             {"parameter_in_range", 4, 0.9, 1.1},
                              yellow_contact, magenta_contact}
    RWR_lock.parent_element = "RWR_contact" .. i .. "name"
    AddElement(RWR_lock)
end
