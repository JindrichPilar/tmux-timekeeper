#!/usr/bin/env bash


#Save data to file
#Data structure must make possible statistics generation

#Expected tree structure (make it dotfile? Encurage use of prepared scripts)

#timekeeper_logs (dir)
#session_name (dir per each session)
#window_name (dir per each window in session)
#current_path (dir per each pane in window)
#current_command, pane_title (dirs for kinds of logs)      BEWARE: current_command and pane_title are redundant the time is stored duplicatly
#command/title (dir for each unique thing acording to its kind)
#time_spent.log (file per kind with)



#FIXME How to handle current path? We need to preserver complete path including "/home/" which results in "current_path//home". Use path as single directory -> \\? -BACKWARDS incompatible change
#$1 = data
getSaveCommandPath() {
	echo "$TTK_LOG_DIR/session_name/`getSessionName "$1"`/window_name/`getWindowName "$1"`/current_path/`getCurrentPath "$1"`/current_command/`getCurrentCommand "$1"`/";
}

#1 = data
getSavePaneTitlePath() {
	echo "$TTK_LOG_DIR/session_name/`getSessionName "$1"`/window_name/`getWindowName "$1"`/current_path/`getCurrentPath "$1"`/pane_title/`getPaneTitle "$1"`/";
}

#$1..$n-1 Array of data
#$n Time to save
file_doSaveLog() {

	data=("$@")
	((last_idx=${#data[@]} - 1))
	timeToSave=${data[last_idx]}
	unset data[last_idx]


	for d in "${data[@]}"; do
		cmdPath=`getSaveCommandPath "$d"`
		mkdir -p "$cmdPath"
		saveToFile "$cmdPath" "$timeToSave"


		titlePath=`getSavePaneTitlePath "$d"`
		mkdir -p "$titlePath"
		saveToFile "$titlePath" "$timeToSave"
	done
}


#1 = folder
#2 = time to add
saveToFile() {
	logFile="$1/time_spent.log";

	if [ ! -f "$logFile" ]; then
		echo "$2" > "$logFile";
		return 0;
	fi

	alreadySpent=`cat "$logFile"`;
	count=$((alreadySpent + $2))
	echo "$count" > "$logFile";
}

