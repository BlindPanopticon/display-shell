#!/bin/bash
TITLE=DISPLAY_SELECT_FORMAT
NOTIFY_TIME=5000
EXIT_THRESHOLD=5
ARG_COUNT=0
REQUIRED_USER=$USER

source ${0%/*}/chaos-shell.sh

function getDisplay {
	statement "Enter desired connected display"

	select DISPLAY_OPT in $(xrandr | grep ' connected' | awk '{ print $1 }');
	do
		if [[ -n DISPLAY_OPT ]]; then
			break;
		elif [[ $REPLAY = "q" ]]; then
			DISPLAY_OPT=""
			break;
		fi
	done
}

statement "Pick desired screen format:"

select SCRIPT in ${0%/*}/screen_*;
do
	echo $SCRIPT
	if [[ $REPLY = "q" ]]; then
		break
	elif [[ -n $SCRIPT ]]; then
                LABEL=GET_DISPLAY
                getDisplay

                LABEL=RUN_OUTPUT_SCRIPT
                command $SCRIPT $DISPLAY_OPT
 	        checkError 10
                break;
	fi
done
