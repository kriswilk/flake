#!/bin/env bash
set -euo pipefail

list="   Lock\n 󰤄  Suspend\n 󰜎  Log Out\n   Reboot\n   Shutdown"
dmenu="fuzzel --dmenu -l 5 -w 13 --line-height 45 --vertical-pad 20 --hide-prompt -f monospace:size=20"

case $(echo -e "$list" | $dmenu) in
  *"Lock")
    swaylock
    ;;
  *"Suspend")
    systemctl suspend
    ;;
  *"Log Out")
    niri msg action quit
    ;;
  *"Reboot")
    systemctl reboot
    ;;
  *"Shutdown")
    systemctl poweroff
    ;;
esac