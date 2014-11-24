#!/usr/bin/env bash

data="my-awesome-session:time_started:my-awesome-window:my-useful-pane:my-mmand:/home/su/games:353453"
values=$(getValuesVector \"$data\" 5)

#TODO check correct format
#TODO check correct output

assert_end "sqlite tests"
