local awful = require("awful")

local _M = {}

function _M.get()
    local layouts = {
        awful.layout.suit.max,
        awful.layout.suit.spiral.dwindle,
    }

    return layouts
end

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end
})
