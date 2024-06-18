local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 30,
	-- color = colors.bar.bg,
	color = 0x00000000, -- transparent bg
	padding_right = 6,
	padding_left = 6,
})
