#!/bin/bash

#Loads tmux config file
tmux source-file ~/magic/.tmux.conf

# tmux new-session -s $SESSION
tmux rename-session Manan

# tmux new-window
tmux rename-window 'AckScript'
tmux split-window -v
tmux split-window -h

tmux new-window
tmux rename-window 'SCV'

tmux new-window
tmux rename-window 'MISC-V'
tmux split-window -v

tmux new-window
tmux rename-window 'MISC-H'
tmux split-window -h

tmux select-window -t 0
