local gears = require("gears")
local beautiful = require("beautiful")

function set_wallpaper(s)
  -- Wallpaper
  if not gears.filesystem.file_readable(beautiful.wallpaper) then
    beautiful.wallpaper = require("themes."..RC.vars.theme..".theme").wallpaper_fallback
  end

  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)