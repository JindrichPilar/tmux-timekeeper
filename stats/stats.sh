#!/usr/bin/env bash


#Stats functions
#TODO implement functions
#TODO BASH autocomplete



#Get sessions with time spent
statsSessions() {

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
statsSession() {


	if [ "$#" -ne 1 ]; then
		echo "Provide session name as single argument";
		return 2;
	fi

	sessDir="$OUTPUT_DIR/session_name/$1/window_name"
	dirs=`find "$sessDir" -type d | grep "$sessDir/[^/]*$"`

	for dir in ${dirs[*]}; do

		#Additional 0 because of last \n
		time=$(($(cat `find "$dir" -name "*.log"` | tr -s '\n' '+')0))

		msg=`echo "$dir" | rev | cut -d"/" -f1 | rev`

		#TODO add option to print in seconds (for additinal scripts)
		msg="$msg :"`displaytime $time`
		echo $msg
	done
}


#Get paths in session with time spent
#1 = session_name
statsSessionPaths() {

	if [ "$#" -ne 1 ]; then
		echo "Provide session name as single argument";
		return 2;
	fi

	sessDir="$OUTPUT_DIR/session_name/$1/window_name"
	dirs=`find "$sessDir" -type d | grep "$sessDir/[^/]*/current_path/[^/]*$"`

	for dir in ${dirs[*]}; do

		#Additional 0 because of last \n
		time=$(($(cat `find "$dir" -name "*.log"` | tr -s '\n' '+')0))

		msg=`echo "$dir" | rev | cut -d"/" -f1 | rev`

		#TODO add option to print in seconds (for additinal scripts)
		msg="$msg :"`displaytime $time`
		echo $msg
	done
}


#Get commands in session with time spent
#1 = session_name
statsSessionCommands() {
	echo "Not yet implemented";
}


#Get paths in window in session with time spent
#1 = session_name
#2 = window_name
statsSessionWindow() {
	echo "Not yet implemented";
}


#Get commands in window in session with time spent
#1 = session_name
#2 = window_name
statsSessionWindowCommands() {
	echo "Not yet implemented";
}



#Get commands with time spent across all sessions and windows
statsCommands() {
	echo "Not yet implemented";
}



#Get paths with time spent accros all sessions and window
statsPaths() {
	echo "Not yet implemented";
}


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
