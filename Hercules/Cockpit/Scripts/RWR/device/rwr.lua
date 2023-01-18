dofile(LockOn_Options.script_path .. "devices.lua")
dofile(LockOn_Options.script_path .. "command_defs.lua")
-- dofile(LockOn_Options.script_path .. "utils.lua")
dofile(LockOn_Options.script_path .. "RWR/indicator/symbols.lua")
local gettext = require("i_18n")
_ = gettext.translate

dofile[[Scripts\socket.lua]]
local gettime = socket.gettime

rwrPower = get_param_handle("RWR_POWER")
rwrLoudness = get_param_handle("RWR_LOUDNESS")
rwrDisplay = get_param_handle("RWR_DISPLAY")
rwrOverlay = get_param_handle("RWR_Overlay")
-- rwr_brightness = get_param_handle(Nav_Radar_brightness_parameter)
ac_ok = get_param_handle("AC_OK")

update_time_step = 0.2
make_default_activity(update_time_step)
new_contact_time = 7.5
local dev = GetSelf()

electric_system = GetDevice(devices.ELECTRIC_SYSTEM)

MaxThreats = 20
EmitterLiveTime = 7.0
EmitterSoundTime = 0.5
LaunchSoundDelay = 15.0

DefaultType = 100

RWR_detection_coeff = 0.85
DEFAULT_TYPE_ = {DefaultType, DefaultType, DefaultType, DefaultType}

eyes = {} -- sensor locations
eyes[1] = {
    position = {
        x = 2.57,
        y = -0.7,
        z = 0.8
    }, -- {Forward/Back,U/D,L/R}
    orientation = {
        azimuth = math.rad(45),
        elevation = math.rad(0.0)
    },
    field_of_view = math.rad(120)
}
eyes[2] = {
    position = {
        x = 2.57,
        y = -0.7,
        z = -0.8
    },
    orientation = {
        azimuth = math.rad(-45),
        elevation = math.rad(0.0)
    },
    field_of_view = math.rad(120)
}
eyes[3] = {
    position = {
        x = -3,
        y = 0.5,
        z = 0.3
    },
    orientation = {
        azimuth = math.rad(135),
        elevation = math.rad(0.0)
    },
    field_of_view = math.rad(120)
}
eyes[4] = {
    position = {
        x = -3,
        y = 0.5,
        z = -0.3
    },
    orientation = {
        azimuth = math.rad(-135),
        elevation = math.rad(0.0)
    },
    field_of_view = math.rad(120)
}

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

rwr = {}
for ia = 1, 20 do
    if ia < 10 then
        i = "_0" .. ia .. "_"
    else
        i = "_" .. ia .. "_"
    end
    rwr[ia] = {
        -- elevation_h = get_param_handle("RWR_CONTACT" .. i .. "ELEVATION"),
        azimuth_h = get_param_handle("RWR_CONTACT" .. i .. "AZIMUTH"),
        power_h = get_param_handle("RWR_CONTACT" .. i .. "POWER"),
        unit_type_h = get_param_handle("RWR_CONTACT" .. i .. "UNIT_TYPE"),

        general_type_h = get_param_handle("RWR_CONTACT" .. i .. "GENERAL_TYPE"),
        priority_h = get_param_handle("RWR_CONTACT" .. i .. "PRIORITY"),
        signal_h = get_param_handle("RWR_CONTACT" .. i .. "SIGNAL"),
        time_h = get_param_handle("RWR_CONTACT" .. i .. "TIME"),
        source_h = get_param_handle("RWR_CONTACT" .. i .. "SOURCE"),

        unit_type_sym_h = get_param_handle("RWR_CONTACT" .. i .. "UNIT_TYPE_SYM"),
        unit_type_sym_num = get_param_handle("RWR_CONTACT" .. i .. "UNIT_TYPE_SYM_NUMERIC"),

        unit_type_is_num = get_param_handle("RWR_CONTACT" .. i .. "UNIT_TYPE_IS_NUMERIC"),
        power_sym_h = get_param_handle("RWR_CONTACT" .. i .. "POWER_SYM"),
        lock_sym_h = get_param_handle("RWR_CONTACT" .. i .. "LOCK_SYM"),
        launch_sym_h = get_param_handle("RWR_CONTACT" .. i .. "LAUNCH_SYM"),
        color_sym_h = get_param_handle("RWR_CONTACT" .. i .. "COLOR"),
        first_seen = get_param_handle("RWR_CONTACT" .. i .. "FIRST_SEEN"),
    }
    rwr[ia].first_seen:set(-1.0)
end


dev:listen_command(RWR.OnOffSwitch)
dev:listen_command(ICS_PANEL.PILOT_ICS_UNDEF_KNOB_ROT)
dev:listen_command(RWR.Loudness)

function round(num, idp)
    local mult = 10^(idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

function SetCommand(command, value)

    if command == ICS_PANEL.PILOT_ICS_UNDEF_KNOB_ROT then
        rwrLoudness:set(math.min(1.0, math.max(-1.0, rwrLoudness:get()+value)))
        new_val = (rwrLoudness:get()+1.0)/2.0
        volumeLock = math.pow((((round(new_val / 0.5, 2)) * 0.3)), 3)
        volumeWarn = math.pow((((round(new_val / 0.5, 2)) * 0.4)), 3)
        rwrLock:update(nil, volumeLock, nil)
        rwrLaunch:update(nil, volumeWarn, nil)
    end

    if command == RWR.OnOffSwitch then
        rwrPower:set(1.0)
    end

    if command == RWR.Loudness then
        volumeLock = math.pow((((round(value / 0.5, 2)) * 0.3)), 3)
        volumeWarn = math.pow((((round(value / 0.5, 2)) * 0.4)), 3)
        rwrLock:update(nil, volumeLock, nil)
        rwrLaunch:update(nil, volumeWarn, nil)
    end
end

local counter = 0
function update()
    -- print_message_to_user(rwrOverlay:get())
    counter = counter + update_time_step
    local tmp_type, tmp_signal, tmp_gen_type
    local lock = false
    local warn = false
    for i = 1, 20 do

        tmp_type = rwr[i].unit_type_h:get()

        tmp_gen_type = rwr[i].general_type_h:get()
        if tmp_type and tmp_type ~= "" then

            if tmp_type ~= 0 then
                if rwr[i].time_h:get() == -1 then
                    rwr[i].first_seen:set(-1)
                else
                    if rwr[i].first_seen:get() == -1 then
                        rwr[i].first_seen:set(gettime())
                        rwr[i].color_sym_h:set(1.0)
                    end
                end

                if (gettime() - rwr[i].first_seen:get()) < new_contact_time then
                    rwr[i].color_sym_h:set(1.0)
                else
                    rwr[i].color_sym_h:set(2.0)
                end

                tmp_signal = rwr[i].signal_h:get()
                if tmp_signal == 2 then -- 2 Lock
                    lock = true
                    rwr[i].lock_sym_h:set(0.5)
                elseif tmp_signal == 3 then -- 3 Launch
                    warn = true
                    if rwr[i].lock_sym_h:get() == 1 then
                        rwr[i].lock_sym_h:set(0.5)
                        rwr[i].launch_sym_h:set(0.5)
                        lock = true
                    else
                        rwr[i].lock_sym_h:set(0.5)
                        rwr[i].launch_sym_h:set(0.5)
                        lock = true
                    end
                else -- else 1 - Search
                    rwr[i].lock_sym_h:set(1.0)
                end

                symb = symbols[tmp_type]
                if symb == nil then
                    symb = "UU"
                end

                if tonumber(symb) ~= nil then
                    rwr[i].unit_type_sym_num:set(symb)
                    rwr[i].unit_type_is_num:set(1.0)
                else
                    rwr[i].unit_type_sym_h:set(symb)
                    rwr[i].unit_type_is_num:set(0.5)
                end

            end
        end
        tmp = 1 - rwr[i].power_h:get() + 0.1
        rwr[i].power_sym_h:set(tmp)
    end

    if ac_ok:get() == 1 and rwrPower:get() == 1 then
        if lock == false then
            if rwrLock:is_playing() then
                rwrLock:stop()
                rwrLock:update(nil, volumeLock, nil)
            end
        else

            if not rwrLock:is_playing() then
                rwrLock:play_continue()
                rwrLock:update(nil, volumeLock, nil)
            end
        end

        if warn == false then
            if rwrLaunch:is_playing() then
                rwrLaunch:stop()
            end
        else
            if not rwrLaunch:is_playing() then
                rwrLaunch:play_continue()
            end
        end
    else
        if rwrLock:is_playing() then
            rwrLock:stop()
        end
        if rwrLaunch:is_playing() then
            rwrLaunch:stop()
        end
    end
    rwrLock:update(nil, volumeLock, nil)
    rwrLaunch:update(nil, volumeWarn, nil)

    if ac_ok:get() == 1 and rwrPower:get() == 1 then
        dev:set_power(true)
    else
        dev:set_power(false)
    end

end

-- _G.update = update


function post_initialize()

    soundhost = create_sound_host("COCKPIT_RADAR_WARN", "HEADPHONES", 0, 0, 0)
    rwrLaunch = soundhost:create_sound("Cockpit/rwr_warn")
    rwrLock = soundhost:create_sound("Cockpit/rwr_lock")

    update()

    local birth = LockOn_Options.init_conditions.birth_place
    if birth == "GROUND_HOT" or birth == "AIR_HOT" then
        dev:performClickableAction(RWR.OnOffSwitch, 1, true)
        dev:performClickableAction(ICS_PANEL.PILOT_ICS_UNDEF_KNOB_ROT, 0.5, false)
        dev:performClickableAction(RWR.Loudness, 0.5)
    elseif birth == "GROUND_COLD" then
        dev:performClickableAction(RWR.OnOffSwitch, 0, true)
    end

end