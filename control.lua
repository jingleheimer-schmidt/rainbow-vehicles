
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

script.on_nth_tick(10, function(event)
  local frequency = 0.050
  local rainbow_speed = settings.global["vehicle-rainbow-speed"].value
  if rainbow_speed == "off" then
    return
  else
    frequency = speeds[rainbow_speed]
  end
  for every, surface in pairs(game.surfaces) do
    for each, vehicle in pairs(surface.find_entities_filtered{type = {"car", "spider-vehicle"}}) do
      if vehicle then
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
      end
    end
  end
end
)
