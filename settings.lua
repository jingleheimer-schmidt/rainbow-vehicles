local rainbowSpeedSetting = {
  type = "string-setting",
  name = "vehicle-rainbow-speed",
  setting_type = "runtime-global",
  default_value = "default",
  allowed_values = {
    "off",
    "veryslow",
    "slow",
    "default",
    "fast",
    "veryfast"
  }
}

local rainbowPaletteSetting = {
  type = "string-setting",
  name = "vehicle-rainbow-palette",
  setting_type = "runtime-global",
  default_value = "default",
  allowed_values = {
    "pastel",
    "light",
    "default",
    "vibrant",
    "deep"
  }
}

data:extend({
  rainbowSpeedSetting,
  rainbowPaletteSetting
})
