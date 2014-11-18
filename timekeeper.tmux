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
TTK_DO_SAVE_FUNC_PREFIX="`getOption TTK_DO_SAVE_FUNC_PREFIX "file_"`";

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

source "$TTK_PLUGIN_DIR/scripts/parser.sh";
source "$TTK_PLUGIN_DIR/scripts/save.sh";
source "$TTK_PLUGIN_DIR/scripts/file_save.sh";
source "$TTK_PLUGIN_DIR/scripts/run.sh";
source "$TTK_PLUGIN_DIR/stats/stats.sh";
