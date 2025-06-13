-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

local module = {}

-- This will hold the configuration.

function module.apply_to_config(config)
  config.enable_tab_bar = false
  config.window_close_confirmation = "NeverPrompt"

  config.initial_cols = 120
  config.initial_rows = 28

  -- config.color_scheme = "Catppuccin Latte"
  config.color_scheme = "Gruvbox light, hard (base16)"
  config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })
  config.enable_kitty_graphics = true

  config.window_background_opacity = 0.55
  config.kde_window_background_blur = true

  -- Key Tables

  config.leader = { key = 'a', mods = "CTRL", timeout_ms = 1000 }
  config.keys = {
    {
      key = 'm',
      mods = "LEADER",
      action = act.ToggleFullScreen
    },
    {
      key = "n",
      mods = "LEADER",
      action = act.Hide
    },
  }
end

return module
