local gears = require("gears")
local awful = require("awful")

-- local hotkeys_popup = require("awful.hotkeys_popup").widget
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

local modkey = RC.vars.modkey
local altkey = RC.vars.altkey
local terminal = RC.vars.terminal
local file_manager = RC.vars.file_manager
local browser = RC.vars.browser
local rofi_command = "rofi -modi 'drun' -show drun -theme $HOME/.config/rofi/" .. RC.vars.rofi_theme

-- https://awesomewm.org/wiki/Global_Keybindings

local _M = {}

function _M.get()
    local globalkeys = gears.table.join (
        -- Standard program
        awful.key({modkey}, "s", hotkeys_popup.show_help, { description = "Help", group = "AWESOME"}), 
        awful.key({modkey, "Control"}, "r", awesome.restart, { description = "Reload Awesome", group = "AWESOME" }), 
        awful.key({modkey, "Shift"}, "q", awesome.quit, { description = "Quit Awesome", group = "AWESOME" }),
        awful.key({modkey}, "`", function() RC.mainmenu:show() end, { description = "Main Menu", group = "AWESOME" }),
        
        -- Prompt
        awful.key({modkey}, "r", function() awful.screen.focused().mypromptbox:run() end, { description = "Run prompt", group = "AWESOME" } ),
        awful.key({modkey}, "x", function()
            awful.prompt.run {
                prompt = "Run Lua code: ",
                textbox = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            } end, 
            { description = "Lua execute prompt", group = "AWESOME" }
        ),

        -- Launch programs
        awful.key({modkey}, "a", function() awful.spawn.with_shell(rofi_command) end, { description = "Rofi", group = "LAUNCH" }), 
        awful.key({modkey}, "p", function() menubar.show() end, { description = "Menubar", group = "LAUNCH" }),
        awful.key({modkey}, "e", function() awful.spawn(file_manager) end, { description = "File Manager", group = "LAUNCH" }), 
        awful.key({modkey}, "w", function() awful.spawn(browser) end, { description = "Browser", group = "LAUNCH" }), 
        awful.key({modkey}, "Return", function() awful.spawn(terminal) end, { description = "Terminal", group = "LAUNCH" }), 

        -- Special keys
        awful.key({}, "XF86AudioRaiseVolume",  function() awful.spawn.with_shell("pactl set-sink-volume  @DEFAULT_SINK@ +10%") end),
        awful.key({}, "XF86AudioLowerVolume",  function() awful.spawn.with_shell("pactl set-sink-volume  @DEFAULT_SINK@ -10%") end),
        awful.key({}, "XF86AudioMute",         function() awful.spawn.with_shell("pactl set-sink-mute @DEFAULT_SINK@ toggle") end),
        awful.key({}, "XF86AudioMicMute",      function() awful.spawn.with_shell("pactl set-source-mute @DEFAULT_SOURCE@ toggle") end),
        awful.key({}, "XF86MonBrightnessUp",   function() awful.spawn.with_shell("xbacklight -inc 5 ") end),
        awful.key({}, "XF86MonBrightnessDown", function() awful.spawn.with_shell("xbacklight -dec 5 ") end),
        awful.key({}, "XF86ScreenSaver",       function() awful.spawn.with_shell("xset dpms force off") end),

        -- Tag browsing
        awful.key({modkey}, "Left", awful.tag.viewprev, { description = "View previous", group = "TAG"}),
        awful.key({modkey}, "Right", awful.tag.viewnext, { description = "View next", group = "TAG" }),
        awful.key({modkey}, "Tab", awful.tag.history.restore, { description = "Go back", group = "TAG" }),
        
        -- Client
        awful.key({modkey}, "j", function() awful.client.focus.byidx(1) end, { description = "Focus Next Window", group = "CLIENT" }),
        awful.key({modkey}, "k", function() awful.client.focus.byidx(-1) end, { description = "Focus Prev Window", group = "CLIENT" }), 
        awful.key({modkey, "Shift"}, "j", function() awful.client.swap.byidx(1) end, { description = "Swap w/ next window", group = "CLIENT" }),
        awful.key({modkey, "Shift"}, "k", function() awful.client.swap.byidx(-1) end, { description = "Swap w/ prev window", group = "CLIENT" }), 
        awful.key({altkey}, "Tab", function() awful.client.focus.history.previous() if client.focus then client.focus:raise() end end, { description = "go back", group = "CLIENT" }),
        awful.key({modkey}, "u", awful.client.urgent.jumpto, { description = "Jump to urgent window", group = "CLIENT" }), 
        awful.key({modkey, "Control"}, "n", function() local c = awful.client.restore() if c then c:emit_signal("request::activate", "key.unminimize", { raise = true }) end end, { description = "Restore Minimized", group = "CLIENT" } ),

        
        -- Layout manipulation
        awful.key({modkey}, "l", function() awful.tag.incmwfact(0.05) end, { description = "increase master width factor", group = "LAYOUT" }),
        awful.key({modkey}, "h", function() awful.tag.incmwfact(-0.05) end, { description = "decrease master width factor", group = "LAYOUT" }),
        awful.key({modkey, "Shift"}, "h", function() awful.tag.incnmaster(1, nil, true) end, { description = "increase the number of master clients", group = "LAYOUT" }),
        awful.key({modkey, "Shift"}, "l", function() awful.tag.incnmaster(-1, nil, true) end, { description = "decrease the number of master clients", group = "LAYOUT" }),
        awful.key({modkey, "Control"}, "h", function() awful.tag.incncol(1, nil, true) end, { description = "increase the number of columns", group = "LAYOUT" }), 
        awful.key({modkey, "Control"}, "l", function() awful.tag.incncol(-1, nil, true) end, { description = "decrease the number of columns", group = "LAYOUT" }), 
        awful.key({modkey}, "space", function() awful.layout.inc(1) end, { description = "select next", group = "LAYOUT" }),
        awful.key({modkey, "Shift"}, "space", function() awful.layout.inc(-1) end, { description = "select previous", group = "LAYOUT" }),

        -- Screen
        awful.key({modkey, "Control"}, "j", function() awful.screen.focus_relative(1) end, { description = "focus the next screen", group = "SCREEN" }),
        awful.key({modkey, "Control"}, "k", function() awful.screen.focus_relative(-1) end, { description = "focus the previous screen", group = "SCREEN" }), 

        -- Resize
        awful.key({modkey, "Control"}, "Down", function() awful.client.moveresize(0, 0, 0, -20) end),
        awful.key({modkey, "Control"}, "Up", function() awful.client.moveresize(0, 0, 0, 20) end),
        awful.key({modkey, "Control"}, "Left", function() awful.client.moveresize(0, 0, -20, 0) end),
        awful.key({modkey, "Control"}, "Right", function() awful.client.moveresize(0, 0, 20, 0) end),
        -- Move
        awful.key({modkey, "Shift"}, "Down", function() awful.client.moveresize(0, 20, 0, 0) end),
        awful.key({modkey, "Shift"}, "Up", function() awful.client.moveresize(0, -20, 0, 0) end),
        awful.key({modkey, "Shift"}, "Left", function() awful.client.moveresize(-20, 0, 0, 0) end), 
        awful.key({modkey, "Shift"}, "Right", function() awful.client.moveresize(20, 0, 0, 0) end)
)

    return globalkeys
end

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end
})
