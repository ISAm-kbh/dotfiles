#!/bin/sh

source "$HOME/.config/sketchybar/icons.sh"

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

VOLUME=$INFO

sketchybar --set $NAME icon=$MUTED \
                 label.drawing=off

case $VOLUME in
    0)
        sketchybar --set $NAME drawing=on
        ;;
    *)
        sketchybar --set $NAME drawing=off
        ;;
esac

#case $volume in
#  [6-9][0-9]|100) icon="墳"
#  ;;
#  [3-5][0-9]) icon="奔"
#  ;;
#  [1-9]|[1-2][0-9]) icon="奄"
#  ;;
#  *) icon="婢"
#esac
