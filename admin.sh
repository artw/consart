#!/bin/sh
ssh-agent tmux new-session -d -s admin
ssh-add 
tmux new-window -t admin:1 -n 'onyx' 'ssh onyx'
tmux new-window -t admin:2 -n 'quartz' 'ssh quartz'
tmux new-window -t admin:3 -n 'fuji' 'ssh fuji'
tmux new-window -t admin:4 -n 'mail' 'ssh mail'
tmux new-window -t admin:5 -n 'nas' 'ssh nas'

tmux select-window -t admin:1
tmux -2 attach-session -t admin
