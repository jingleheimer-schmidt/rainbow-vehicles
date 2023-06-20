
local speeds = {
  veryslow = 0.010,
  slow = 0.025,
  default = 0.050,
  fast = 0.100,
  veryfast = 0.200,
}

local pallette = {
  pastel = 1,
  light = 64,
  default = 128,
  vibrant = 192,
  deep = 255,
}

local pi = math.pi
local no_pi = 0 * pi / 3
local two_pi = 2 * pi / 3
local four_pi = 4 * pi / 3
local sin = math.sin

local function initialize_vehicles()
  global.vehicles = {} --[[@type table<uint, LuaEntity>]]
  for _, surface in pairs(game.surfaces) do
    for _, vehicle in pairs(surface.find_entities_filtered { type = { "car", "spider-vehicle" } }) do
      global.vehicles[vehicle.unit_number] = vehicle
    end
  end
end

---@param event NthTickEventData
local function on_nth_tick(event)
  local map_settings = settings.global
  local rainbow_speed = map_settings["vehicle-rainbow-speed"].value
  if rainbow_speed == "off" then return end
  local alpha = pallette[map_settings["vehicle-rainbow-palette"].value]
  local frequency = speeds[rainbow_speed]
  for unit_number, vehicle in pairs(global.vehicles) do
    if vehicle and vehicle.valid then
      local id = vehicle.unit_number
      local nth_tick = event.nth_tick
      local tick = event.tick
      local modifier = frequency * (tick / nth_tick) + (id * 10)
      local rainbow = {
        r = sin(modifier + no_pi) * 127 + 128,
        g = sin(modifier + two_pi) * 127 + 128,
        b = sin(modifier + four_pi) * 127 + 128,
        a = alpha,
      }
      vehicle.color = rainbow
    else
      global.vehicles[unit_number] = nil
    end
  end
end

---@param event EventData.on_built_entity | EventData.on_entity_cloned | EventData.on_robot_built_entity | EventData.script_raised_built | EventData.script_raised_revive
local function on_built(event)
  local entity = event.created_entity or event.entity or event.destination
  if entity.type == "car" or entity.type == "spider-vehicle" then
    global.vehicles = global.vehicles or {}
    global.vehicles[entity.unit_number] = entity
  end
end

script.on_init(initialize_vehicles)
script.on_configuration_changed(initialize_vehicles)
script.on_nth_tick(5, on_nth_tick)
script.on_event(defines.events.on_built_entity, on_built)
script.on_event(defines.events.on_entity_cloned, on_built)
script.on_event(defines.events.on_robot_built_entity, on_built)
script.on_event(defines.events.script_raised_built, on_built)
script.on_event(defines.events.script_raised_revive, on_built)
