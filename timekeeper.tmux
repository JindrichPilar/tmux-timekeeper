#!/usr/bin/env bash


TTK_LOG_DELAY=5;
TTK_WRITE_DELAY=5;
TTK_PLUGIN_DIR="$HOME/.timekeeper";
TTK_LOG_DIR="$HOME/TTK/";


source "$TTK_PLUGIN_DIR/scripts/parser.sh";
source "$TTK_PLUGIN_DIR/scripts/save.sh";
source "$TTK_PLUGIN_DIR/scripts/run.sh";
source "$TTK_PLUGIN_DIR/stats/stats.sh";
