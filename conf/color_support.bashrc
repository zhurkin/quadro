#!/usr/bin/env bash

dir_colors_check() {
if [ -x /usr/bin/dircolors ]; then
    test -r ~/quadro/conf/.dircolors && eval "$(dircolors -b ~/quadro/conf/.dircolors)" || eval "$(dircolors -b)"
fi
}

alias_colors() {
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ..='cd ..'
    alias ...='cd ../..'
}

# mkdir
md() {
    mkdir -p "$@" && cd "$@";
}

if [ "$color_prompt" = yes ]; then
    alias_colors
else
   echo "Not Support colors"
fi
