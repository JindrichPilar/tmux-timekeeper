#!/usr/bin/env bash

#$1..$n-1 Array of data
#$n Time to save
sqlite_doSaveLog() {

	dbFile=$TTK_LOG_DIR"/timelog.db"


	#Parse params
	data=("$@")
	((last_idx=${#data[@]} - 1))
	timeToSave=${data[last_idx]}
	unset data[last_idx]

	if [ ! -f "$dbFile" ]; then
		createStructure "$dbFile";
	fi


	values="()";
	for d in "${data[@]}"; do
		#TODO create big INSRT IGNORE SQL
		#run UPDATES and then INSERT
		values=$values,$(getValuesVector "$d" "$timeToSave");
	done


	sqlite3 "$dbFile" "INSERT IGNORE INTO timekeeper_log VALUES $values";
}


#$1 Data to save
#$2 Time to save
getValuesVector() {
	echo "(
		NULL,
		'$(getSessionName "$1")',
		'$(getWindowName "$1")',
		'$(getCurrentPath "$1")',
		'$(getCurrentCommand "$1")',
		'$(getPaneTitle "$1"i)',
		$2
	)";
}


#$1 file name
createStructure() {
	sqlCmd="CREATE TABLE timekeeper_log (
			id 		INTEGER PRIMARY KEY AUTOINCREMENT,
			session_name 	TEXT NOT NULL UNIQUE,
			window_name 	TEXT NOT NULL UNIQUE,
			current_path 	TEXT NOT NULL UNIQUE,
			current_command TEXT NOT NULL UNIQUE,
			pane_title 	TEXT NOT NULL UNIQUE,
			time_spent 	UNSIGNED BIG INT DEFAULT 0
			)";

	sqlite3 "$1" "$sqlCmd";

	sqlCmd="CREATE INDEX unique_log on timekeeper_log (session_name, window_name, current_path, current_command, pane_title)";
	sqlite3 "$1" "$sqlCmd"
}
