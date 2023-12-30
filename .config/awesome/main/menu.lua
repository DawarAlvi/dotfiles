local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local beautiful = require("beautiful") -- for awesome.icon

local M = {} -- menu
local _M = {} -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

local terminal = RC.vars.terminal
local editor = RC.vars.editor
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
    {"Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end},
    {"Manual", terminal .. " -e man awesome"},
    {"Edit Config", editor_cmd .. " " .. awesome.conffile},
    {"Restart", awesome.restart},
    {"Log out", function() awesome.quit() end}
}

M.power_menu = {
    {"Shutdown", "systemctl poweroff"},
    {"Restart", "systemctl reboot"},
}

function _M.get()
    -- Main Menu
    local menu_items = {
        {"Awesome", M.awesome, beautiful.awesome_subicon},
        {"Terminal", terminal},
        {"Power", M.power_menu},
    }

    return menu_items
end

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end
})
