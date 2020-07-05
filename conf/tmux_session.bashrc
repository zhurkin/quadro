#!/usr/bin/env bash

if [ ! -e "$(which tmux 2>/dev/null)" ]; then
  echo "Tmux: not found."
else
if [ $TERM != "screen" ]; then
  ( (tmux has-session -t remote && tmux attach-session -t remote) || (tmux new-session -s remote) ) && exit 0
fi
fi