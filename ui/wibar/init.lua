local awful = require('awful')
local wibox = require('wibox')

local module = require(... .. '.module')

local mytextclock = wibox.widget.textclock('%I:%M %p')
local month_calendar = awful.widget.calendar_popup.month({ position = "bottom", })
month_calendar:attach( mytextclock, "tr" )
month_calendar:toggle()

return function(s)
   s.mypromptbox = awful.widget.prompt() -- Create a promptbox.

   -- Create the wibox
   s.mywibox = awful.wibar({
      position = 'bottom',
      screen   = s,
      height   = 40,
      border_width = 0,
      border_color = "#2e3440",
      widget   = {
         layout = wibox.layout.align.horizontal,
         -- Left widgets.
	 {
           {
              layout = wibox.layout.fixed.horizontal,
              spacing = 5,
              module.launcher(),
              module.taglist(s),
              module.tasklist(s),
              s.mypromptbox
           },
	   widget = wibox.container.margin,
	   margins = 5,
         },
         -- Middle widgets.
         wibox.widget.separator({ opacity = 0 }),
         -- Right widgets.
	 {
           {
              layout = wibox.layout.fixed.horizontal,
              spacing = 5,
              wibox.widget.systray(),
              mytextclock, -- Create a textclock widget.
              module.layoutbox(s)
           },
	   widget = wibox.container.margin,
	   margins = 8,
         }
      }
   })
end
