#!/bin/bash
TITLE=DISPLAY_OUTPUT_CLONE
NOTIFY_TIME=5000
EXIT_THRESHOLD=5
ARG_COUNT=1
REQUIRED_USER=$USER

source ${0%/*}/chaos-shell.sh

LABEL=SET_LVDS1_PRIMARY
xrandr --output LVDS1 --auto --primary --preferred
checkError 10
 
LABEL=SET_EXTERNAL_CLONE
xrandr --output $1 --same-as LVDS1 --auto --noprimary
checkError 10

sleep 2
command ${0%/*}/program_restartAwesome.sh
sleep 3
notify "Laptop set as primary screen, $1 set as clone"
