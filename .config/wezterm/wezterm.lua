-- Pull the Wezterm API
local wezterm = require("wezterm")

-- Variable to hold the configuration
local config = wezterm.config_builder()

config.color_scheme = "tokyonight"

config.tab_bar_at_bottom = true

-- Turn off that annoying bell
config.audible_bell = "Disabled"

-- Font style setup
config.font = wezterm.font_with_fallback({
	"Mononoki Nerd Font",
})

-- GPU acceleration settings
config.front_end = "WebGpu"

config.webgpu_preferred_adapter = {
	backend = "Vulkan",
	device = 5966,
	device_type = "DiscreteGpu",
	driver = "NVIDIA",
	driver_info = "565.57.01",
	name = "NVIDIA GeForce MX110",
	vendor = 4318,
}

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
	font = wezterm.font({ family = "Mononoki Nerd Font", weight = "Regular" }),
}

config.window_background_opacity = 0.7
config.window_decorations = "NONE"

-- Wezterm keybindings based on TMUX
local keybind = require("keybindings")
keybind.apply_to_config(config)

-- returning the confguration
return config
