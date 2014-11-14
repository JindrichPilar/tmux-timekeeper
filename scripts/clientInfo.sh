#!/usr/bin/env bash


#Not yet used code
#First ensure there are use cases for client tracking

clients_format="\
#{client_activity}:\
#{client_session}:\
#{client_readonly}"

getClients() {
	tmux list-clients  -F "$clients_format" | grep ":0$" | cut -d: -f1,2;
}
