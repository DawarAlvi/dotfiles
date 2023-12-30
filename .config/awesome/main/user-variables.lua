local home = os.getenv("HOME")

local _M = {
    theme = "myth",
    terminal = "alacritty",
    file_manager = "thunar",
    editor = os.getenv("EDITOR") or "nvim",
    browser = "brave",
    rofi_theme = "TwoDark.rasi",
    modkey = "Mod4",
    autostarts = {
        "nm-applet",
        "numlockx on",
        "xrdb ~/.Xresources"
    },
}

return _M
