# Tmux Timekeeper [![Build Status](https://travis-ci.org/JindrichPilar/tmux-timekeeper.svg)](https://travis-ci.org/JindrichPilar/tmux-timekeeper)

Tmux Timekeeper (TT) is automatic time tracking plugin for Terminal Multiplexer called [Tmux](http://tmux.sourceforge.net/).

## This plugin is under initial developmnet. It can and will change in backwards incompatible manner


## How it works
TT keeps an eye on what pane you are using and records time you spent in each session, window, pane, running command.


## Instalation
### With Tmux Plugin Manager (TPM)
Simply follow guide in [TPM readme](https://github.com/tmux-plugins/tpm#installing-plugins)

### By hand
* Use git to clone this repository to `~/.timekeeper`.
* Set configuration variables in ~/.tmux.conf (see **Configuration**)
* Edit `~/.tmux.conf` by adding following line at the end of file.
* Reload tmux configuration
```
source "path/to/cloned/TimeKeeperPlugin/timekeeper.tmux"
```

## Usage

### Recording time
* Start your tmux session
* Run `startRecording`
* Run `endRecording` when you want to end
You can bind these commands to key with `bind` (see [Tmux on ArchWiki](https://wiki.archlinux.org/index.php/tmux#Key_bindings)

### Showing statistics
There is number of builtin functions you can use.
* `statsSessions` Shows recorded sessions and time spent
* `statsSession "session_name"` Shows stats for session "session\_name"
* `statsSessionCommands "session_name"` Shows stats for commands in session "session\_name"
* `statsSessionPaths "session_name"` Shows stats for paths in session "session\_name"
* `statsSessionWindow "session_name" "window_name"` Shows stats for window in session
* `statsSessionWindowCommands "session_name" "window_name"` Shows stats for commands in window in session
* `statsCommands` Shows stats for all commands you ran in Tmux
* `statsPaths` Shows stats for all paths you have bin to

## Configuration
You can modify behavior of TT by setting tmux environment variables `tmux set-environment "variable" "value"`

### Possible configuration
* No configuration yet


## Technical information
* Pure SHELL (runs on linux and other posix systems)
* Installable by [plugin manager](https://github.com/tmux-plugins/tpm)
* Until Tmux implements event system TT uses infinite loop with configurable sleep

## FAQ
### How does TT stores data?
It uses directory structure and files. In future I plan on adding option to use sqlite.

### Does tracking work with non-terminal applications?
Short answer is no, it literally measures focus in tmux (in terminal). However you can start aplication from terminal and keep it running in foreground (no "nohup cmd &" or ctrl+z). And every time you want to switch to GUI apllication you first switch focust to its pane in terminal. It works, but it is easy to forget to do it and if you jump frequently to GUI app it is not really usefull. However if you don't use GUI not frequently or you spend there a lot of time(no jump back and forth between gui and terminal) it will do the job.

### Does TT work over SSH?
Yes, but you have to run tmux on remote host to track things. If you run tmux on localhost all you get is time spent on ssh. Ideally run tmux and TT on both machines.

### Can I write my own statistics functions?
Sure you can! Either by further processing output from TT's stats functions, witch would be completely forward compatible and storage agnostic (see **How does TT stores data?**. Or you can process stored data yourself. Information about how data is stored can be found in scripts/save.sh file.

### Can TT generate reports in PDF/HTML with plots?
Not yet. But it is planned in future.

### What are TT's dependencies?
Terminal and Tmux, that's it for now. In the future some optional dependencies for advanced features will be added. Like sqlite3, gnuplot/ploticus and latex.

### I don't like infinite loop. Isn't there other way?
Tmux hooks are in the works, when they are completed TT will use them instead of infinite loop.
