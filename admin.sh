#!/bin/sh
ssh-agent tmux new-session -d -s admin
ssh-add 
tmux new-window -t admin:1 -n 'onyx' 'ssh onyx zsh'
tmux new-window -t admin:2 -n 'quartz' 'ssh quartz zsh'
tmux new-window -t admin:3 -n 'fuji' 'ssh fuji zsh'
tmux new-window -t admin:4 -n 'nas' 'ssh nas zsh'
tmux new-window -t admin:5 -n 'mail' 'ssh mail zsh'
tmux new-window -t admin:6 -n 'voip' 'ssh voip zsh'
tmux new-window -t admin:8 -n 'argentum' 'ssh argentum'
tmux new-window -t admin:9 -n 'oracle10' 'ssh oracle10'

tmux select-window -t admin:1
tmux -2 attach-session -t admin
