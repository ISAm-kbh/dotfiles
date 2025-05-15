#!/bin/sh

source "$HOME/.config/sketchybar/icons.sh"

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# Front App Icon/Title
sketchybar --set $NAME label.padding_left=3 \
    label="$INFO"
case "$INFO" in
    Firefox)
        sketchybar --set $NAME icon=$FIREFOX icon.font.size=14.0 \
                         icon.drawing=on
        ;;
    iTerm2)
        sketchybar --set $NAME icon=$TERMINAL icon.font.size=18.0 \
                         icon.drawing=on
        ;;
    Music)
        sketchybar --set $NAME icon=$MUSICAPP icon.font.size=16.0 \
                               icon.drawing=on
        ;;
    Discord)
        sketchybar --set $NAME icon=$DISCORD icon.font.size=14.0 \
                               icon.drawing=on
        ;;
    Mail | "Microsoft Outlook")
        sketchybar --set $NAME icon=$MAIL icon.font.size=14.0 \
            icon.drawing=on
        ;;
    *Steam*)
        sketchybar --set $NAME icon=$STEAM icon.font.size=14.0 \
            icon.drawing=on \
            label="Steam"
        ;;
    *)
        sketchybar --set $NAME icon.drawing=off \
            label.padding_left=8
        ;;
esac
