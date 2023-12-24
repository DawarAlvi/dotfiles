local awful = require("awful")

local _M = {}

function _M.get()
    local layouts = {
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.floating,
        awful.layout.suit.max,
    }

    return layouts
end

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end
})
