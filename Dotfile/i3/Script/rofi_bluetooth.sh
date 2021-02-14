#!/usr/bin/env bash

rofi_command="rofi -theme .config/i3/Rofi/4.rasi"

# Options
power=""
marshall=""
blueman=""
exit=""

# Variable passed to rofi
options="$power\n$marshall\n$blueman\n$exit"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
case $chosen in
    $power)
        if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
        then
            exec bluetoothctl power on
        else
            exec bluetoothctl power off
        fi
        ;;
    $marshall)
        bluetoothctl connect A0:AB:51:D2:66:B3
        ;;
    $blueman)
        blueman-manager
        ;;
    $exit)
        exit
        ;;
esac

