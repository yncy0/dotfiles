-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

-- This will hold the configuration.

function module.apply_to_config(config)
	config.enable_tab_bar = false
	config.window_close_confirmation = "NeverPrompt"

	config.initial_cols = 120
	config.initial_rows = 28

  -- You can uncomment if you prefer other theme
	-- config.color_scheme = "Catppuccin Latte"
	config.color_scheme = "Gruvbox light, hard (base16)"
	config.font = wezterm.font("JetBrains Mono")
	config.enable_kitty_graphics = true
  
  -- Options for window background
	config.window_background_opacity = 0.9
	config.kde_window_background_blur = true

	config.window_decorations = "RESIZE"

	-- Window Frame
	config.window_frame = {
		border_left_width = "0.5cell",
		border_right_width = "0.5cell",
		border_bottom_height = "0.25cell",
		border_top_height = "0.25cell",
		border_left_color = "purple",
		border_right_color = "purple",
		border_bottom_color = "purple",
		border_top_color = "purple",
	}

	-- Key Tables
	config.leader = { key = "a", mods = "CTRL", timeout_ms = 1000 }
	config.keys = {
		{
			key = "m",
			mods = "LEADER",
			action = act.ToggleFullScreen,
		},
		{
			key = "n",
			mods = "LEADER",
			action = act.Hide,
		},
	}
end

return module
