#!/bin/sh

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

#sketchybar --set $NAME background.drawing=$SELECTED

WIN=$(yabai -m query --spaces --space $SID | jq '.windows[0]')
HAS_WINDOWS="false"
if [ "$WIN" = "null" ];then
  HAS_WINDOWS="true"
fi
sketchybar --set $NAME background.drawing=$SELECTED icon.highlight=$HAS_WINDOWS
