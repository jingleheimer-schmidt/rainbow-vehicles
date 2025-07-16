
for _, main_menu_simulation in pairs(data.raw["utility-constants"]["default"].main_menu_simulations) do
    if main_menu_simulation then
        main_menu_simulation.mods = main_menu_simulation.mods or {}
        table.insert(main_menu_simulation.mods, "rainbow-vehicles")
    end
end
