#!/usr/bin/env bash

TDATA="my-awesome-session:time_started:my-awesome-window:my-useful-pane:my-mmand:/home/su/games:353453"

assert "getSessionName $TDATA" "my-awesome-session"

assert "getWindowName $TDATA" "my-awesome-window"

assert "getPaneTitle $TDATA" "my-useful-pane"

assert "getCurrentCommand $TDATA" "my-mmand"

assert "getCurrentPath $TDATA" "/home/su/games"

assert_end "Parser tests"
