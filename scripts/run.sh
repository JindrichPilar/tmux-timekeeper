#!/usr/bin/env bash

DELAY=1;
OUTPUT_FILE="$HOME/asd.log"



record() {
echo "record";
  while true;
  do

    sleep "$DELAY";

    isEndOfRecording
    if [ $? -eq 0 ];
      then break;
    fi


    echo "`getActivePane`" >> "$OUTPUT_FILE"

  done
}


isEndOfRecording() {
  END_FLAG=`tmux show-environment "end_rec" | grep '=true' | wc -l`

  if [ $END_FLAG -eq 1 ];
    then return 0;
    else return 1;
  fi
}


endRecording() {
  tmux set-environment "end_rec" "true";
  echo "ended"
}


startRecording() {
  tmux set-environment "end_rec" "false";
  record &
  echo "started";
}

