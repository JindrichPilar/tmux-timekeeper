#!/usr/bin/env bash


#1 option name
#2 default value
getOption() {

	if [ $# -ne 2 ]; then
		return
	fi


	len=`tmux show-environment "$1" 2>/dev/null | wc -l`
	if [ $len -eq 1 ];
		then echo "`tmux show-environment $1`";
		else echo "$2";
	fi
}


TTK_LOG_DELAY=`getOption TTK_LOG_DELAY 2`
TTK_WRITE_DELAY=`getOption TTK_WRITE_DELAY 10`;
TTK_PLUGIN_DIR=`getOption TTK_PLUGIN_DIR "$HOME/.timekeeper"`;
TTK_LOG_DIR=`getOption TTK_LOG_DIR "$HOME/TTK/"`;
TTK_STORAGE_PREFIX="`getOption TTK_STORAGE_PREFIX "file"`";




if [ "$TTK_WRITE_DELAY" -lt "$TTK_LOG_DELAY" ]; then
	echo "Write delay cannot be shorter than Log delay";
	return 1;
fi

if [ ! -f "$TTK_PLUGIN_DIR/timekeeper.tmux" ]; then
	echo "Incorrect plugin dir!";
	return 1;
fi

if [ ! -w "$TTK_LOG_DIR" ]; then
	echo "Log dir is not writeable";
	return 1;
fi
#TODO how to tell it to user if this calls plugin manager?

# Source all scripts
files=`find "base_scripts/" -iname "*.sh"`
for f in $files; do
	source "$f";
done


if [ ! -d "storage/$TTK_STORAGE_PREFIX" ]; then
	echo "Incorrect storage prefix";
	return 1;
fi
files=`find "storage/$TTK_STORAGE_PREFIX/" -iname "*.sh"`
for f in $files; do
	source "$f";
done
