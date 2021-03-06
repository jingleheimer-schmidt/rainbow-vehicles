
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

if not global.vehicles then
  global.vehicles = {}
end

script.on_init(function()
  for every, surface in pairs(game.surfaces) do
    for each, vehicle in pairs(surface.find_entities_filtered{type={"car","spider-vehicle"}}) do
      if not global.vehicles then
        global.vehicles = {}
      end
      global.vehicles[vehicle.unit_number] = vehicle
    end
  end
end)

script.on_configuration_changed(function()
  for every, surface in pairs(game.surfaces) do
    for each, vehicle in pairs(surface.find_entities_filtered{type={"car","spider-vehicle"}}) do
      if not global.vehicles then
        global.vehicles = {}
      end
      global.vehicles[vehicle.unit_number] = vehicle
    end
  end
end)

script.on_nth_tick(10, function(event)
  local frequency = 0.050
  local rainbow_speed = settings.global["vehicle-rainbow-speed"].value
  if rainbow_speed == "off" then
    return
  else
    frequency = speeds[rainbow_speed]
  end
  for unit_number, vehicle in pairs(global.vehicles) do
    if vehicle and vehicle.valid then
      local id = vehicle.unit_number
      local nth_tick = event.nth_tick
      local tick = event.tick
      local rainbow = {
        r = math.sin(frequency*((tick/nth_tick)+(id*10))+(0*math.pi/3))*127+128,
        g = math.sin(frequency*((tick/nth_tick)+(id*10))+(2*math.pi/3))*127+128,
        b = math.sin(frequency*((tick/nth_tick)+(id*10))+(4*math.pi/3))*127+128,
        a = pallette[settings.global["vehicle-rainbow-palette"].value],
      }
      vehicle.color = rainbow
    else
      global.vehicles[unit_number] = nil
    end
  end
end
)

function on_built(event)
  local entity = event.created_entity or event.entity or event.destination
  if entity.type == "car" or entity.type == "spider-vehicle" then
    global.vehicles[entity.unit_number] = entity
  end
end

script.on_event(defines.events.on_built_entity, on_built)
script.on_event(defines.events.on_entity_cloned, on_built)
script.on_event(defines.events.on_robot_built_entity, on_built)
script.on_event(defines.events.script_raised_built, on_built)
script.on_event(defines.events.script_raised_revive, on_built)
