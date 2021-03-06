#!/bin/bash
TITLE=DISPLAY_EXTEND_RIGHT
NOTIFY_TIME=5000
EXIT_THRESHOLD=5
ARG_COUNT=1
REQUIRED_USER=$USER

source ${0%/*}/chaos-shell.sh

LABEL=SET_LAPTOP_ON
xrandr --output LVDS1 --auto
checkError 10

LABEL=SET_EXTERNAL_PRIMARY_RIGHT_EXTENDED
xrandr --output $1 --auto --primary --right-of LVDS1
checkError 10

sleep 2
command ${0%/*}/program_restartAwesome.sh
sleep 3
notify "Right screen $1 set as primary extension"
