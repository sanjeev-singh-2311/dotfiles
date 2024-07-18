-- Pull the Wezterm API
local wezterm = require("wezterm")

-- Variable to hold the configuration
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.tab_bar_at_bottom = true

-- Font style setup
config.font = wezterm.font_with_fallback({
	"mononoki",
	"InconsolataGo",
})

config.initial_cols = 175
config.initial_rows = 27

-- Padding setting
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Wezterm bar style -> credits to adriankarlen
local bar = require("bar")
bar.apply_to_config(config)

-- Tab bar appearance to change font and stuff
config.window_frame = {
	font = wezterm.font({ family = "InconsolataGo", weight = "Regular" }),
	font_size = 12.0,
}

config.window_background_opacity = 0.8
config.window_decorations = "NONE"

-- Wezterm keybindings based on TMUX
local keybind = require("keybindings")
keybind.apply_to_config(config)

-- returning the confguration
return config
