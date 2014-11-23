#!/usr/bin/env bash

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


opt=$(getOption "TTK_LOG_DELAY" "5")
assert "echo $opt" 5;


stub_and_echo tmux "TTK_LOG_DELAY=123456";
opt=$(getOption "TTK_LOG_DELAY" "5")
assert "echo $opt" 123456;


assert_end "Settings tests"
