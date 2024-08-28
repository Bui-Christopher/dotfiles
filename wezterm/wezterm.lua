local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config = {
    enable_wayland = false,
    color_scheme = 'Windows High Contrast (base16)',
    font = wezterm.font 'MesloLGS NF',
    font_size = 14.5,
    keys = {
      {
        key = "t",
        mods = "CTRL",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
      },
      {
        key = "w",
        mods = "CTRL",
        action = wezterm.action.CloseCurrentTab({ confirm = true }),
      },
    }
}

return config
