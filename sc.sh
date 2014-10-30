FORMAT="\
#{session_attached}:\
#{window_active}:\
#{pane_active}:\
#{session_id}:\
#{session_name}:\
#{session_created}:\
#{window_id}:\
#{window_name}:\
#{pane_id}:\
#{pane_title}:\
#{pane_current_command}:\
#{pane_current_path}:\
#{pane_pid}"

while true;
do
sleep 1;
tmux list-panes -a -F "$FORMAT" | grep "^1:1:1:" >> tmuxtime.log
done
