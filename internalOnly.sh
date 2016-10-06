#!/bin/bash
TITLE=DISPLAY_OUTPUT_LAPTOP
NOTIFY_TIME=5000
EXIT_THRESHOLD=5
ARG_COUNT=0
REQUIRED_USER=$USER

source ${0%/*}/chaos-shell.sh

LABEL=SET_LAPTOP_PRIMARY
xrandr --output LVDS1 --auto --primary
checkError 10

LABEL=SET_VGA_OFF
xrandr --output VGA1 --off
checkError 10

sleep 2
command ${0%/*}/program_restartAwesome.sh
sleep 3
notify "Laptop set as primary only screen"
