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

#TODO check plugin dir exists
#TODO check wete dir exists or can be created and is writeable
#TODO how to tell it to user if this calls plugin manager?

source "$TTK_PLUGIN_DIR/scripts/parser.sh";
source "$TTK_PLUGIN_DIR/scripts/save.sh";
source "$TTK_PLUGIN_DIR/scripts/run.sh";
source "$TTK_PLUGIN_DIR/stats/stats.sh";
