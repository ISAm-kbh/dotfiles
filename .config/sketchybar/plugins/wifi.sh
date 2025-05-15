#!/bin/sh

source "$HOME/.config/sketchybar/icons.sh"

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

WIFISTATUS=${INFO:-"Not Connected"}

case $WIFISTATUS in
    "Not Connected")
        sketchybar --set $NAME icon=$NOWIFI
        ;;
    *)
        sketchybar --set $NAME icon=$WIFI
        ;;
esac
