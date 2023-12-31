-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")

local _M = {}
local modkey = RC.vars.modkey

function _M.get()
    local clientkeys = gears.table.join(awful.key({modkey}, "f", function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end, {
        description = "Fullscreen",
        group = "CLIENT"
    }), awful.key({modkey}, "q", function(c)
        c:kill()
    end, {
        description = "Quit",
        group = "CLIENT"
    }), awful.key({modkey, "Control"}, "space", awful.client.floating.toggle, {
        description = "Toggle Floating",
        group = "CLIENT"
    }), awful.key({modkey, "Control"}, "Return", function(c)
        c:swap(awful.client.getmaster())
    end, {
        description = "Move to master",
        group = "CLIENT"
    }), awful.key({modkey}, "o", function(c)
        c:move_to_screen()
    end, {
        description = "Move to screen",
        group = "CLIENT"
    }), awful.key({modkey}, "t", function(c)
        c.ontop = not c.ontop
    end, {
        description = "Toggle keep on top",
        group = "CLIENT"
    }), awful.key({modkey}, "n", function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
    end, {
        description = "Minimize",
        group = "CLIENT"
    }), awful.key({modkey}, "m", function(c)
        c.maximized = not c.maximized
        c:raise()
    end, {
        description = "UnMaximize",
        group = "CLIENT"
    }), awful.key({modkey, "Control"}, "m", function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end, {
        description = "UnMaximize vertically",
        group = "CLIENT"
    }), awful.key({modkey, "Shift"}, "m", function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end, {
        description = "UnMaximize horizontally",
        group = "CLIENT"
    }))

    return clientkeys
end

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end
})
