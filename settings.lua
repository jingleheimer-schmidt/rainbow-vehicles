
---@type data.ModStringSettingPrototype
local rainbow_speed = {
    type = "string-setting",
    name = "rainbow-vehicles-speed",
    setting_type = "runtime-global",
    default_value = "default",
    allowed_values = {
        "off",
        "veryslow",
        "slow",
        "default",
        "fast",
        "veryfast",
        "extreme",
    }
}

---@type data.ModStringSettingPrototype
local rainbow_theme = {
    type = "string-setting",
    name = "rainbow-vehicles-theme",
    setting_type = "runtime-global",
    default_value = "default",
    allowed_values = {
        "random all",
        -- original continuous themes
        "random rainbow",
        "light",
        "pastel",
        "default",
        "vibrant",
        "deep",
        -- stepwise pride flag themes
        "random pride",
        "lesbian",
        "gay",
        "bi",
        "trans",
        "pan",
        "ace",
        "nonbinary",
        "agender",
        "progress",
        -- stepwise country flag themes
        "random country",
        "united nations",
        "china",
        "india",
        "united states",
        "indonesia",
        "pakistan",
        "nigeria",
        "brazil",
        "bangladesh",
        "russia",
        "mexico",
        "japan",
        "philippines",
        "ethiopia",
        "egypt",
        "vietnam",
        "democratic republic of the congo",
        "turkey",
        "iran",
        "germany",
        "thailand",
        "france",
        "united kingdom",
        "tanzania",
        "south africa",
        "italy",
        "ukraine",
        "australia",
        "netherlands",
        "belgium",
        "cuba",
        "czech republic",
        "greece",
        "sweden",
    }
}

data:extend({
    rainbow_speed,
    rainbow_theme,
})
