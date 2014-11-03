#!/usr/bin/env bash


#Stats functions
#TODO implement functions
#TODO BASH autocomplete



#Get sessions with time spent
statsSession() {

	IFS='
	'

	#$OUTPUT_DIR ends with / (TODO delete when loading config)
	dirs=`find "$OUTPUT_DIR" -type d | grep "$OUTPUT_DIR""session_name/[^/]*$"`

	for i in ${dirs[*]}; do
		#Additional 0 because of last \n
		time=$(($(cat `find "$i" -name "*.log"` | tr -s '\n' '+')0))

		msg=`echo "$i" | rev | cut -d"/" -f1 | rev`

		#TODO add option to print in seconds (for additinal scripts)
		msg="$msg :"`displaytime $time`
		echo $msg
	done
}


#Get windows in session with time spent
#1 = session_name



#Get paths in session with time spent
#1 = session_name



#Get commands in session with time spent
#1 = session_name



#Get paths in window in session with time spent
#1 = session_name
#2 = window_name



#Get commands in window in session with time spent
#1 = session_name
#2 = window_name



#Get commands with time spent across all sessions and windows



#Get paths with time spent accros all sessions and window



#Helpers
#http://unix.stackexchange.com/questions/27013/displaying-seconds-as-days-hours-mins-seconds
displaytime() {
	local T=$1
	local D=$((T/60/60/24))
	local H=$((T/60/60%24))
        local M=$((T/60%60))
	local S=$((T%60))
	[[ $D > 0 ]] && printf '%d days ' $D
	[[ $H > 0 ]] && printf '%d hours ' $H
	[[ $M > 0 ]] && printf '%d minutes ' $M
	[[ $D > 0 || $H > 0 || $M > 0 ]] && printf 'and '
	printf '%d seconds\n' $S
}
