#!/usr/bin/env bash



record() {
echo "record";
  while true;
  do

    sleep "$TTK_LOG_DELAY";

    isEndOfRecording
    if [ $? -eq 0 ]; then
	forceSaveLog;
	break;
    fi


    activePaneStr="$(getActivePane)"
    strC=${#activePaneStr}
    if [ "$strC" -gt 1 ]; then
       saveLog "$activePaneStr" "$TTK_LOG_DELAY"
    fi

  done
}


isEndOfRecording() {
	END_FLAG=$(tmux show-environment "end_rec" | grep -c '=true')

	if [ "$END_FLAG" -eq 1 ];
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
