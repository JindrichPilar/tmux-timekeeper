#!/usr/bin/env bash

FORMAT="\
#{session_attached}:\
#{window_active}:\
#{pane_active}:\
#{session_name}:\
#{session_created}:\
#{window_name}:\
#{pane_title}:\
#{pane_current_command}:\
#{pane_current_path}:\
#{pane_pid}"

getActivePane() {
 tmux list-panes -a -F "$FORMAT" | grep "^1:1:1:" | cut -d: -f4-
}

getSessionName() {
 echo "$1" | cut -d: -f1;
}


getWindowName() {
 echo "$1" | cut -d: -f3;
}

getPaneTitle() {
 echo "$1" | cut -d: -f4;
}

getCurrentCommand() {
 echo "$1" | cut -d: -f5;
}

getCurrentPath() {
 echo "$1" | cut -d: -f6;
}
