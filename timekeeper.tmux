#!/usr/bin/env bash


#1 option name
#2 default value
getOption() {

	if [ $# -ne 2 ]; then
		return
	fi


	len=$(tmux show-environment "$1" 2>/dev/null | wc -l)
	if [ "$len" -eq 1 ];
		then tmux show-environment "$1" | cut -d= -f2;
		else echo "$2";
	fi
}


loadSettings() {

	TTK_LOG_DELAY=$(getOption TTK_LOG_DELAY 2);
	TTK_WRITE_DELAY=$(getOption TTK_WRITE_DELAY 10);
	TTK_PLUGIN_DIR=$(getOption TTK_PLUGIN_DIR "$HOME/.timekeeper");
	TTK_LOG_DIR=$(getOption TTK_LOG_DIR "$HOME/TTK/");
	new_STORAGE_PREFIX="$(getOption TTK_STORAGE_PREFIX "file")";




	if [ "$TTK_WRITE_DELAY" -lt "$TTK_LOG_DELAY" ]; then
		echo "Write delay cannot be shorter than Log delay: $TTK_WRITE_DELAY > $TTK_LOG_DELAY";
		return 1;
	fi

	if [ ! -f "$TTK_PLUGIN_DIR/timekeeper.tmux" ]; then
		echo "Incorrect plugin dir: $TTK_PLUGIN_DIR";
		return 1;
	fi

	if [ ! -d "$TTK_LOG_DIR" ]; then
		mkdir -p "$TTK_LOG_DIR" || echo "Log directory cannot be created: $TTK_LOG_DIR";
	fi

	if [ ! -w "$TTK_LOG_DIR" ]; then
		echo "Log dir is not writeable: $TTK_LOG_DIR";
		return 1;
	fi
	#TODO how to tell it to user if this calls plugin manager?


	#If new storage layer is different, save data first.
	if [ "$TTK_STORAGE_PREFIX" != "$new_STORAGE_PREFIX" ]; then
		endRecording
	fi

	#Saving uses $TTK_STORAGE_PREFIX, so we need to change it after saving is done
	TTK_STORAGE_PREFIX="$new_STORAGE_PREFIX";


	if [ ! -d "storage/$TTK_STORAGE_PREFIX" ]; then
		echo "Incorrect storage prefix";
		return 1;
	fi

	files=$(find "storage/$TTK_STORAGE_PREFIX/" -iname "*.sh")
		for f in $files; do
		source "$f";
	done
}


# Source all scripts
files=$(find "base_scripts/" -iname "*.sh")
for f in $files; do
	source "$f";
done

loadSettings;
