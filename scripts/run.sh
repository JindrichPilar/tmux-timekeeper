#!/usr/bin/env bash



record() {
echo "record";
  while true;
  do

    sleep "$TTK_LOG_DELAY";

    isEndOfRecording
    if [ $? -eq 0 ];
      then break;
    fi


    activePaneStr=`getActivePane`
    strC=`echo "$activePaneStr" | wc -l`
    if [ $strC -eq 0 ]; then
      return 2
    fi

    saveLog "$activePaneStr" "$DELAY"

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
