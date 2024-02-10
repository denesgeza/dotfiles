local wezterm = require("wezterm")
local config = {}

-- =======================================================
-- UI
-- -- =======================================================
config.color_scheme = "Catppuccin Macchiato (Gogh)"
-- config.color_scheme = 'Kanagawa (Gogh)'
config.window_background_opacity = 1.0
config.text_background_opacity = 0.3
-- =======================================================
-- Font
-- -- =======================================================
config.font = wezterm.font("Fira Code NFM")
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
})
-- -- Testing with Monaspace {{{
-- config.font = wezterm.font({
-- 	-- family = "Monaspace Neon",
-- 	family = "Monaspace Argon",
-- 	-- family='Monaspace Xenon',
-- 	-- family = "Monaspace Radon",
-- 	-- family='Monaspace Krypton',
-- 	weight = "Regular",
-- 	harfbuzz_features = { "calt", "liga", "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" },
-- })
--
-- -- https://wezfurlong.org/wezterm/config/lua/config/font_rules.html
-- -- wezterm ls-fonts
-- -- wezterm ls-fonts --list-system
-- config.font_rules = {
-- 	--
-- 	-- Italic (comments)
-- 	--
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font({
-- 			family = "Monaspace Radon",
-- 			weight = "ExtraLight",
-- 			stretch = "Normal",
-- 			style = "Normal",
-- 			harfbuzz_features = {
-- 				"calt",
-- 				"liga",
-- 				"dlig",
-- 				"ss01",
-- 				"ss02",
-- 				"ss03",
-- 				"ss04",
-- 				"ss05",
-- 				"ss06",
-- 				"ss07",
-- 				"ss08",
-- 			},
-- 		}),
-- 	},
--
-- 	--
-- 	-- Bold (highlighting)
-- 	--
-- 	{
-- 		intensity = "Bold",
-- 		italic = false,
-- 		font = wezterm.font({
-- 			family = "Monaspace Krypton",
-- 			weight = "Light",
-- 			stretch = "Normal",
-- 			style = "Normal",
-- 			harfbuzz_features = {
-- 				"calt",
-- 				"liga",
-- 				"dlig",
-- 				"ss01",
-- 				"ss02",
-- 				"ss03",
-- 				"ss04",
-- 				"ss05",
-- 				"ss06",
-- 				"ss07",
-- 				"ss08",
-- 			},
-- 		}),
-- 	},
-- }
-- -- }}}
-- =======================================================
-- window frame
-- =======================================================
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 13.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#575757",
	},
}

return config
