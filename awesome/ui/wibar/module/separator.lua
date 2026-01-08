local awful = require('awful')
local wibox = require('wibox')

local separator = wibox.widget({
		widget = wibox.widget.separator,
		forced_width = 10,
		opacity = 0,
	})
