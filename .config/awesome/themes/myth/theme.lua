local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font                                      = "SFNS Display 9"
theme.wallpaper                                 = os.getenv("HOME") .."/.wal.jpg"
theme.icon_theme                                = nil

theme.bg_normal                                 = "#030303"
theme.bg_focus                                  = "#030303"
theme.bg_urgent                                 = "#cc241d"
theme.bg_minimize                               = "#030303"
theme.bg_systray                                = theme.bg_normal
theme.fg_normal                                 = "#aaaaaa"
theme.fg_focus                                  = "#ffffff"
theme.fg_urgent                                 = "#ffffff"
theme.fg_minimize                               = "#ffffff"

theme.border_normal                             = "#000000"
theme.border_focus                              = "#01a0e4"
theme.border_marked                             = "#cc241d"
theme.border_width                              = dpi(2)
theme.useless_gap                               = dpi(5)

theme.taglist_bg_focus                          = "#01a0e4"
theme.taglist_fg_focus                          = "#ffffff"

theme.tasklist_disable_icon                     = false

-- MENU
theme.menu_bg_normal = theme.bg_normal
theme.menu_bg_focus  = theme.bg_normal
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus  = theme.taglist_bg_focus
theme.menu_height = dpi(30)
theme.menu_width  = dpi(200)

-- ICONS
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

return theme