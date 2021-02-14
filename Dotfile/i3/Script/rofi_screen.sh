#!/usr/bin/env bash

rofi_command="rofi -theme .config/i3/Rofi/3.rasi"
wallpaper="Wallpaper/wallpaper_55.jpg"

# Options
home=""
extended=""
new=""

# Variable passed to rofi
options="$home\n$extended\n$new"
chosen="$(echo -e "$options" | $rofi_command -dmenu)"
case $chosen in
    $home)
        exec ~/.config/i3/Script/home_screen.sh
        feh --bg-scale $wallpaper
        ;;
    $extended)
        ;;
    $new)
        exec arandr
        ;;
esac

