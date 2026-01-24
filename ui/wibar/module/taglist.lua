local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local mod    = require('binds.mod')
local modkey = mod.modkey

return function(s)
   -- Create a taglist widget
   return awful.widget.taglist({
      screen  = s,
      filter  = awful.widget.taglist.filter.all,
      buttons = {
         -- Left-clicking a tag changes to it.
         awful.button(nil, 1, function(t) t:view_only() end),
         -- Mod + Left-clicking a tag sends the currently focused client to it.
         awful.button({ modkey }, 1, function(t)
            if client.focus then
               client.focus:move_to_tag(t)
            end
         end),
         -- Right-clicking a tag makes its contents visible in the current one.
         awful.button(nil, 3, awful.tag.viewtoggle),
         -- Mod + Right-clicking a tag makes the currently focused client visible 
         -- in it.
         awful.button({ modkey }, 3, function(t)
            if client.focus then
               client.focus:toggle_tag(t)
            end
         end),
         -- Mousewheel scrolling cycles through tags.
         awful.button(nil, 4, function(t) awful.tag.viewprev(t.screen) end),
         awful.button(nil, 5, function(t) awful.tag.viewnext(t.screen) end)
      },
      style = {
			  shape = gears.shape.square,
		  },
      layout = {
			spacing = 2,
			spacing_widget = {
				color = "#81a1c1",
				shape = gears.shape.square,
				widget = wibox.widget.separator,
			},
			layout = wibox.layout.fixed.horizontal,
		},
		widget_template = {
			{
				{
					{
						{
							id = "index_role",
							widget = wibox.widget.textbox,
						},
                                                margins = 4,
						widget  = wibox.container.margin,
						{
							id = "icon_role",
							widget = wibox.widget.imagebox,
						},
						margins = 4,
						widget = wibox.container.margin,
					},

					{
						id = "text_role",
						widget = wibox.widget.textbox,
					},
					left = 8,
					right = 8,
					widget = wibox.container.margin,
				},
				layout = wibox.layout.fixed.horizontal,
			},
			id = "background_role",
			widget = wibox.container.background,
			-- Add support for hover colors and an index label
			create_callback = function(self, c3, index, objects) --luacheck: no unused args
				self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
				self:connect_signal("mouse::enter", function()
					if self.bg ~= "#4c566a" then
						self.backup = self.bg
						self.has_backup = true
					end
					self.bg = "#4c566a"
				end)
				self:connect_signal("mouse::leave", function()
					if self.has_backup then
						self.bg = self.backup
					end
				end)
			end,
			update_callback = function(self, c3, index, objects) --luacheck: no unused args
				self:get_children_by_id("index_role")[1].markup = "<b> " .. index .. " </b>"
			end,
		},

		buttons = taglist_buttons,
   })
end
