local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/myth/"
theme.font                                      = "Noto Sans Bold 10"
theme.wallpaper                                 = os.getenv("HOME") .."/.wal.jpg"
theme.wallpaper_fallback                        = theme.dir .."background.png"

theme.bg                                        = "#000000"
theme.fg                                        = "#ffffff"
theme.hl                                        = "#01a0e4"
theme.urgent                                    = "#cc241d"

theme.bg_normal                                 = theme.bg
theme.bg_focus                                  = theme.bg
theme.bg_urgent                                 = theme.urgent
theme.bg_minimize                               = theme.bg
theme.bg_systray                                = theme.bg_normal
theme.fg_normal                                 = theme.fg
theme.fg_focus                                  = theme.hl
theme.fg_urgent                                 = theme.fg
theme.fg_minimize                               = theme.fg .. 66

theme.border_normal                             = theme.bg
theme.border_focus                              = theme.hl
theme.border_marked                             = theme.urgent 
theme.border_width                              = dpi(3)
theme.useless_gap                               = dpi(5)

theme.taglist_bg_focus                          = theme.hl
theme.taglist_fg_focus                          = theme.bg

theme.tasklist_disable_icon                     = false

-- MENU
theme.menu_bg_normal = theme.bg
theme.menu_bg_focus  = theme.hl
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus  = theme.bg
theme.menu_height = dpi(40)
theme.menu_width  = dpi(250)

-- ICONS
theme.titlebar_close_button_normal = theme.dir.."icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.dir.."icons/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.dir.."icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme.dir.."icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.dir.."icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme.dir.."icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.dir.."icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme.dir.."icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.dir.."icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme.dir.."icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.dir.."icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir.."icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.dir.."icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme.dir.."icons/titlebar/maximized_focus_active.png"

theme.layout_max = theme.dir.."icons/layouts/max.png"
theme.layout_dwindle = theme.dir.."icons/layouts/dwindle.png"
theme.layout_fairv = theme.dir.."icons/layouts/fairv.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.taglist_bg_focus, theme.bg_normal
)

return theme
