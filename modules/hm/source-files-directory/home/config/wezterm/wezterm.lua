local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "rose-pine-moon"
config.window_background_opacity = 0.7

config.font = wezterm.font_with_fallback {
    { family = "JetBrainsMono NF", weight = "Regular" },
    { family = "NOTONOTO", weight = "Regular" }
}

return config
