local awful     = require('awful')
local beautiful = require('beautiful')
local apps      = require('config.apps')

-- Create a launcher widget. Opens Rofi when clicked.
return function()
   return awful.widget.button({
      image = beautiful.awesome_icon,
      buttons = {
	  awful.button({}, 1, nil, function ()
              awful.spawn(apps.launcher)
          end)
      }
   })
end
