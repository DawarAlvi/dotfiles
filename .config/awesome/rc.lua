pcall(require, "luarocks.loader")

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local menubar = require("menubar")
local beautiful = require("beautiful")

require("awful.autofocus")
require("awful.hotkeys_popup.keys")
local hotkeys_popup = require("awful.hotkeys_popup")

local config_path = gears.filesystem.get_dir("config")

-- Error Handling
dofile(config_path .. "main/error-handling.lua")

-- Global Namespace
RC = {}
RC.vars = require("main.user-variables")
modkey = RC.vars.modkey

-- Theme
beautiful.init(config_path .. "themes/" .. RC.vars.theme .. "/theme.lua")

local main = {
    layouts = require("main.layouts"),
    tags = require("main.tags"),
    menu = require("main.menu"),
    rules = require("main.rules")
}

local binding = {
    globalbuttons = require("binding.globalbuttons"),
    clientbuttons = require("binding.clientbuttons"),
    globalkeys = require("binding.globalkeys"),
    bindtotags = require("binding.bindtotags"),
    clientkeys = require("binding.clientkeys")
}

-- Layouts
RC.layouts = main.layouts()
awful.layout.layouts = RC.layouts

-- Tags
RC.tags = main.tags()

-- Menu
RC.mainmenu = awful.menu({
    items = main.menu()
}) -- in globalkeys

RC.launcher = wibox.container.margin(awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = RC.mainmenu
}))
RC.launcher.right = 2
menubar.utils.terminal = RC.vars.terminal

-- Mouse and Key bindings
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

-- Set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

-- Statusbar
require("deco.statusbar")

-- Rules
awful.rules.rules = main.rules(binding.clientkeys(), binding.clientbuttons())

-- Signals
require("main.signals")

-- Autostarts
for _,app in pairs(RC.vars.autostarts) do
    awful.spawn.with_shell(app)
end

-- My test bar
local enable_test_bar = false
if enable_test_bar then
    
    local launcher = awful.widget.launcher({
        image = beautiful.awesome_icon,
        menu = RC.mainmenu
    })
    local clock = wibox.container.place(wibox.widget.textclock(" %a %b %d %I:%M %p"),"center", "center")

    awful.screen.connect_for_each_screen(function(s)
        s.bar = awful.wibar({
            position = "bottom",
            screen = s
        })
        s.bar:setup {
            launcher,
            layout = wibox.layout.stack,
            {
                layout = wibox.layout.flex.horizontal,
                clock
            },
            {
                layout = wibox.layout.fixed.horizontal,
                launcher,
            },
            
        }
    end)

end