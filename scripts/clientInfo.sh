clients_format="\
#{client_activity}:\
#{client_session}:\
#{client_readonly}"

tmux list-clients  -F "$clients_format" | grep ":0$" | cut -d: -f1,2
