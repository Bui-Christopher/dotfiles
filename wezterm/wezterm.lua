local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false
config.color_scheme = 'Windows High Contrast (base16)'

return config
