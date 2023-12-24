local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
    wallpaper = require("deco.wallpaper"),
    taglist = require("deco.taglist"),
    tasklist = require("deco.tasklist")
}

local taglist_buttons = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- battery infos from freedesktop upower
local mybattery = awful.widget.watch(
    { awful.util.shell, "-c", "upower -i /org/freedesktop/UPower/devices/battery_BAT1 | sed -n '/present/,/icon-name/p'" },
    10,
    function(widget, stdout)
        local bat_now = {
            state        = "N/A",
            percentage   = "N/A",
        }

        for k, v in string.gmatch(stdout, '([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)') do
            if k == "state" then bat_now.state = v
            elseif k == "percentage" then bat_now.percentage = tonumber(v) end
        end

        widget:set_text("  🔋 " .. bat_now.percentage .. "%  ")
    end
)

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(awful.button({}, 1, function()
        awful.layout.inc(1)
    end), awful.button({}, 3, function()
        awful.layout.inc(-1)
    end), awful.button({}, 4, function()
        awful.layout.inc(1)
    end), awful.button({}, 5, function()
        awful.layout.inc(-1)
    end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({
        position = "top",
        screen = s
    })

    -- Add widgets to the wibox
    s.mywibox:setup{
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            RC.launcher,
            s.mytaglist,
            s.mypromptbox
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            mybattery,
            mytextclock,
            s.mylayoutbox
        }
    }
end)
-- }}}
