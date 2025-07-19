
---@type {string: number}
local speeds = {
    off = 0,
    veryslow = 0.010,
    slow = 0.025,
    default = 0.050,
    fast = 0.100,
    veryfast = 0.200,
    extreme = 0.500,
}

---@type {string: {amplitude: float, center: float}}
local continuous_themes = {
    ["light"] = { amplitude = 15, center = 240 },
    ["pastel"] = { amplitude = 55, center = 200 },
    ["default"] = { amplitude = 127.5, center = 127.5 },
    ["vibrant"] = { amplitude = 50, center = 100 },
    ["deep"] = { amplitude = 25, center = 50 },
}

require("util")

---@type {string: Color[]}
local pride_flag_themes = {
    ["trans"] = {          -- trans pride
        util.color("#5BCEFA"), -- light blue
        util.color("#F5A9B8"), -- light pink
        util.color("#FFFFFF"), -- white
        -- util.color("#F5A9B8"), -- light pink
        -- util.color("#5BCEFA"), -- light blue
        -- util.color("#FFFFFF"), -- white
    },
    ["lesbian"] = {        -- lesbian pride
        util.color("#D52D00"), -- dark orange
        util.color("#EF7627"), -- mid orange
        util.color("#FF9A56"), -- light orange
        util.color("#FFFFFF"), -- white
        util.color("#D162A4"), -- light pink
        util.color("#B55690"), -- mid pink
        util.color("#A30262"), -- dark pink
    },
    ["bi"] = {             -- bi pride
        util.color("#D60270"), -- pink
        util.color("#D60270"), -- pink
        util.color("#9B4F96"), -- purple
        util.color("#0038A8"), -- blue
        util.color("#0038A8"), -- blue
    },
    ["nonbinary"] = {      -- nonbinary pride
        util.color("#FCF434"), -- yellow
        util.color("#FFFFFF"), -- white
        util.color("#9C59D1"), -- purple
        util.color("#000000"), -- black
    },
    ["pan"] = {            -- pan pride
        util.color("#FF218C"), -- pink
        util.color("#FFD800"), -- yellow
        util.color("#21B1FF"), -- blue
    },
    ["ace"] = {            -- ace pride
        util.color("#000000"), -- black
        util.color("#A3A3A3"), -- grey
        util.color("#FFFFFF"), -- white
        util.color("#800080"), -- purple
    },
    ["progress"] = {       -- progress pride
        util.color("#FFFFFF"), -- white
        util.color("#FFAFC8"), -- pink
        util.color("#74D7EE"), -- light blue
        util.color("#613915"), -- brown
        util.color("#000000"), -- black
        util.color("#E40303"), -- red
        util.color("#FF8C00"), -- orange
        util.color("#FFED00"), -- yellow
        util.color("#008026"), -- green
        util.color("#24408E"), -- blue
        util.color("#732982"), -- purple
    },
    ["agender"] = {        -- agender pride
        util.color("#000000"), -- black
        util.color("#BCC4C7"), -- grey
        util.color("#FFFFFF"), -- white
        util.color("#B7F684"), -- green
        -- util.color("#FFFFFF"), -- white
        -- util.color("#BCC4C7"), -- grey
        -- util.color("#000000"), -- black
    },
    ["gay"] = {            -- gay pride
        util.color("#078D70"), -- dark green
        util.color("#26CEAA"), -- medium green
        util.color("#98E8C1"), -- light green
        util.color("#FFFFFF"), -- white
        util.color("#7BADE2"), -- light blue
        util.color("#5049CC"), -- indigo
        util.color("#3D1A78"), -- dark blue
    }
}

---@type {string: Color[]}
local country_flag_themes = {
    ["united nations"] = {                   -- population 7.4 billion, rank 0
        util.color("#019EDB"),               -- blue
        util.color("#019EDB"),               -- blue
        util.color("#019EDB"),               -- blue
        util.color("#FFFFFF"),               -- white
        util.color("#019EDB"),               -- blue
        util.color("#019EDB"),               -- blue
        util.color("#019EDB"),               -- blue
    },
    ["china"] = {                            -- population 1.4 billion, rank 1
        util.color("#EE1C25"),               -- red
        util.color("#FFFF00"),               -- yellow
    },
    ["india"] = {                            -- population 1.3 billion, rank 2
        util.color("#FF9933"),               -- saffron
        util.color("#FFFFFF"),               -- white
        util.color("#138808"),               -- green
    },
    ["united states"] = {                    -- population 335 million, rank 3
        util.color("#B31942"),               -- red
        util.color("#FFFFFF"),               -- white
        util.color("#0A3161"),               -- blue
    },
    ["indonesia"] = {                        -- population 277 million, rank 4
        util.color("#ED1C24"),               -- red
        util.color("#FFFFFF"),               -- white
    },
    ["pakistan"] = {                         -- population 220 million, rank 5
        util.color("#FFFFFF"),               -- white
        util.color("#00401A"),               -- dark green
        util.color("#00401A"),               -- dark green
    },
    ["nigeria"] = {                          -- population 216 million, rank 6
        util.color("#008753"),               -- green
        util.color("#FFFFFF"),               -- white
        util.color("#008753"),               -- green
    },
    ["brazil"] = {                           -- population 203 million, rank 7
        util.color("#009739"),               -- green
        util.color("#FEDD00"),               -- yellow
        util.color("#FFFFFF"),               -- white
        util.color("#012169"),               -- blue
    },
    ["bangladesh"] = {                       -- population 162 million, rank 8
        util.color("#006a4e"),               -- green
        util.color("#f42a41"),               -- red
        util.color("#006A4E"),               -- green
    },
    ["russia"] = {                           -- population 146 million, rank 9
        util.color("#FFFFFF"),               -- white
        util.color("#1C3578"),               -- blue
        util.color("#E4181C"),               -- red
    },
    ["mexico"] = {                           -- population 129 million, rank 10
        util.color("#006341"),               -- dark green
        util.color("#FFFFFF"),               -- white
        util.color("#C8102E"),               -- red
    },
    ["japan"] = {                            -- population 124 million, rank 11
        util.color("#BC002D"),               -- red
        util.color("#FFFFFF"),               -- white
    },
    ["philippines"] = {                      -- population 110 million, rank 12
        util.color("#0038A8"),               -- blue
        util.color("#CE1126"),               -- red
        util.color("#FFFFFF"),               -- white
    },
    ["ethiopia"] = {                         -- population 105 million, rank 13
        util.color("#098930"),               -- green
        util.color("#FCDD0C"),               -- yellow
        util.color("#DA131B"),               -- red
    },
    ["egypt"] = {                            -- population 102 million, rank 14
        util.color("#CE1126"),               -- red
        util.color("#FFFFFF"),               -- white
        util.color("#000000"),               -- black
    },
    ["vietnam"] = {                          -- population 97 million, rank 15
        util.color("#DA251D"),               -- red
        util.color("#FFFF00"),               -- yellow
    },
    ["democratic republic of the congo"] = { -- population 89 million, rank 16
        util.color("#007FFF"),               -- blue
        util.color("#CE1021"),               -- red
        util.color("#F7D618"),               -- yellow
    },
    ["turkey"] = {                           -- population 84 million, rank 17
        util.color("#E30A17"),               -- red
        util.color("#FFFFFF"),               -- white
    },
    ["iran"] = {                             -- population 84 million, rank 18
        util.color("#239f40"),               -- green
        util.color("#FFFFFF"),               -- white
        util.color("#DA0000"),               -- red
    },
    ["germany"] = {                          -- population 84 million, rank 19
        util.color("#000000"),               -- schwarz
        util.color("#DD0000"),               -- rot
        util.color("#FFCE00"),               -- gold
    },
    ["thailand"] = {                         -- population 68 million, rank 20
        util.color("#A51931"),               -- red
        util.color("#F4F5F8"),               -- white
        util.color("#2D2A4A"),               -- blue
        util.color("#2D2A4A"),               -- blue
        util.color("#F4F5F8"),               -- white
        util.color("#A51931"),               -- red
    },
    ["france"] = {                           -- population 68 million, rank 21
        util.color("#0055A4"),               -- blue
        util.color("#FFFFFF"),               -- white
        util.color("#EF4135"),               -- red
    },
    ["united kingdom"] = {                   -- population 67 million, rank 22
        util.color("#FFFFFF"),               -- white
        util.color("#C8102E"),               -- red
        util.color("#012169"),               -- blue
    },
    ["tanzania"] = {                         -- population 61 million, rank 23
        util.color("#1FB53A"),               -- green
        util.color("#1FB53A"),               -- green
        util.color("#FCD116"),               -- yellow
        util.color("#000000"),               -- black
        util.color("#000000"),               -- black
        util.color("#FCD116"),               -- yellow
        util.color("#01A2DD"),               -- blue
        util.color("#01A2DD"),               -- blue
    },
    ["south africa"] = {                     -- population 60 million, rank 24
        util.color("#000000"),               -- black
        util.color("#FFB612"),               -- gold
        util.color("#007A4D"),               -- green
        util.color("#FFFFFF"),               -- white
        util.color("#DE3831"),               -- red
        util.color("#007A4D"),               -- green
        util.color("#FFFFFF"),               -- white
        util.color("#002395"),               -- blue
    },
    ["italy"] = {                            -- population 58 million, rank 25
        util.color("#008C45"),               -- green
        util.color("#F4F5F0"),               -- white
        util.color("#CD212A"),               -- red
    },
    ["ukraine"] = {                          -- population 41 million, rank 36
        util.color("#0057B7"),               -- blue
        util.color("#FFDD00"),               -- yellow
    },
    ["australia"] = {                        -- population 26 million, rank 53
        util.color("#00008B"),               -- blue
        util.color("#FFFFFF"),               -- white
        util.color("#FF0000"),               -- red
    },
    ["netherlands"] = {                      -- population 17 million, rank 67
        util.color("#AD1D25"),               -- red
        util.color("#FFFFFF"),               -- white
        util.color("#1E4785"),               -- blue
    },
    ["belgium"] = {                          -- population 11 million, rank 82
        util.color("#000000"),               -- black
        util.color("#FDDA24"),               -- yellow
        util.color("#EF3340"),               -- red
    },
    ["cuba"] = {                             -- population 11 million, rank 85
        util.color("#D21034"),               -- red
        util.color("#002590"),               -- blue
        util.color("#FFFFFF"),               -- white
    },
    ["czech republic"] = {                   -- population 10 million, rank 86
        util.color("#11457E"),               -- blue
        util.color("#FFFFFF"),               -- white
        util.color("#D7141A"),               -- red
    },
    ["greece"] = {                           -- population 10 million, rank 89
        util.color("#004C98"),               -- blue
        util.color("#FFFFFF"),               -- white
    },
    ["sweden"] = {                           -- population 10 million, rank 87
        util.color("#006AA7"),               -- blue
        util.color("#FECC02"),               -- yellow
    }
}

---@type {string: Color[]}
local stepwise_themes = {}
for name, colors in pairs(pride_flag_themes) do
    stepwise_themes[name] = colors
end
for name, colors in pairs(country_flag_themes) do
    stepwise_themes[name] = colors
end

local continuous_theme_keys = {}
for name, _ in pairs(continuous_themes) do
    table.insert(continuous_theme_keys, name)
end
local pride_flag_keys = {}
for name, _ in pairs(pride_flag_themes) do
    table.insert(pride_flag_keys, name)
end
local country_flag_keys = {}
for name, _ in pairs(country_flag_themes) do
    table.insert(country_flag_keys, name)
end
local all_keys = {}
for _, key in pairs(continuous_theme_keys) do
    table.insert(all_keys, key)
end
for _, key in pairs(pride_flag_keys) do
    table.insert(all_keys, key)
end
for _, key in pairs(country_flag_keys) do
    table.insert(all_keys, key)
end

local sin = math.sin
local floor = math.floor
local pi_0 = 0 * math.pi / 3
local pi_2 = 2 * math.pi / 3
local pi_4 = 4 * math.pi / 3

local color_luts = {}
local lut_resolution = 4096 -- lots of colors to choose from to make it nice and smooth
for theme_name, theme_data in pairs(continuous_themes) do
    local amplitude = theme_data.amplitude
    local center = theme_data.center
    local color_lut = {}
    for i = 0, lut_resolution - 1 do
        local angle = -(i / lut_resolution) * 2 * math.pi
        color_lut[i + 1] = {
            r = sin(angle + pi_0) * amplitude + center,
            g = sin(angle + pi_2) * amplitude + center,
            b = sin(angle + pi_4) * amplitude + center,
            a = 0.5 * 255
        }
    end
    color_luts[theme_name] = color_lut
end

---@param tick integer
---@param unique_id uint
---@param frequency uint
---@param theme_name string
---@return Color
local function get_rainbow_color(tick, unique_id, frequency, theme_name)
    local modifier = (unique_id + tick) * frequency
    local color_lut = color_luts[theme_name]
    local stepwise_theme = stepwise_themes[theme_name]
    if color_lut then
        local index = floor((modifier % 1) * lut_resolution) + 1
        return color_lut[index]
    elseif stepwise_theme then
        -- Handle stepwise themes
        local sharpness = 0.8
        local count = #stepwise_theme

        -- Determine the current base and next indices
        local base_index = floor(modifier % count) + 1
        local next_index = (base_index % count) + 1

        -- Time within the current step (0 to 1)
        local step_time = modifier % 1

        -- Adjust interpolation timing based on sharpness
        local t
        if step_time < sharpness then
            t = 0 -- Hold the base color
        else
            t = (step_time - sharpness) / (1 - sharpness) -- Smoothly interpolate at the end
        end

        -- Base and next colors
        local base_color = stepwise_theme[base_index]
        local next_color = stepwise_theme[next_index]

        -- Interpolate only when transitioning
        return {
            r = base_color.r * (1 - t) + next_color.r * t,
            g = base_color.g * (1 - t) + next_color.g * t,
            b = base_color.b * (1 - t) + next_color.b * t,
            a = 0.65
        }
    else
        return { 1, 1, 1, 0.65 }
    end
end

---@param event NthTickEventData
local function on_nth_tick(event)
    local frequency = storage.frequency
    if frequency == 0 then return end
    local tick = event.tick
    local tick_mod = tick % 3
    local vehicles = storage.vehicles or {}
    for unit_number, vehicle_data in pairs(vehicles) do
        if unit_number % 3 ~= tick_mod then goto next_vehicle end
        local vehicle = vehicle_data.vehicle
        if vehicle and vehicle.valid then
            vehicle.color = get_rainbow_color(tick, vehicle_data.phase_offset, frequency, vehicle_data.theme_name)
        else
            storage.vehicles[unit_number] = nil
        end
        ::next_vehicle::
    end
end

---@param name string
---@return string
local function get_color_theme(name)
    if continuous_themes[name] then
        return name
    elseif stepwise_themes[name] then
        return name
    elseif name == "random all" then
        return all_keys[math.random(#all_keys)]
    elseif name == "random rainbow" then
        return continuous_theme_keys[math.random(#continuous_theme_keys)]
    elseif name == "random pride" then
        return pride_flag_keys[math.random(#pride_flag_keys)]
    elseif name == "random country" then
        return country_flag_keys[math.random(#country_flag_keys)]
    else
        return name
    end
end

local function initialize_vehicles()
    ---@type table<integer, { vehicle: LuaEntity, theme_name: string, phase_offset: number }>
    storage.vehicles = {}
    storage.speed = settings.global["rainbow-vehicles-speed"].value --[[@as string]]
    storage.frequency = speeds[storage.speed] / 10
    storage.theme = settings.global["rainbow-vehicles-theme"].value --[[@as string]]
    for _, surface in pairs(game.surfaces) do
        for _, vehicle in pairs(surface.find_entities_filtered { type = { "car", "spider-vehicle" } }) do
            storage.vehicles[vehicle.unit_number] = {
                vehicle = vehicle,
                theme_name = get_color_theme(storage.theme),
                phase_offset = vehicle.unit_number * 3
            }
        end
    end
end

---@param event EventData.on_runtime_mod_setting_changed
local function on_runtime_mod_setting_changed(event)
    storage.speed = settings.global["rainbow-vehicles-speed"].value --[[@as string]]
    storage.frequency = speeds[storage.speed] / 10
    local old_theme = storage.theme
    local new_theme = settings.global["rainbow-vehicles-theme"].value --[[@as string]]
    if old_theme ~= new_theme then
        for _, vehicle_data in pairs(storage.vehicles) do
            vehicle_data.theme_name = get_color_theme(new_theme)
        end
    end
    storage.theme = new_theme
end

---@param vehicle LuaEntity
local function vehicle_built(vehicle)
    storage.vehicles = storage.vehicles or {}
    storage.vehicles[vehicle.unit_number] = {
        vehicle = vehicle,
        theme_name = get_color_theme(storage.theme),
        phase_offset = vehicle.unit_number * 3
    }
end

---@param event EventData.on_built_entity
local function on_built_entity(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end
    if entity.type == "car" or entity.type == "spider-vehicle" then
        vehicle_built(entity)
    end
end

---@param event EventData.on_entity_cloned
local function on_entity_cloned(event)
    local destination = event.destination
    if not (destination and destination.valid) then return end
    if destination.type == "car" or destination.type == "spider-vehicle" then
        vehicle_built(destination)
    end
end

---@param event EventData.on_robot_built_entity
local function on_robot_built_entity(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end
    if entity.type == "car" or entity.type == "spider-vehicle" then
        vehicle_built(entity)
    end
end

---@param event EventData.script_raised_built
local function on_script_raised_built(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end
    if entity.type == "car" or entity.type == "spider-vehicle" then
        vehicle_built(entity)
    end
end

---@param event EventData.script_raised_revive
local function on_script_raised_revive(event)
    local entity = event.entity
    if not (entity and entity.valid) then return end
    if entity.type == "car" or entity.type == "spider-vehicle" then
        vehicle_built(entity)
    end
end

script.on_init(initialize_vehicles)
script.on_configuration_changed(initialize_vehicles)
script.on_nth_tick(1, on_nth_tick)
script.on_event(defines.events.on_built_entity, on_built_entity)
script.on_event(defines.events.on_entity_cloned, on_entity_cloned)
script.on_event(defines.events.on_robot_built_entity, on_robot_built_entity)
script.on_event(defines.events.script_raised_built, on_script_raised_built)
script.on_event(defines.events.script_raised_revive, on_script_raised_revive)
script.on_event(defines.events.on_runtime_mod_setting_changed, on_runtime_mod_setting_changed)
