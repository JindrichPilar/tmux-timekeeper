#!/usr/bin/env bash


#Get sessions with time spent
statsSessions() {
	cmd="$TTK_STORAGE_PREFIX"statsSessions;
	$cmd;
}


#Get windows in session with time spent
#1 = session_name
statsSession() {
	cmd="$TTK_STORAGE_PREFIX"statsSession;
	$cmd "$1";
}


#Get paths in session with time spent
#1 = session_name
statsSessionPaths() {
	cmd="$TTK_STORAGE_PREFIX"statsSessionPaths;
        $cmd "$1";
}


#Get commands in session with time spent
#1 = session_name
statsSessionCommands() {
	cmd="$TTK_STORAGE_PREFIX"statsSessionCommands; 
	$cmd "$1";
}


#Get paths in window in session with time spent
#1 = session_name
#2 = window_name
statsSessionWindow() {
	cmd="$TTK_STORAGE_PREFIX"statsSessionWindow;
	$cmd "$1" "$2";
}


#Get commands in window in session with time spent
#1 = session_name
#2 = window_name
statsSessionWindowCommands() {
	cmd="$TTK_STORAGE_PREFIX"statsSessionWindowCommands;
	$cmd "$1" "$2";
}


#Get commands with time spent across all sessions and windows
statsCommands() {
	cmd="$TTK_STORAGE_PREFIX"statsCommands;
	$cmd;
}


#Get paths with time spent accros all sessions and window
statsPaths() {
	cmd="$TTK_STORAGE_PREFIX"statsPaths;
	$cmd;
}
