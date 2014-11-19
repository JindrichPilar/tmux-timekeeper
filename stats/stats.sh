#!/usr/bin/env bash


#Get sessions with time spent
statsSessions() {
	$TTK_statsSessions;
}


#Get windows in session with time spent
#1 = session_name
statsSession() {
	$TTK_statsSession "$1";
}


#Get paths in session with time spent
#1 = session_name
statsSessionPaths() {
	$TTK_statsSessionPaths "$1";
}


#Get commands in session with time spent
#1 = session_name
statsSessionCommands() {
	$TTK_statsSessionCommands "$1";
}


#Get paths in window in session with time spent
#1 = session_name
#2 = window_name
statsSessionWindow() {
	$TTK_statsSessionWindow "$1" "$2";
}


#Get commands in window in session with time spent
#1 = session_name
#2 = window_name
statsSessionWindowCommands() {
	$TTK_statsSessionWindowCommands "$1" "$2";
}


#Get commands with time spent across all sessions and windows
statsCommands() {
	$TTK_statsCommands;
}


#Get paths with time spent accros all sessions and window
statsPaths() {
	$TTK_statsPaths;
}













