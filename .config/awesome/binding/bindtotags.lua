-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

function _M.get(globalkeys)
  for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
    
      -- View tag only.
      awful.key({ modkey }, "#" .. i + 9,
        function ()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            tag:view_only()
          end
        end,
        {description = "view tag #"..i, group = "TAG"}),

      -- Toggle tag display.
      awful.key({ modkey, "Control" }, "#" .. i + 9,
        function ()
          local screen = awful.screen.focused()
          local tag = screen.tags[i]
          if tag then
            awful.tag.viewtoggle(tag)
          end
        end,
        {description = "toggle tag #" .. i, group = "TAG"}),
      
      -- Move client to tag.
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
        function ()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:move_to_tag(tag)
            end
          end
        end,
        {description = "move focused client to tag #"..i, group = "TAG"}),
      
      -- Toggle tag on focused client.
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
        function ()
          if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
              client.focus:toggle_tag(tag)
            end
          end
        end,
        {description = "toggle focused client on tag #" .. i, group = "TAG"})

    )
  end

  return globalkeys
end

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
