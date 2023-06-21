
local simulation_script = [[
    if game.active_mods["rainbow-vehicles"] then
        local tick = game.tick
        local nth_tick = 5
        if not (tick % nth_tick == 0) then goto end_of_rainbow_vehicles_script end
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
        
        local vehicles = {}
        for _, surface in pairs(game.surfaces) do
            for _, vehicle in pairs(surface.find_entities_filtered { type = { "car", "spider-vehicle" } }) do
                vehicles[vehicle.unit_number] = vehicle
            end
        end
        
        local map_settings = settings.global
        local rainbow_speed = map_settings["vehicle-rainbow-speed"].value
        if rainbow_speed == "off" then goto end_of_rainbow_vehicles_script end
        local alpha = pallette[map_settings["vehicle-rainbow-palette"].value]
        local frequency = speeds[rainbow_speed]
        for unit_number, vehicle in pairs(vehicles) do
            if vehicle and vehicle.valid then
                local id = vehicle.unit_number
                local modifier = frequency * (tick / nth_tick) + (id * 10)
                local rainbow = {
                    r = sin(modifier + no_pi) * 127 + 128,
                    g = sin(modifier + two_pi) * 127 + 128,
                    b = sin(modifier + four_pi) * 127 + 128,
                    a = alpha,
                }
                vehicle.color = rainbow
            end
        end
    end
    ::end_of_rainbow_vehicles_script::
]]

for _, main_menu_simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if main_menu_simulation then
        if main_menu_simulation.update then
            main_menu_simulation.update = main_menu_simulation.update .. simulation_script
        else
            main_menu_simulation.update = simulation_script
        end
    end
end
