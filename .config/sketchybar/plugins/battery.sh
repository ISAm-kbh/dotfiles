#!/bin/sh

source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  9[0-9]|100) ICON=$BATFULL
  ;;
  [6-8][0-9]) ICON=$BAT75
  ;;
  [3-5][0-9]) ICON=$BATHALF
  ;;
  [1-2][0-9]) ICON=$BATQUART
  ;;
  *) ICON=$BATEMPTY
esac

if [[ $CHARGING != "" ]]; then
  ICON=$BATCHARGE
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%"
