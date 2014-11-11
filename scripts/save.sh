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


#$1 = data
getSaveCommandPath() {
	echo "$TTK_LOG_DIR/session_name/`getSessionName "$1"`/window_name/`getWindowName "$1"`/current_path/`getCurrentPath "$1"`/current_command/`getCurrentCommand "$1"`/";
}

#1 = data
getSavePaneTitlePath() {
	echo "$TTK_LOG_DIR/session_name/`getSessionName "$1"`/window_name/`getWindowName "$1"`/current_path/`getCurrentPath "$1"`/pane_title/`getPaneTitle "$1"`/";
}


#1 = data
#2 = time to add
saveLog() {
	cmdPath=`getSaveCommandPath "$1"`
	mkdir -p "$cmdPath"
	saveToFile "$cmdPath" "$2"


	titlePath=`getSavePaneTitlePath "$1"`
	mkdir -p "$titlePath"
	saveToFile "$titlePath" "$2"
}


#1 = folder
#2 = time to add
saveToFile() {
	logFile="$1/time_spent.log";

	if [ ! -f "$logFile" ]; then
		echo "$2" > "$logFile";
		return 0;
	fi


	echo "$count" > "$logFile";
}
