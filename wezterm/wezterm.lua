-- {{{ Defaults
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- }}}
-- {{{ Window
-- config.window_background_image = "~/Documents/img-backgrounds/sacred-geometry.jpeg"
config.window_decorations = "RESIZE" -- remove window decorations
config.macos_window_background_blur = 5
config.window_background_opacity = 0.85
config.window_background_gradient = {
	orientation = "Vertical",
	colors = {
		"#1E1E2F",
		"#1E1E2F",
	},
	blend = "Rgb",
	interpolation = "Linear",
}

config.window_padding = {
	left = 0,
	right = 12,
	top = 6,
	bottom = 0,
}
--}}}
-- {{{ Panes
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}
--}}}
-- {{{ Colors
config.color_scheme = "Catppuccin Mocha"
-- }}}
-- {{{ Tabs
config.enable_tab_bar = false -- remove tab bar
-- }}}
-- {{{ Keys
config.keys = {
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
	{
		-- Disable Cmd+T (or Super+T on some systems)
		key = "t",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
}
-- }}}
-- {{{ Font
config.font = wezterm.font({ family = "Maple Mono NF" })
config.font_size = 14.0
config.line_height = 1.2
config.cell_width = 0.95
config.freetype_load_flags = "NO_HINTING"
config.cursor_blink_rate = 400
config.font_rasterizer = "FreeType"
config.underline_position = -4
config.underline_thickness = 2

config.font_rules = {
	-- Bold & Italic
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Maple Mono NF",
			weight = "Bold",
			style = "Italic",
		}),
	},
	-- Italic
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({
			family = "Maple Mono NF",
			weight = "DemiBold",
			style = "Italic",
		}),
	},
	-- Normal & Italic
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({
			family = "Maple Mono NF",
			style = "Italic",
		}),
	},
	-- Normal
	{
		italic = false,
		intensity = "Normal", ---@type "Normal" | "Half" | "Bold"
		font = wezterm.font({
			family = "Maple Mono NF",
			style = "Normal",
		}),
	},
	-- Bold
	{
		italic = false,
		intensity = "Bold",
		font = wezterm.font({
			family = "Maple Mono NF",
			weight = "Bold",
			style = "Normal",
		}),
	},
}
-- }}}
-- {{{ Mouse
config.hide_mouse_cursor_when_typing = true
-- }}}
-- {{{ Options
config.audible_bell = "Disabled" -- disable sounds when at the end of doc
-- }}}
-- config.default_prog = { 'zel', '-l', 'welcome'}

return config
