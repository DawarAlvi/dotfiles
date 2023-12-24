local awful = require("awful")

local _M = {}

function _M.get()
    tags = {}

    awful.screen.connect_for_each_screen(function(s)
        tags[s] = awful.tag({"1", "2", "3"}, s, RC.layouts[1])
    end)

    return tags
end

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end
})
