local awful = require('awful')
local wibox = require('wibox')

local module = require(... .. '.module')

return function(s)
   s.mypromptbox = awful.widget.prompt() -- Create a promptbox.

   -- Create the wibox
   s.mywibox = awful.wibar({
      position = 'bottom',
      screen   = s,
      height   = 30,
      border_width = 5,
      border_color = "#2e3440",
      widget   = {
         layout = wibox.layout.align.horizontal,
         -- Left widgets.
         {
            layout = wibox.layout.fixed.horizontal,
            spacing = 5,
            module.launcher(),
            module.taglist(s),
            module.tasklist(s),
            s.mypromptbox
         },
         -- Middle widgets.
         wibox.widget.separator({ opacity = 0 }),
         -- Right widgets.
         {
            layout = wibox.layout.fixed.horizontal,
            spacing = 5,
            wibox.widget.systray(),
            wibox.widget.textclock(" %b %d %I:%M %p ", 1 ), -- Create a textclock widget.
            module.layoutbox(s)
         }
      }
   })
end
