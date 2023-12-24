local home = os.getenv("HOME")

local _M = {
    theme = "myth",
    wallpaper = home .. "/.wal.jpg",
    terminal = "alacritty",
    file_manager = "thunar",
    editor = os.getenv("EDITOR") or "nvim",
    browser = "brave",
    rofi_command = "rofi -modi 'drun' -show drun -theme $HOME/.config/rofi/TwoDark.rasi",
    modkey = "Mod4",
    autostarts = {
        "nm-applet",
        "numlockx on",
        "xrdb ~/.Xresources"
    },
}

return _M
