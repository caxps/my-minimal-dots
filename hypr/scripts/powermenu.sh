#!/usr/bin/env bash

# Optionen mit Nerd-Font-Icons
shutdown="  Herunterfahren"
reboot="  Neustarten"
lock="  Sperren"
suspend="  Standby"
logout="  Abmelden"

# Auswahl über dein bestehendes Rofi-Theme anzeigen
chosen=$(printf "%s\n%s\n%s\n%s\n%s" "$shutdown" "$reboot" "$suspend" "$lock" "$logout" | rofi -dmenu -i -p "Power" -theme-str 'window {width: 300px;} listview {lines: 5;}')

case "$chosen" in
    "$shutdown") systemctl poweroff ;;
    "$reboot")   systemctl reboot ;;
    "$suspend")  systemctl suspend ;;
    "$lock")     hyprlock ;;
    "$logout")   hyprctl dispatch exit ;;
esac
