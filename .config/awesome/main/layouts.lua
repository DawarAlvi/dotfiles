local awful = require("awful")

local _M = {}

function _M.get()
    local layouts = {
        awful.layout.suit.max,
        -- awful.layout.suit.spiral.dwindle,
        -- awful.layout.suit.fair.horizontal,
        awful.layout.suit.fair,
    }

    return layouts
end

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end
})
