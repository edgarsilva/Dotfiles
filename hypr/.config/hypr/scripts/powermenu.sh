#!/bin/sh

# Icons (Nerd Font compatible)
shutdown="⏻  Shutdown"
reboot="  Reboot"
suspend="󰒲  Suspend"
lock="  Lock"
logout="󰍃  Logout"
cancel="󰜺  Cancel"

options="$lock\n$suspend\n$logout\n$shutdown\n$reboot\n$cancel"

choice=$(printf "%b" "$options" | walker --dmenu - "󰐥 Power")

case "$choice" in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$lock")
        hyprctl dispatch exec "hyprlock"
        ;;
    "$logout")
        hyprctl dispatch exit
        ;;
    *)
        exit 0
        ;;
esac
